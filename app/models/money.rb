# == Schema Information
#
# Table name: money
#
#  id         :bigint           not null, primary key
#  content    :text
#  genre      :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Money < ApplicationRecord
end
