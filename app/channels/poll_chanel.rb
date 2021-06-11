class PollChannel < ApplicationCable::Channel

  def subscribed
    poll = Poll.find(params[:id])
    stream_for poll

  end

end