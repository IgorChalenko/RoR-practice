# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  add_flash_types :success
  add_flash_types :error

  rescue_from ActionPolicy::Unauthorized do |_ex|
    redirect_to root_path, error: I18n.t('flash.error.policy')
  end

  def current_user
    current_session_expire
    @current_user = User.find_by(id: session[:current_user_id]) unless defined? @current_user
    @current_user
  end

  def current_session_expire
    current_session = session[:expire_at]
    current_time = Time.current
    session.delete(:current_user_id) if current_session && current_session < current_time
  end
end
