class VotesController < ApplicationController

  def update
    @poll = current_user.polls.find(params[:poll_id])
    @option = @poll.options.find(params[:option_id])
    authorize! @poll, to: :vote?
    
    if @poll.memberships.update(poll_option_id: @option.id)
      redirect_to @poll, success: 'Successfully voted'
    else
      render :show
    end
  end
end