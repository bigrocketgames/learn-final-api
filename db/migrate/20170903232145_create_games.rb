class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.datetime :game_time
      t.integer :home_team_id
      t.integer :away_team_id
      t.string :location
      t.timestamps
    end
  end
end
