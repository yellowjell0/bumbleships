class Ship < ApplicationRecord
  belongs_to :player

  def self.create_fleet(player)
    fleet = []
    lengths = [2,3,3,4,5]
    lengths.each do |length|
      fleet << Ship.create(length: length, player: player, sunk: false)
    end
    fleet
  end












  
end
