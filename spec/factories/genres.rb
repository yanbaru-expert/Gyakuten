# == Schema Information
#
# Table name: genres
#
#  id             :bigint           not null, primary key
#  color          :string
#  position       :integer
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  genre_group_id :bigint           not null
#
# Indexes
#
#  index_genres_on_genre_group_id  (genre_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (genre_group_id => genre_groups.id)
#
FactoryBot.define do
  factory :genre do
    genre_group { nil }
    title { "MyString" }
    color { "MyString" }
  end
end
