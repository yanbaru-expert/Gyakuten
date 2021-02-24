# == Schema Information
#
# Table name: texts
#
#  id          :bigint           not null, primary key
#  contents    :text
#  description :string
#  image       :string
#  position    :integer
#  title       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  genre_id    :integer
#
# Foreign Keys
#
#  fk_rails_...  (genre_id => genres.id)
#

class Text < ApplicationRecord
  acts_as_list
  mount_uploader :image, ImageUploader
  include GenreSearch

  has_many :read_texts, dependent: :destroy
  has_many :movies
  belongs_to :genre, optional: true

  PER_PAGE = 10

  # 作成時にジャンルごとに整頓する機能
  after_create do
    texts = Text.includes(:genre).order("genres.position ASC").order(:position)
    texts.each.with_index(1) do |text, index|
      text.insert_at(index) if text.position != index
    end
  end

  # 読破済みのデータ
  def self.read_text_data(user)
    read_texts_count_data = user.read_through_texts.visible_group.group(:genre_id).count
    texts_count_data = Text.visible_group.group(:genre_id).count
    Genre.personal_data(read_texts_count_data, texts_count_data)
  end
end
