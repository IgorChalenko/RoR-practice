class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])&.authenticate(params[:password])

    if user
      session = user.sessions.create!(token: SecureRandom.uuid)

      cookies['_session_id'] = {
        value: session.token,
        path: '/',
        secure: false,
        httponly: true
      }

      redirect_to root_path, notice: "Hello #{user.username}"

    else
      flash[:error] = 'Wrong email or password'
      render :new
    end
  end

  def destroy
    @user = current_user
    current_session&.destroy
    cookies['_session_id'] = {
      value: '',
      max_age: -1,
      path: '/',
      secure: false,
      httponly: true
    }

    redirect_to root_path
  end
end
