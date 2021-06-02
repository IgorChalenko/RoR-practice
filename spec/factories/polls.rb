# frozen_string_literal: true

FactoryBot.define do
  factory :poll, class: Poll do
    title { 'title' }
    description { 'description'}
    start_date { Date.current}
    end_date { Date.tomorrow }
  end
end