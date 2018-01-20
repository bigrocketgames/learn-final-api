json.(@team, :id, :fullname, :stadium_location, :fans)

json.sub_sport do
  json.name @team.sub_sport.name
end