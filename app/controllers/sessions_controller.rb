class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])&.authenticate(params[:password])

    if user
      session[:current_user_id] = user.id

      flash[:success] = "Hello #{user.username}"
      redirect_to root_path

    else
      flash[:error] = 'Wrong email or password'
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    flash[:success] = 'You have successfuly logout'
    @current_user = nil
    redirect_to root_path
  end
end
