# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "user#{n}@mail.com"
  end
end

FactoryBot.define do
  factory :user, class: User do
    username { 'test_user' }
    email { generate :email }
    password { '' }
  end
end
