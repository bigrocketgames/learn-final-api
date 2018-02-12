require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it 'requires content, user_id, and chat_room_id' do
      # user = create(:user)
      # chatRoom = create(:chat_room)

      @message = create(:message)
      expect(@message.valid?).to eq(true)
    end
  end

  describe 'relationships' do
    pending 'it belongs to a user'

    pending 'it belongs to a chat_room'
  end
end
