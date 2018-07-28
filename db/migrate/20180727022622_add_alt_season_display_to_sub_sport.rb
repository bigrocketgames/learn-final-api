class AddAltSeasonDisplayToSubSport < ActiveRecord::Migration[5.1]
  def change
    add_column :sub_sports, :alt_season_display, :boolean
  end
end
