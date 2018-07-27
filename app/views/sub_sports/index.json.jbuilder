json.array! @sub_sports do |sub_sport|
  json.(sub_sport, :id, :name, :conference_split, :alt_season_display)

  json.sport do
    json.name sub_sport.sport.name
  end
end