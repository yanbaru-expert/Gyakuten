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
FactoryBot.define do
  factory :genre do
    genre_group { nil }
    title { "MyString" }
    color { "MyString" }
  end
end
