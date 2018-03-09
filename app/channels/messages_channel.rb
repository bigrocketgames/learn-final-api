class MessagesChannel < ApplicationCable::Channel
  def subscribed
    chatRoom = ChatRoom.find(params[:chatRoom_id])
    stream_for chatRoom
  end

  def unscubscribed
  end
end