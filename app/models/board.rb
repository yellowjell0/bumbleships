class Board < ApplicationRecord
  belongs_to :player
  has_many :spaces

  def self.generate_player_game(player)
    board = Board.create(player: player)
    Ship.create_fleet(player)
    Space.create_spaces(board)
  end
end
