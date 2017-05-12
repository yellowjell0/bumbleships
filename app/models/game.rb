class Game < ApplicationRecord
  has_many :game_players
  has_many :players, through: :game_players
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
