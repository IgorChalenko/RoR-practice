class PasswordResetController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    ResetPasswordMailer.reset(@user).deliver_later if @user
    redirect_to root_path, success: I18n.t('success.reset_password')
  end
end
