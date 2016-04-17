# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'room_channel'
  end

  def unsubscribed
  end

  def key_type(data)
    Paper.last.tap { |x| x.update! word: x.word + data['chara'].first, last_color: data['hue_num'] }
  end
end
