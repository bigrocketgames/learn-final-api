
  json.(@sub_sport, :id, :name)
  json.teams @sub_sport.teams, :id, :fullname