class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.string :status
      t.string :coordinate
      t.integer :ship_id
      t.integer :board_id
      t.timestamps
    end
  end
end
