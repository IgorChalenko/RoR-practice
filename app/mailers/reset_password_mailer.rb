class ResetPasswordMailer < ApplicationMailer
  def reset(user)
    @user = user
    @token = user.to_global_id(purpose: 'password_resset', expires_in: 15.minutes)
    mail to: @user.email, subject: I18n.t('subject.password_reset_subject')
  end
end
