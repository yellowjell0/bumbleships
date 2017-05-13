class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'game_channel'
  end

  def unsubscribed

  end

  def message(data)
    ActionCable.server.broadcast "game_channel", message: data['message']
  end
end
