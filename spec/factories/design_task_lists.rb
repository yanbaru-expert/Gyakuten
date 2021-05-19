# == Schema Information
#
# Table name: design_task_lists
#
#  id                        :bigint           not null, primary key
#  body                      :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  design_task_categories_id :bigint
#
# Indexes
#
#  index_design_task_lists_on_design_task_categories_id  (design_task_categories_id)
#
# Foreign Keys
#
#  fk_rails_...  (design_task_categories_id => design_task_categories.id)
#
FactoryBot.define do
  factory :design_task_list do
    
  end
end
