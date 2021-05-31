class Poll < ApplicationRecord
  belongs_to :user
  has_many :memberships, class_name: 'PollMembership'
  has_many :members, through: :memberships, inverse_of: :user, class_name: 'User'

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
