# == Schema Information
#
# Table name: genre_groups
#
#  id         :bigint           not null, primary key
#  position   :integer
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :genre_group do
    title { "MyString" }
    text_display { false }
    movie_display { false }
  end
end
