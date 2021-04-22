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
FactoryBot.define do
  factory :memo_example do
    content { "MyText" }
    remark { "MyString" }
  end
end
