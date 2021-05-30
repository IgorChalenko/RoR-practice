# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail to: @user.email, subject: I18n.t('reset_password.reset.subject')
  end
end
