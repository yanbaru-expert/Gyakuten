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
FactoryBot.define do
  factory :genre do
    genre_group { nil }
    title { "MyString" }
    color { "MyString" }
  end
end
