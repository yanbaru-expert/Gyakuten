# == Schema Information
#
# Table name: design_task_categories
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string           not null
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe DesignTaskCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
