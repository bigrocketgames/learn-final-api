json.(@team, :id, :fullname, :stadium_location, :likes)

json.sub_sport do
  json.name @team.sub_sport.name
end