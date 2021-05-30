# frozen_string_literal: true

class ResetPasswordMailer < ApplicationMailer
  def reset(user)
    @user = user
    @token = @user.signed_id(purpose: 'password_reset', expires_in: 15.minutes)
    mail to: @user.email, subject: I18n.t('user_mailer.welcome.subject')
  end
end
