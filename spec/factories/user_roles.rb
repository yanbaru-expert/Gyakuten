# == Schema Information
#
# Table name: user_roles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_roles_on_genre_id              (genre_id)
#  index_user_roles_on_user_id               (user_id)
#  index_user_roles_on_user_id_and_genre_id  (user_id,genre_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (genre_id => genres.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :user_role do
    user { nil }
    genre { nil }
  end
end
