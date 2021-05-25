# frozen_string_literal: true

class UsersController < ApplicationController
  authorize :session
  def new
    authorize! :session, to: :create?
    @user = User.new
  end

  def create
    authorize! :session, to: :create?
    @user = User.new(user_params)
    if @user.save

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
