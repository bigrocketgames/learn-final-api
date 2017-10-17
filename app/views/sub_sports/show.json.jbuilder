  json.(@sub_sport, :id, :name, :conference_split)

  json.sport do
    json.name @sub_sport.sport.name
  end