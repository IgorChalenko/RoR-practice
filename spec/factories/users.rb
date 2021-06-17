# frozen_string_literal: true

FactoryBot.define do
  sequence :email do |n|
    "user#{n}@mail.com"
  end
  sequence :username do |n|
    "user#{n}"
  end
end

FactoryBot.define do
  factory :user, class: User do
    username 
    email
    password { '123456' }
    password_confirmation { '123456' }
  end
end
