  json.(@sub_sport, :id, :name, :conference_split)

  json.teams @sub_sport.teams do |team|
    json.id team.id
    json.fullname team.fullname
    json.fans team.fan_count
  end
  
  json.sport do
    json.name @sub_sport.sport.name
  end