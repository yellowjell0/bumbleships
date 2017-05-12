class Player < ApplicationRecord
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


end
