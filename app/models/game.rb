class Game < ApplicationRecord
  has_many :game_players
  has_many :players, through: :game_players


  def self.start(player1, player2)
    # Randomly choses who gets to be noughts or crosses
    first_turn, second_turn = [player_1, player_2].shuffle

    # Broadcast back to the players subscribed to the channel that the game has started
    ActionCable.server.broadcast "player_#{first_turn}", {action: "game_start", msg: "Battleship"}
    ActionCable.server.broadcast "player_#{second_turn}", {action: "game_start", msg: "Battleship["}

    # Store the details of each opponent
    REDIS.set("opponent_for:#{player_1}", player_2)
    REDIS.set("opponent_for:#{player_2}", player_2)
  end

  belongs_to :winner, class_name: :Player, foreign_key: :winner_id

  def loser
    loser = nil
    self.players.each do |player|
      if self.winner != player
        loser = player
      end
    end
    loser
  end
end
