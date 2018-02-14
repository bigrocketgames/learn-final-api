class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    chatRoom = ChatRoom.find(params[:chatRoom_id])
    stream_for chatRoom
  end
end