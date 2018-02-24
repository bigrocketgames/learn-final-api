class API::V1::ChatRoomController < ApplicationController

  def show
    # get the chat room based on the chat room path
    
    # render the json of the chat room through jbuilder
  end

  def create

  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:roomName, :game_id)
  end

end