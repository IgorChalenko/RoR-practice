# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    authorize! User, to: :create?
    @user = User.new
  end

  def create
    authorize! User, to: :create?
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcom(@user).deliver_later
      redirect_to root_url, success: 'Account was successfully created'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
