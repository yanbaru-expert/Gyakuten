module ProgressMateriable
  extend ActiveSupport::Concern

  included do
    belongs_to :genre, optional: true
    has_many :progresses, dependent: :destroy, as: :materiable
  end

  def completed_by(user)
    progresses.any? { |progress| progress.user_id == user.id }
  end
end
