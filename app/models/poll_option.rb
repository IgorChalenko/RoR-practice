class PollOption < ApplicationRecord
  has_many :voting, through: :memberships, source: :user, foreign_key: 'user_id'
  has_many :polls, through: :memberships, foreign_key: 'poll_id'
  belongs_to :poll

end
