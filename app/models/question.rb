# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  content    :text
#  position   :integer
#  solution   :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :integer
#
# Foreign Keys
#
#  fk_rails_...  (genre_id => genres.id)
#

class Question < ApplicationRecord
  acts_as_list
  validates :title, presence: true
  validates :content, presence: true
  validates :solution, presence: true
  belongs_to :genre, optional: true
end
