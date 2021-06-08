class VotesController < ApplicationController

  def new
    @poll = current_user&.polls.find(params[:poll_id])
  end

  def create
    @poll = current_user&.polls.find(params[:poll_id])
    @poll.options.new(params[:vote_option])
    if @poll.save
      redirect_to poll_path(@poll.id), success: "Success"
    else 
      render :show
    end
  end
end