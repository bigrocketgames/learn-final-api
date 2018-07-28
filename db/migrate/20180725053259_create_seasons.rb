class CreateSeasons < ActiveRecord::Migration[5.1]
  def change
    create_table :seasons do |t|
      t.string :year
      t.string :alt_display

      t.timestamps
    end
  end
end
