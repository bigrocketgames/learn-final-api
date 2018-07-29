json.(@team, :id, :fullname, :stadium_location)
json.fans @team.fan_count

json.conference do
  json.id @team.conference.id
  json.name @team.conference.name

  json.sub_sport do
    json.name @team.conference.sub_sport.name
    json.alt_season_display @team.conference.sub_sport.alt_season_display
  end
end