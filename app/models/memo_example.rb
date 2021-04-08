# == Schema Information
#
# Table name: memo_examples
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  position   :integer
#  remark     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MemoExample < ApplicationRecord
  validates :content, presence: true
end
