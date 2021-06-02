class PollsController < ApplicationController
  
  def index
    @owned_polls = current_user.own_polls
  end

  def show
    @pol = current_user.own_polls.find_by(id: params[:id])
  end

  def new
    authorize! Poll, to: :create?
    @poll = Poll.new
  end

  def create
    authorize! Poll, to: :create?
    @poll = current_user.own_polls.new(poll_params)
    if @poll.save
      redirect_to polls_path, success: 'Poll created'
    else 
      render :new
    end
  end



  private
  def poll_params
    params.require(:poll).permit(:title, :description, :start_date, :end_date)
    
  end
end
