# frozen_string_literal: true

FactoryBot.define do
  sequence :vote_option do |n|
    "option#{n}"
  end
end

FactoryBot.define do
  factory :poll_option, class: PollOption do
    poll { nil }
    vote_option
  end
end