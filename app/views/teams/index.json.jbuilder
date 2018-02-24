json.array! @teams do |team|
  json.(team, :id, :fullname, :stadium_location)

  json.fans team.fan_count

  json.sub_sport do
    json.name team.sub_sport.name
  end
end