# frozen_string_literal: true

class ResetPasswordController < ApplicationController
  def new
    authorize! User, to: :create?
  end

  def create
    authorize! User, to: :create?
    @user = User.find_by(email: params[:email])

    ResetPasswordMailer.reset(@user).deliver_later if @user
    redirect_to root_path, success: I18n.t('success.reset_password')
  end

  def edit
    authorize! User, to: :edit?
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, error: I18n.t('error.token_expire')
  end

  def update
    authorize! User, to: :update?
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
