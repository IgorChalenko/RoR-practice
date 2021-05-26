# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])&.authenticate(params[:password])

    if user
      session[:current_user_id] = user.id

      redirect_to root_path, success: "Hello #{user.username}"

    else
      flash[:error] = 'Wrong email or password'
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)

    redirect_to root_path, success: 'You have successfuly logout'
  end
end
