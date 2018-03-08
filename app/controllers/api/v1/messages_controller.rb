class API::V1::MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    chatRoom = ChatRoom.find(message_params[:chat_room_id])

    if message.save
      @message = build_message(message)
      ChatRoomChannel.broadcast_to chatRoom, @message
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_room_id, :user_id)
  end

  def build_message
    Jbuilder.new do |message|
      message.(self, :content, :user_id)
    end
  end

end