class InvitesController < ApplicationController

  def new
    @poll = current_user.own_polls.find(params[:poll_id])
  end

  def create
    @poll = current_user.own_polls.find(params[:poll_id])
    @invited_user = User.find_by(username: params[:username])
    if @invited_user && !invited?
      @poll.members << @invited_user
      redirect_to polls_path, success: "You invite #{@invited_user.username} to your poll"
    else
      render 'new'
      flash[:error] = 'User not exist or alredy invited'
    end
  end

  private
  def invited?
    @poll.memberships.where(user_id: @invited_user.id).exists?
  end

end