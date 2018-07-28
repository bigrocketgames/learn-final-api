class AddSeasonToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :season_id, :integer
  end
end
