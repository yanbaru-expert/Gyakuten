# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  code_name  :string
#  color      :string
#  name       :string           not null
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_genres_on_code_name  (code_name) UNIQUE
#
class Genre < ApplicationRecord
  acts_as_list
  COLOR_REGEX = /\A#[0-9a-f]{6}\z/.freeze
  FRONT = %w[html js ts react vue angular].freeze
  RUBY = %w[basic git ruby rails].freeze
  LIVE = %w[talk live].freeze
  MONEY = %w[money_marketing money_lstep money_insta].freeze
  DESIGN = %w[design_base design_matter design_usage design_task].freeze
  MARKETING = %w[mind].freeze
  IN_GENERAL = (MARKETING + MONEY + LIVE + ["invisible"]).freeze

  validates :name, presence: true
  validates :color, format: { with: COLOR_REGEX }

  has_many :movies, dependent: :nullify
  has_many :texts, dependent: :nullify
  has_many :questions, dependent: :nullify
  has_many :user_roles, dependent: :destroy

  def self.permit_genre(code_name)
    (pluck(:code_name) - ["invisible"]).include?(code_name)
  end

  def self.valid_code_name(code_name)
    permit_genre(code_name) ? code_name : nil
  end

  scope :convert_display_name, lambda { |code_name|
    code_name.present? ? Genre.find_by(code_name: code_name).name : "Ruby/Rails"
  }

  def self.personal_data(completed_count_data, count_data)
    genres = Genre.where(id: count_data.keys).order(:position)
    genres.map do |genre|
      total_count = count_data[genre.id] || 0
      current_count = completed_count_data[genre.id] || 0
      percent = total_count.zero? ? 0 : current_count * 100 / total_count
      {
        genre: genre.name,
        color: genre.color,
        total: total_count,
        current: current_count,
        percent: percent
      }
    end
  end
end
