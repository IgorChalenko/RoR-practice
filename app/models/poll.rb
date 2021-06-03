class Poll < ApplicationRecord
  belongs_to :user
  has_many :memberships, class_name: 'PollMembership'
  has_many :members, through: :memberships, source: :user

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  scope :upcoming, -> { where('start_date > ?', Date.today) }
  scope :active, -> { where('start_date <= ? and end_date >= ?', Date.today, Date.today) }
  scope :ended, -> { where('end_date < ?', Date.today) }
end
