# frozen_string_literal: true

class ResetPasswordMailer < ApplicationMailer
  def reset
    @token = params[:user].signed_id(purpose: 'password_reset', expires_in: 15.minutes)
    mail to: params[:user].email, subject: I18n.t('subject.password_reset_subject')
  end
end
