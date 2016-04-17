class PaperBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast 'room_channel', chara: data.word.last, color: data.last_color
  end
end
