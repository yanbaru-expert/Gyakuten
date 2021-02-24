# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  color      :string
#  position   :integer
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Genre < ApplicationRecord
  CONVERT_LIST = {
    "Basic" => 1,
    "Git" => 2,
    "Ruby" => 3,
    "Rails" => 4,
    "PHP" => 5,
    "HTML&CSS" => 6,
    "JavaScript" => 7,
    "TypeScript" => 8,
    "React" => 9,
    "Vue" => 10,
    "Angular" => 11,
    "AWS" => 12,
    "Money" => 13,
    "Talk" => 14,
    "Live" => 15,
    "Invisible" => 16,
  }.freeze

  acts_as_list
  COLOR_REGEX = /\A#[0-9a-f]{6}\z/.freeze
  validates :title, presence: true
  validates :color, format: { with: COLOR_REGEX }

  has_many :movies
  has_many :texts
  has_many :questions

  scope :front, -> { where(id: 6..11).order(:position) }
  scope :ruby, -> { where(id: 1..4).order(:position) }
  scope :php, -> { where(id: 6).order(:position) }
  scope :react, -> { where(id: 9).order(:position) }
  scope :vue, -> { where(id: 10).order(:position) }
  scope :angular, -> { where(id: 11).order(:position) }
  scope :aws, -> { where(id: 12).order(:position) }

  scope :general, -> { where.not(id: 13..16).order(:position) }
  scope :live, -> { where(id: 13..15).order(:position) }

  scope :invisible, -> { where(id: 16).order(:position) }
  scope :visible, -> { where.not(id: 16).order(:position) }

  def self.permit_genre(genre)
    (self::CONVERT_LIST.keys - ["Invisible"]).include?(genre)
  end

  scope :search_ids, ->(genre) {
    permit_genre(genre) ? [Genre::CONVERT_LIST[genre]] : Genre.ruby.ids
  }

  scope :search_genre, ->(genre) {
    permit_genre(genre) ? Genre.find(Genre::CONVERT_LIST[genre]).title : "Ruby/Rails"
  }

  def self.personal_data(completed_count_data, count_data)
    genres = Genre.where(id: count_data.keys).order(:position)
    genres.map do |genre|
      total_count = count_data[genre.id] || 0
      current_count = completed_count_data[genre.id] || 0
      percent = total_count.zero? ? 0 : current_count * 100 / total_count
      {
        genre: genre.title,
        color: genre.color,
        total: total_count,
        current: current_count,
        percent: percent,
      }
    end
  end
end
