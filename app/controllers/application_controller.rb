# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_session, :current_user

  def current_session
    @current_session = Session.find_by(token: cookies['_session_id']) unless defined? @current_session
    @current_session
  end

  def current_user
    current_session&.user
  end
end
