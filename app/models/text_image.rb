class TextImage < ApplicationRecord
  belongs_to :user, optional: true
end
