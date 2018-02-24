json.(@userTeam, :id, :user_id)

json.team do
  json.id @userTeam.team.id
  json.fullname @userTeam.team.fullname
  json.fans @userTeam.team.fan_count
end