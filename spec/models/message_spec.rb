require 'rails_helper'

RSpec.describe Message, type: :model do
  before(:each) do
    @sport = create(:sport)
    @sub_sport = create(:sub_sport, sport_id: @sport.id)
    @home_team = create(:home_team, sub_sport_id: @sub_sport.id)
    @away_team = create(:away_team, sub_sport_id: @sub_sport.id)
    @game = create(:game, home_team_id: @home_team.id, away_team_id: @away_team.id)
    @user = create(:user)
    @chatRoom = create(:chat_room, game_id: @game.id)

    @message = create(:message, user_id: @user.id, chat_room_id: @chatRoom.id)
  end

  describe 'validations' do
    it 'requires content, user_id, and chat_room_id' do
      @message1 = build(:message, user_id: nil, chat_room_id: nil)
      expect(@message.valid?).to eq(true)
      expect(@message1.valid?).not_to eq(true)
      expect(@message1.errors.full_messages).to eq([
        "Chat room must exist",
        "User must exist",
        "Chat room can't be blank",
        "User can't be blank"
      ])
    end
  end

  describe 'relationships' do
    it 'belongs to a user' do
      expect(@message.user.id).to eq(@user.id)
    end

    it 'belongs to a chat_room' do
      expect(@message.chat_room.id).to eq(@chatRoom.id)
    end
  end
end
