json.array! @teams do |team|
  json.(team, :id, :fullname, :stadium_location)

  json.fans team.fan_count

  json.conference team.conference_id
end