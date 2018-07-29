class ChangeTableTeams < ActiveRecord::Migration[5.1]
  def change
    change_table :teams do |t|
      t.remove :sub_sport_id
      t.integer :conference_id
    end
  end
end
