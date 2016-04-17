# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
  end

  def unsubscribed
  end

  def key_type(data)
    Paper.last.tap do |x|
      if x.word[x.goal_word]
        broadcast_room chara: data.word.last, color: data.last_color
      else
        x.update! word: x.word + data['chara'].first, last_color: data['hue_num']
        broadcast_room(is_complete: true) if x.word[x.goal_word]
      end
    end
  end

  def broadcast_room(hash = {})
    ActionCable.server.broadcast 'room_channel', hash
  end
end
