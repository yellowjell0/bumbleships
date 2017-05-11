class Space < ApplicationRecord
  extend Coordinatable
  belongs_to :board

  validate :status_is_valid
  validates :coordinate, presence: true, length: {is: 2}

  def status_is_valid
    if !["empty", "ship", "miss","hit"].include?(status)
      errors.add(:status, 'invalid status, try [empty, ship, miss,hit]')
    end
  end
  #move this to the initialize method of board???
  def self.create_spaces(board)
    status = "empty"
    coordinates = self.coordinate_helper
    coordinates.each do |coordinate|
      board.spaces << Space.create(status: status, coordinate: coordinate)
      board.save
    end
  end

  #move this to board.spaces each then add coordinates to that?
  def self.coordinate_helper
    nums = (0..9).to_a
    coordinates = []
    nums.each do |x|
      nums.each do |y|
        coordinates << "#{x}#{y}"
      end
    end
    coordinates
  end

  def self.guessed?(user_coordinate)
    p user_coordinate
    p coordinate = parse_coordinate(user_coordinate)
    space = Space.find_by(coordinate: parse_coordinate(user_coordinate))
    (space.status == 'miss') || (space.status == 'hit')
  end

  def self.has_ship?(user_coordinate)
    space = self.find_by(coordinate: parse_coordinate(user_coordinate))
    (space.status == 'ship') || (space.status == 'hit')
  end

  def self.receive_guess(user_coordinate)
    space = self.find_by(coordinate: parse_coordinate(user_coordinate))
    if space.status == 'empty'
      space.status = 'miss'
    elsif space.status == 'ship'
      space.status = 'hit'
    end
  end

  def self.add_ship(user_coordinate)
    space = self.find_by(coordinate: parse_coordinate(user_coordinate))
    if space.status == 'empty'
      space.status = 'ship'
    end
  end

end
