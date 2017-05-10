class Player < ApplicationRecord
  has_many :game_players
  has_many :games, through: :game_players
  has_many :ships
  has_one :board
  has_many :spaces, through: :board
end
