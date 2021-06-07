# == Schema Information
#
# Table name: design_task_lists
#
#  id                      :bigint           not null, primary key
#  body                    :text             not null
#  position                :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  design_task_category_id :bigint           not null
#
# Indexes
#
#  index_design_task_lists_on_design_task_category_id  (design_task_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (design_task_category_id => design_task_categories.id)
#
require 'rails_helper'

RSpec.describe DesignTaskList, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
