class PollChannel < ApplicationCable::Channel

  def subscribed
    stream_from "poll_#{params[:room]}"
  end

  def speak(data)
    ActionCable.server.broadcast("poll_#{params[:room]}", { message: data["message"] })
  end
end 