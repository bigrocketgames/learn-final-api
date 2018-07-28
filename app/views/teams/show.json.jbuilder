json.(@team, :id, :fullname, :stadium_location)
json.fans @team.fan_count

json.sub_sport do
  json.name @team.sub_sport.name
  json.alt_season_display @team.sub_sport.alt_season_display
end