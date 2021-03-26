# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  code_name  :string
#  color      :string
#  name       :string           not null
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_genres_on_code_name  (code_name) UNIQUE
#
require "rails_helper"

RSpec.describe Genre, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
