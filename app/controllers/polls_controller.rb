class PollsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do 
    redirect_to polls_path, error: I18n.t('flash.poll.not_found')
  end

  def index
    authorize! Poll, to: :index?  
    @active = current_user.polls.active
    @upcoming = current_user.polls.upcoming
    @ended = current_user.polls.ended
  end

  def show
    @poll = Poll.find(params[:id])
    authorize! @poll, to: :show?
    @options = @poll.options
    @members = @poll.members.count
    ActionCable.server.broadcast(@poll, { body: "This Room is Best Room." })
  end

  def new
    authorize! Poll, to: :create?
    @poll = Poll.new
    2.times { @poll.options.build }
  end

  def create
    authorize! Poll, to: :create?
    @poll = current_user.own_polls.new(poll_params)
    if @poll.save 
      @poll.members << current_user
      redirect_to polls_path, success: I18n.t('flash.poll.create')
    else
      render :new
    end
  end

  def edit
    @poll = Poll.find(params[:id])
    @options = @poll.options
    authorize! @poll, to: :update?
  end

  def update
    @poll = Poll.find(params[:id])
    authorize! @poll, to: :update?
    
    if @poll.update(poll_params)
      redirect_to poll_path(@poll.id), success: I18n.t('flash.poll.update')
    else
      render :new
    end
  end

  def destroy
    @poll = Poll.find(params[:id])
    authorize! @poll, to: :destroy?
    @poll.destroy
    redirect_to polls_path, success: I18n.t('flash.poll.deleted')
  end


  private

  def poll_params
    params.require(:poll).permit(:title, :description, :start_date, :end_date, options_attributes: [:id, :vote_option, :_destroy])
  end
end
