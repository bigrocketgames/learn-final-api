json.chatRoom do
  json.id @chatRoom.id
  json.roomName @chatRoom.roomName
  json.game_id @chatRoom.game_id
end

json.messages do
  json.array! @chatRoom.messages do |message|
    json.id message.id
    json.content message.content
    json.user message.user.email
    json.createdAt message.created_at
  end
end