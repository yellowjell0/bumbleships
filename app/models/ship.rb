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
    @position ||= get_spaces_from_coordinates(start_coordinate, direction)
  end

  def position=(coordinates)
    @position = coordinates
  end

  def sunk?
    self.position.all? {|space| space.status == "hit"}
  end

  def set_ship(start_coordinate, direction)
    start_coordinate = parse_coordinate(start_coordinate)
    if can_place?(start_coordinate, direction)
      self.start_coordinate = parse_coordinate(start_coordinate)
      self.direction = direction
      @position = get_spaces_from_coordinates(start_coordinate, direction)
    else
      false
    end
  end

  def get_spaces_from_coordinates(start_coordinate, direction)
    coordinates = create_ship_coordinates(start_coordinate, direction)
    occupied_spaces = []
    coordinates.each do |coordinate|
      space = Space.find_by(coordinate: coordinate, board: self.player.board)
      space.status = "ship"
      space.save
      occupied_spaces << space
    end
    occupied_spaces
  end

  def can_place?(start_coordinate, direction)
    directions = ["up", "down", "left", "right"]
    if directions.include?(direction) && start_coordinate.length == 2
      possible_coordinates = create_ship_coordinates(start_coordinate, direction)
      check_if_valid?(possible_coordinates)
    else
      false
    end
  end

  def create_ship_coordinates(start_coordinate, direction)
    coordinates = start_coordinate
    possible_spaces =[]
    if direction == "right"
      self.length.times{|i| possible_spaces << "#{get_x(coordinates)}#{(get_y(coordinates)+i)}"}
    elsif direction == "left"
      self.length.times{|i| possible_spaces << "#{get_x(coordinates)}#{(get_y(coordinates)-i)}"}
    elsif direction == "up"
      self.length.times{|i| possible_spaces << "#{(get_x(coordinates)-i)}#{get_y(coordinates)}"}
    elsif direction == "down"
      self.length.times{|i| possible_spaces << "#{(get_x(coordinates)+i)}#{get_y(coordinates)}"}
    else
      "direction is not valid"
    end
    possible_spaces
  end

end
