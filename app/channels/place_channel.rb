# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class PlaceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "place_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast 'place_channel', message: data['message']
  end
end
