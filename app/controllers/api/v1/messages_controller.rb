class API::V1::MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)

    if @message.save
      build_message(@message)
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