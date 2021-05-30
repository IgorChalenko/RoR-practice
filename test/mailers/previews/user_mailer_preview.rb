# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome
    UserMailer.welcome(User.last)
  end
end
