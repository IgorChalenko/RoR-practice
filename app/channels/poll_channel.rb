class PollChannel < ApplicationCable::Channel

  def subscribed
    @poll = Poll.find(params[:id])
    stream_from @poll
    # stream_from "poll_channel"
  end

  def receive(data)
    ActionCable.server.broadcast_to(@poll, data)
  end

end 