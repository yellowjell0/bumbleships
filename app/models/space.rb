class Space < ApplicationRecord
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

  #Change status methods
  #is_empty?
  #has_shot?
    #regardless of hit or miss so that user knows that it cannot choose it again
  #has_ship?
    #to check what its status will be once it has been hit
  #get_shot
    #depending on if it has_ship change status of space
  #add_ship
    #change status from empty to ship

end
