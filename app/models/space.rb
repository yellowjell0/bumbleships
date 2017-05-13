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

  def self.create_spaces(board)
    status = "empty"
    coordinates = self.coordinate_helper
    coordinates.each do |coordinate|
      board.spaces << Space.create(status: status, coordinate: coordinate)
      board.save
    end
  end

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

  def self.guessed?(user_coordinate, board)
    space = self.find_by(coordinate: parse_coordinate(user_coordinate), board: board)
    (space.status == 'miss') || (space.status == 'hit')
  end

  def self.has_ship?(user_coordinate, board)
    space = self.find_by(coordinate: parse_coordinate(user_coordinate), board: board)
    (space.status == 'ship') || (space.status == 'hit')
  end

  def self.receive_guess(user_coordinate, player)
  space = player.attack_spaces.where(coordinate: user_coordinate)
    # space = self.find_by(coordinate: user_coordinate, board: board)

    if space[0].status == 'empty'
      space[0].status = 'miss'
      space[0].save
    elsif space[0].status == 'ship'
      space[0].status = 'hit'
      space[0].save
    end
  end

  def self.add_ship(user_coordinate, board)
    space = self.find_by(coordinate: parse_coordinate(user_coordinate), board: board)
    if space.status == 'empty'
      space.status = 'ship'
      space.save
    end
  end

end
