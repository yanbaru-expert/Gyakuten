# == Schema Information
#
# Table name: design_task_categories
#
#  id         :bigint           not null, primary key
#  img        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :design_task_category do
    name { "MyString" }
    img { "MyString" }
  end
end
