# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  desc       :text
#  position   :integer
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :integer
#  text_id    :integer
#
# Foreign Keys
#
#  fk_rails_...  (genre_id => genres.id)
#

FactoryBot.define do
  factory :movie do
    sequence(:title) {|n| "#{n}_#{Faker::University.name}" }
    sequence(:url) {|n| "#{n}_#{Faker::Commerce.department}" }
    sequence(:genre) {|n| "#{n}_#{Faker::Business.credit_card_type}" }
  end
end
