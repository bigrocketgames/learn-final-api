json.array! @conferences do |conference|
  json.(conference, :id, :name)

  json.sub_sport do
    json.id conference.sub_sport.id
    json.name conference.sub_sport.name
  end
end