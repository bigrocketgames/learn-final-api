  json.(@sub_sport, :id, :name, :conference_split)

  json.teams @sub_sport.teams, :id, :fullname, :fans
  
  json.sport do
    json.name @sub_sport.sport.name
  end