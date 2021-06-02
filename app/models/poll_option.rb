class PollOption < ApplicationRecord
  belongs_to :poll
  accepts_nested_attributes_for :poll, allow_destroy: true
  
end
