json.array! @sports do |sport|
  json.(sport, :id, :name)

  json.sub_sports sport.sub_sports, :id, :name
end