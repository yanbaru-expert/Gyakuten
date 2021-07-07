# == Schema Information
#
# Table name: lectures
#
#  id          :bigint           not null, primary key
#  description :string
#  lp_url      :string
#  name        :string
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Lecture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
