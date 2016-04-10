# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class VibesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'vibes_channel'
  end

  def unsubscribed
  end

  def send_vibes(data)
    ActionCable.server.broadcast 'vibes_channel', data
  end
end
