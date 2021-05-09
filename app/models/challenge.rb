# == Schema Information
#
# Table name: challenges
#
#  id         :bigint           not null, primary key
#  hint       :text
#  image      :string
#  position   :integer
#  question   :text             not null
#  theme      :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Challenge < ApplicationRecord
  acts_as_list
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :theme, presence: true
  validates :question, presence: true
  has_many :progresses, as: :progressable
  # has_many :complete_challenges, dependent: :destroy
end
