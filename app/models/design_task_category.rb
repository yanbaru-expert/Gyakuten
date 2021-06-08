# == Schema Information
#
# Table name: design_task_categories
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string           not null
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DesignTaskCategory < ApplicationRecord
  acts_as_list
  has_many :design_task_lists, dependent: :destroy
  mount_uploader :image, DesignTaskImageUploader

  validates :name, presence: true
end
