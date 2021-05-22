# == Schema Information
#
# Table name: design_task_categories
#
#  id         :bigint           not null, primary key
#  img        :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DesignTaskCategory < ApplicationRecord
  has_many :design_task_lists, dependent: :destroy
end
