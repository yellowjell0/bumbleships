class Ship < ApplicationRecord
  belongs_to :player
  has_many :spaces
end
