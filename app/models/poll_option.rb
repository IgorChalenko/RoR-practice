class PollOption < ApplicationRecord
  has_many :memberships, dependent: :nullify, class_name: 'PollMembership'

  belongs_to :poll, counter_cache: :vote_count

end
