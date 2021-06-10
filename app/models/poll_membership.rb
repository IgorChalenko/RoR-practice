class PollMembership < ApplicationRecord
  belongs_to :user
  belongs_to :poll
  belongs_to :poll_option, dependent: :destroy, optional: true
end
