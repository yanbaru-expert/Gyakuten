# == Schema Information
#
# Table name: lectures
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  lp_url      :string
#  name        :string           not null
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :lecture do
    position { 1 }
    name { "MyString" }
    lp_url { "MyString" }
    description { "MyString" }
  end
end
