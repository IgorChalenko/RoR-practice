# frozen_string_literal: true

class ApplicationController < ActionController::Base
  
  rescue_from ActionPolicy::Unauthorized do |ex|
    redirect_to root_path, error: "You cant do that"
  end

  helper_method :current_user

  add_flash_types :success
  add_flash_types :error

  def current_user
    current_session_expire
    @current_user ||= session[:current_user_id] &&
                      User.find_by(id: session[:current_user_id])

  end

  def current_session_expire
    current_session = session[:expire_at]
    current_time = Time.current
    if current_session < current_time
      session.delete(:current_user_id)
    end  

  end

end
