# == Schema Information
#
# Table name: text_images
#
#  id         :bigint           not null, primary key
#  image      :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_text_images_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class TextImage < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :image, TextImageUploader
end
