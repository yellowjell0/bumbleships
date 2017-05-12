class Player < ApplicationRecord

  has_one :game, foreign_key: :winner_id
  has_many :game_players
  has_many :games, through: :game_players
  has_many :ships
  has_one :board
  has_many :spaces, through: :board

  # def player_1(player)
  #   session[:player_1] ||= player
  # end

  # def player_2(player)
  #   session[:player_2] ||= player
  # end

  # def remove_player_1
  #   session[:player_1] = nil
  # end

  # def remove_player_2
  #   session[:player_2] = nil
  # end

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
