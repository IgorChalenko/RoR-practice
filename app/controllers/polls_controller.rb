class PollsController < ApplicationController
  def new
    authorize! Poll, to: :create?
    @poll = Poll.new
  end
end
