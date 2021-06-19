class PollChannel < ApplicationCable::Channel

  def subscribed
    stream_from "poll_channel"
  end

  def speak(data)
    ActionCable.server.broadcast "poll_channel", { message: data["message"] }
  end
end 