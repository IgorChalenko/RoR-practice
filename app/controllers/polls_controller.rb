class PollsController < ApplicationController
  def new
    authorize! Poll, to: :create?
    @poll = current_user.own_polls.new
  end
end
