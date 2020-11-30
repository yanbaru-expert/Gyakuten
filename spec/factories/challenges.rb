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
FactoryBot.define do
  factory :challenge do
    title { "MyString" }
    question { "MyText" }
    hint { "MyText" }
    image { "MyString" }
  end
end
