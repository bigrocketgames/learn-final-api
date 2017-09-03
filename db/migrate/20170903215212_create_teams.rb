class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :mascot
      t.string :fullname
      t.string :stadium_location
      t.integer :sub_sport_id
      t.timestamps
    end
  end
end
