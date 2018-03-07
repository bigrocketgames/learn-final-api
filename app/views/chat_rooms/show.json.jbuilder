json.chatRoom do
  json.roomName @chatRoom.roomName
  json.game_id @chatRoom.game_id
end

json.messages do
  json.array! @chatRoom.messages do |message|
    json.content message.content
    json.userEmail message.user.email
  end
end