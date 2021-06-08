# == Schema Information
#
# Table name: progresses
#
#  id              :bigint           not null, primary key
#  materiable_type :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  materiable_id   :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_progresses_on_materiable_type_and_materiable_id  (materiable_type,materiable_id)
#  index_progresses_on_user_id                            (user_id)
#  progresses_index                                       (user_id,materiable_id,materiable_type) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe Progress, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
