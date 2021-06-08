# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  approval_at            :datetime
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

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, :recoverable
  validates :slack_id, presence: true, uniqueness: true
  validates :slack_name, presence: true
  has_many :watched_movies, dependent: :destroy
  has_many :read_texts, dependent: :destroy
  has_many :complete_challenges, dependent: :destroy
  has_one :memo, dependent: :destroy
  has_many :progresses, dependent: :destroy
  has_many :read_through_texts, through: :progresses, source: :materiable, source_type: "Text"
  has_many :watched_through_movies, through: :progresses, source: :materiable, source_type: "Movie"

  def self.permit_slack_name(slack_name)
    selectable_slack_name_options.values.include?(slack_name)
  end

  scope :selectable_slack_name_options, lambda {
    slack_names_i18n.except(:yanbaru_code, :yanbaru_code_offline, :other).invert
  }

  enum slack_name: {
    marketing: 7,
    yanbaru_expert_ruby: 2,
    yanbaru_expert_ruby_light: 3,
    yanbaru_expert_php: 5,
    yanberu_expert_design: 6,
    yanbaru_code: 1,
    yanbaru_code_offline: 4,
    other: 0
  }
end
