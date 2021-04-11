# == Schema Information
#
# Table name: memos
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_memos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Memo < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: true
  validates :content, length: { maximum: 30000 } 
end
