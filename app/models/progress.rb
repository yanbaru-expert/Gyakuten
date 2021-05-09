# == Schema Information
#
# Table name: progresses
#
#  id                :bigint           not null, primary key
#  path_name         :string
#  progressable_type :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  progressable_id   :bigint
#
# Indexes
#
#  index_progresses_on_progressable_type_and_progressable_id  (progressable_type,progressable_id)
#
class Progress < ApplicationRecord
  belongs_to :progressable, polymorphic: true
end
