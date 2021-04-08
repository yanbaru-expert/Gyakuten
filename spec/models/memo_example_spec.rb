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
require 'rails_helper'

RSpec.describe MemoExample, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
