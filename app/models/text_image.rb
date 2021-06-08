class TextImage < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :image, TextImageUploader
end
