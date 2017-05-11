class Ship < ApplicationRecord
  include Coordinatable
  belongs_to :player

  def self.create_fleet(player)
    fleet = []
    lengths = [2,3,3,4,5]
    lengths.each do |length|
      fleet << Ship.create(length: length, player: player, sunk: false)
    end
    fleet
  end

  def position
    @position = []
  end

  def position=(coordinates)
    @position = coordinates
  end

  def can_place?(start_coordinates, direction)
    possible_coordinates = create_ship_coordinates(start_coordinates, direction)
    check_if_valid?(possible_coordinates)
  end

  def create_ship_coordinates(start_coordinates, direction)
    coordinates = helper.parse_coordinate(start_coordinate)
    possible_spaces =[]
    if direction == "up"
      self.length.times{|i| possible_spaces << get_x(coordinates).to_s + (get_y(coordinates)-i).to_s}
    elsif direction == "down"
      self.length.times{|i| possible_spaces << get_x(coordinates).to_s + (get_y(coordinates)+i).to_s}
    elsif direction == "left"
      self.length.times{|i| possible_spaces << (get_x(coordinates)-i).to_s + get_y(coordinates).to_s}
    elsif direction == "right"
      self.length.times{|i| possible_spaces << (get_x(coordinates)+i).to_s + get_y(coordinates).to_s}
    else
      "direction is not valid"
    end
    possible_spaces
  end

end
