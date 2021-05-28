# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    authorize! :session, to: :create?
  end

  def create
    authorize! :session, to: :create?
    user = User.find_by(email: params[:email])&.authenticate(params[:password])

    if user
      session[:current_user_id] = user.id
      session[:expire_at] = params[:remember_me] && 24.hours.from_now || 30.minutes.from_now
      redirect_to root_path, success: I18n.t('success.log_in', user_name: user.username)

    else
      flash[:error] = I18n.t('error.log_in')
      render :new
    end
  end

  def destroy
    authorize! :session, to: :destroy?
    session.delete(:current_user_id)

    redirect_to root_path, success: I18n.t('success.log_out')
  end
end
