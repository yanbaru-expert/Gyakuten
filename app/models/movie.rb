# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  desc       :text
#  position   :integer
#  title      :text
#  url        :text
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
  YOUTUBE_REGEX = %r{\Ahttps://www.youtube.com/embed/[^?&"'>]+\z}.freeze
  acts_as_list

  validates :title, presence: true
  validates :url, presence: true
  has_many :watched_movies, dependent: :destroy
  belongs_to :text, optional: true
  belongs_to :genre, optional: true

  before_save do
    format_url = YoutubeUrlFormatter.format(url)
    if format_url.present?
      self.url = format_url
    else
      self.errors.add(:url, "YouTubeのURL以外は無効です")
    end
  end

  # 作成時にジャンルごとに整頓する機能
  # ライブ系の動画は作成日時降順に並び替える
  after_create do
    general_movies = Movie.general_group.order(:position)
    live_movies = Movie.live_group.order(created_at: :desc)
    (general_movies + live_movies).each.with_index(1) do |movie, index|
      movie.insert_at(index) if movie.position != index
    end
  end

  # 視聴済みのデータを取得
  def self.watched_movie_data(user)
    watched_movies_count_data = user.watched_through_movies.visible_group.group(:genre_id).count
    movies_count_data = Movie.visible_group.group(:genre_id).count
    Genre.personal_data(watched_movies_count_data, movies_count_data)
  end
end
