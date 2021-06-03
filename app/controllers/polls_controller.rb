class PollsController < ApplicationController
  def index
    @owned_polls = current_user.own_polls
    # authorize! @owned_polls, to: :show?
  end

  def show
    @poll = current_user.own_polls.find_by(id: params[:id])
    # authorize! @poll, to: :show?
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

  def edit
    @poll = current_user.own_polls.find_by(id: params[:id])
  end

  def update
    # @poll = current_user.own_polls.find_by(id: params[:id])
    @poll.update(poll_params)
    if @poll.save
      redirect_to poll_path(@poll.id), success: 'Poll successfylly updated'
    else
      render :new
    end
  end

  def destroy
    @poll = current_user.own_polls.find_by(id: params[:id])
    @poll.destroy
    redirect_to polls_path, success: 'Your poll deleted'
  end

  private

  def poll_params
    params.require(:poll).permit(:title, :description, :start_date, :end_date)
  end
end
