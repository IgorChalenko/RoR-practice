# frozen_string_literal: true

# The User class
class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+]+@[a-z\d]+\.[a-z]+\z/i

  has_secure_password
  has_many :own_polls, dependent: :destroy, class_name: 'Poll'
  has_many :memberships, class_name: 'PollMembership', foreign_key: "user_id"
  has_many :polls, through: :memberships, source: :poll
  

  validates :username, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
