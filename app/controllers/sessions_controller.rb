class SessionsController < ApplicationController

  def new
    session = Session.new
  end

  def create
    user = User.find_by(email: params[:email])&.authenticate(params[:password])

    if user
      session = user.sessions.create!(token: SecureRandom.uuid)
  
    cookies['_session_id'] = { 
      value: session.token,
      expires: 24.hour,
      path: '/',
      secure: false,
      httponly: true,
      }

    redirect_to root_path, notice: "Hello #{ params[:username] }" 

    else 
      flash[:error] = 'Wrong email or password'
      render :new
    end

  end

  def destroy
  end


end