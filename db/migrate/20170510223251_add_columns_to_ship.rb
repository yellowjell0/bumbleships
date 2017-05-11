class AddColumnsToShip < ActiveRecord::Migration[5.0]
  def change
    add_column :ships, :start_coordinate, :string
    add_column :ships, :direction, :string
  end
end
