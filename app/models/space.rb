class Space < ApplicationRecord
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

end
