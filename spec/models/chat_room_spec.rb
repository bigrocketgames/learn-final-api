require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  before(:each) do
    @sport = create(:sport)
    @sub_sport = create(:sub_sport, sport_id: @sport.id)
    @home_team = create(:home_team, sub_sport_id: @sub_sport.id)
    @away_team = create(:away_team, sub_sport_id: @sub_sport.id)
    @game = create(:game, home_team_id: @home_team.id, away_team_id: @away_team.id)
    @user = create(:user)
    @chatRoom = create(:chat_room, game_id: @game.id)
  end

  describe 'validations' do
    it 'requires roomName and game_id' do
      @chatRoom1 = build(:chat_room, roomName: nil, game_id: nil)

      expect(@chatRoom.valid?).to eq(true)
      expect(@chatRoom1.valid?).not_to eq(true)
      expect(@chatRoom1.errors.full_messages).to eq([
        "Game must exist",
        "Roomname can't be blank",
        "Game can't be blank"
      ])
    end
  end

  describe 'relationships' do
    it 'belongs to a game' do
      expect(@chatRoom.game.id).to eq(@game.id)
    end

    it 'has many messages' do
      @chatRoom.messages.create(content: "Hello", user_id: @user.id, chat_room_id: @chatRoom.id)
      @chatRoom.messages.create(content: "Hello?", user_id: @user.id, chat_room_id: @chatRoom.id)

      expect(@chatRoom.messages.length).to eq(2)
    end
  end
end
