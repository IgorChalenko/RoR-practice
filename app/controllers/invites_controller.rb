class InvitesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do 
    render :new
    flash[:error] = 'User not found'
  end

  def new
    @poll = Poll.find(params[:poll_id])
    authorize! @poll, to: :invite?
  end

  def create
    @poll = Poll.find(params[:poll_id])
    authorize! @poll, to: :invite?
    @invited_user = User.where(username: params[:query]).or(User.where(email: params[:query])).take!
      if !invited?
        @poll.members << @invited_user
        redirect_to polls_path, success: "You invite #{@invited_user.username} to your poll"
      else
        render :new
        flash[:error] = 'User alredy invited'
      end 
  end

  private
  def invited?
    @poll.memberships.where(user_id: @invited_user.id).exists?
  end

end