json.array! @games do |game|
  json.(game, :id, :game_time, :location)
  json.home_team game.home_team, :id, :fullname
  json.away_team game.away_team, :id, :fullname
  json.chatRoomId game.chat_room.id
end