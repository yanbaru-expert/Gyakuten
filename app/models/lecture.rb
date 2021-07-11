# == Schema Information
#
# Table name: lectures
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  lp_url      :string
#  name        :string           not null
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Lecture < ApplicationRecord
  acts_as_list

  validates :name, presence: true
  validates :description, presence: true
end
