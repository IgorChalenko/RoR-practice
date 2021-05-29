# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail to: @user.email, subject: I18n.t('subject.registration_subject')
  end
end
