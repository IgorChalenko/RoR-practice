class UserMailer < ApplicationMailer
  def welcom(user)
    @user = user
    mail to: @user.email, subject: 'Registration succesfully done'
  end
end