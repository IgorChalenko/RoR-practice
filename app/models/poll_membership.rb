class PollMembership < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :poll, foreign_key: 'poll_id'
end
