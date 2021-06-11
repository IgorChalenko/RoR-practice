class Poll < ApplicationRecord
  belongs_to :user
  has_many :memberships, class_name: 'PollMembership', foreign_key: "poll_id"
  has_many :members, -> { distinct }, through: :memberships, source: :user, dependent: :destroy
  has_many :options, class_name: "PollOption", dependent: :destroy

  accepts_nested_attributes_for :options, allow_destroy: true, reject_if: :blank_option?
  

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_before_start_date

  scope :upcoming, -> { where('start_date > ?', Date.today) }
  scope :active, -> { where('start_date <= ? and end_date >= ?', Date.today, Date.today) }
  scope :ended, -> { where('end_date < ?', Date.today) }

  private  
  def end_date_before_start_date
    return if start_date.blank? || end_date.blank?

    errors.add(:end_date, "can't be earlier than start date ") if end_date <= start_date
  end
  
  def blank_option?
    lambda {|attributes| attributes['vote_option'].blank?}
  end

end
