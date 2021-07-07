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
class Lecture < ApplicationRecord
end
