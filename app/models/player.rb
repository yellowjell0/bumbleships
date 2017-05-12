class Player < ApplicationRecord
  has_many :game_players
  has_many :games, through: :game_players
  has_many :ships
  has_one :board
  has_many :spaces, through: :board
  has_one :game, foreign_key: :winner_id

  def attack_spaces
    game = self.games.last
    other_player = nil
    game.players.each do |player|
      if player != self
        other_player = player
      end
    end
    other_player.spaces
  end

  def attack_ships
    game = self.games.last
    other_player = nil
    game.players.each do |player|
      if player != self
        other_player = player
      end
    end
    other_player.ships
  end


end
