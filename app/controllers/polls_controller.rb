class PollsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do 
    redirect_to polls_path, error: I18n.t('flash.poll.not_found')
  end

  def index
    authorize! Poll, to: :index?  
    @active = current_user.own_polls.active
    @upcoming = current_user.own_polls.upcoming
    @ended = current_user.own_polls.ended
  end

  def show
    @poll = current_user.own_polls.find(params[:id])
    authorize! @poll, to: :show?
  end

  def new
    authorize! Poll, to: :create?
    @poll = Poll.new
  end

  def create
    authorize! Poll, to: :create?
    @poll = current_user.own_polls.new(poll_params)
    if @poll.save
      redirect_to polls_path, success: I18n.t('flash.poll.create')
    else
      render :new
    end
  end

  def edit
    @poll = current_user.own_polls.find(params[:id])
  end

  def update
    @poll = current_user.own_polls.find(params[:id])
    @poll.update(poll_params)
    if @poll.save
      redirect_to poll_path(@poll.id), success: I18n.t('flash.poll.update')
    else
      render :new
    end
  end

  def destroy
    @poll = current_user.own_polls.find(params[:id])
    @poll.destroy
    redirect_to polls_path, success: I18n.t('flash.poll.deleted')
  end


  private

  def poll_params
    params.require(:poll).permit(:title, :description, :start_date, :end_date)
  end
end
