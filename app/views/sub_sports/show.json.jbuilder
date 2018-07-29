  json.(@sub_sport, :id, :name, :conference_split, :alt_season_display)

  json.conferences @sub_sport.conferences do |conference|
    json.name conference.name

    json.teams conference.teams do |team|
      json.id team.id
      json.fullname team.fullname
      json.fans team.fan_count
    end

  end

  json.sport do
    json.name @sub_sport.sport.name
  end