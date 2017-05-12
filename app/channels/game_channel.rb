class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "player_#{uuid}"
    # Seek.create(uuid)
  end

  def unsubscribed
    Seek.remove(uuid)
  end

  def message(data)

  end
end
