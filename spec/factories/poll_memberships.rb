# frozen_string_literal: true

FactoryBot.define do
  factory :membership, class: PollMembership do
    poll 
    user 
    poll_option { nil }
  end
end