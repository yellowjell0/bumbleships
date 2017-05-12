class ChangeColumnWinnerOnGames < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :winner
    add_column :games, :winner_id, :integer
  end
end
