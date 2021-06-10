class VotesController < ApplicationController

  def create
    @poll = current_user.polls.find(params[:poll_id])
    @options = @poll.options
    @vote = PollMembership.new(user_id: current_user.id, poll_id: @poll.id, poll_option_id: params[:poll_option_id])
    if @vote.save
      redirect_to poll_path(@poll.id), success: 'Successfully voted'
    else
      render :show
    end
  end
end