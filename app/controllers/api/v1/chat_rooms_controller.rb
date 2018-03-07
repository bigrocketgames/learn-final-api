class Api::V1::ChatRoomsController < ApplicationController

  def show
    # get the chat room based on the chat room path
    @chatRoom = ChatRoom.find(params[:id])
    # render the json of the chat room through jbuilder
    render 'chat_rooms/show.json.jbuilder', chatRoom: @chatRoom
  end

  def create

  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:roomName, :game_id)
  end

end