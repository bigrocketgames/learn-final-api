class CreateConferences < ActiveRecord::Migration[5.1]
  def change
    create_table :conferences do |t|
      t.string :name
      t.integer :sub_sport_id

      t.timestamps
    end
  end
end
