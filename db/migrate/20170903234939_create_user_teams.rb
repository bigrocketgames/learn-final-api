class CreateUserTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :user_teams do |t|
      t.integer :fan_id
      t.integer :team_id
      t.timestamps
    end
  end
end
