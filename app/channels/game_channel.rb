class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "player_#{uuid}"
  end

  def unsubscribed

  end

  def message(data)
   k ActionCable.server.broadcast "game_channel", message: data['message']

  end
end
