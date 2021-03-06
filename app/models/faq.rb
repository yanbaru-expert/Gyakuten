# == Schema Information
#
# Table name: faqs
#
#  id         :bigint           not null, primary key
#  answer     :string
#  position   :integer
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Faq < ApplicationRecord
  acts_as_list
  validates :question, presence: true
  validates :answer, presence: true
end
