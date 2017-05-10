class Space < ApplicationRecord
  belongs_to :board
  belongs_to :ship

  validate :status_is_valid
  validates :coordinate, presence: true, length: {is: 2}

  def status_is_valid
    if !["empty", "ship", "miss","hit"].include?(status)
      errors.add(:status, 'invalid status, try [empty, ship, miss,hit]')
    end
  end
end
