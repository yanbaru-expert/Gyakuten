# == Schema Information
#
# Table name: faqs
#
#  id         :bigint           not null, primary key
#  answer     :string
#  genre      :integer          default("invisible")
#  position   :integer
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Faq, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
