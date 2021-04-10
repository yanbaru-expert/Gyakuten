# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  approval_at            :datetime         default(Sun, 14 Mar 2021 06:51:12 JST +09:00)
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  flag                   :boolean          default(FALSE)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  slack_name             :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  slack_id               :string           not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slack_id              (slack_id) UNIQUE
#

require "rails_helper"

RSpec.describe User, type: :model do
end
