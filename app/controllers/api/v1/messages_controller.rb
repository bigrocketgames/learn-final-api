class Api::V1::MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.save
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_room_id, :user_id)
  end

end