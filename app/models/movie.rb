# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  desc       :text
#  position   :integer
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :integer
#  text_id    :integer
#
# Foreign Keys
#
#  fk_rails_...  (genre_id => genres.id)
#

class Movie < ApplicationRecord
  include GenreSearch
  include ProgressMateriable

  acts_as_list

  YOUTUBE_REGEX = %r{\Ahttps://www.youtube.com/embed/[^?&"'>]+\z}.freeze
  SELECT_COLUMNS = "movies.*, genres.code_name, genres.name, genres.color".freeze
  PER_PAGE = 18

  validates :title, presence: true
  validates :url, presence: true
  belongs_to :text, optional: true

  before_save do
    format_url = YoutubeUrlFormatter.format(url)
    if format_url.present?
      self.url = format_url
    else
      errors.add(:url, "YouTubeのURL以外は無効です")
    end
  end

  # 作成時にジャンルごとに整頓する機能
  after_create do
    movies = Movie.general_group + Movie.live_group + Movie.money_group
    movies.each.with_index(1) do |movie, index|
      movie.insert_at(index) if movie.position != index
    end
  end

  def self.fetch_from(code_name, page)
    if code_name.nil?
      ruby_group.page(page).per(PER_PAGE).select(SELECT_COLUMNS)
    else
      search_group(code_name).page(page).per(PER_PAGE).select(SELECT_COLUMNS)
    end
  end

  # 視聴済みのデータを取得
  def self.watched_movie_data(user)
    invisible_genre_id = Genre.find_by(code_name: "invisible")
    watched_movies_count_data = user.watched_through_movies.where.not(genre_id: invisible_genre_id).group(:genre_id).count
    movies_count_data = Movie.where.not(genre_id: invisible_genre_id).group(:genre_id).count
    Genre.personal_data(watched_movies_count_data, movies_count_data)
  end
end
