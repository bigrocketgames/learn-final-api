class CreateSubSports < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_sports do |t|
      t.string :name
      t.integer :sport_id
      t.boolean :conference_split
      t.timestamps
    end
  end
end
