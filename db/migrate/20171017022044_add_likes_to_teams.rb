class AddLikesToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :likes, :integer, default: 0
  end
end
