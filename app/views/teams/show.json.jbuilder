json.team do
  json.id @team.id
  json.fullname @team.fullname
  json.stadium_location @team.stadium_location
  json.fans @team.fan_count
end

json.sub_sport do
  json.name @team.sub_sport.name
end