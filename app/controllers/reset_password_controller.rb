# frozen_string_literal: true

class PasswordResetController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    ResetPasswordMailer.with(user: @user).reset.deliver_later if @user
    redirect_to root_path, success: I18n.t('success.reset_password')
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, error: I18n.t('error.token_expire')
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    @user.update(password_params)
    if @user.save
      redirect_to login_path, success: I18n.t('success.update')
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
