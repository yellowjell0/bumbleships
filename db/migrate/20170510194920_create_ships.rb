class CreateShips < ActiveRecord::Migration[5.0]
  def change
    create_table :ships do |t|
      t.integer :length
      t.boolean :sunk
      t.integer :player_id

      t.timestamps
    end
  end
end
