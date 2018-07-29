class RemoveLikesFromTeams < ActiveRecord::Migration[5.1]
  def change
    change_table :teams do |t|
      t.remove :likes
    end
  end
end
