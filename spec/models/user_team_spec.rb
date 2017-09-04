require 'rails_helper'

RSpec.describe UserTeam, type: :model do
  describe 'validations' do
    it 'requires a team_id and user_id' do
      user_team = build(:user_team, fan_id: nil, team_id: nil)

      expect(user_team.valid?).to eq(false)
      expect(user_team.errors.full_messages).to eq([
        "Fan must exist", 
        "User must exist", 
        "Fan can't be blank", 
        "Team can't be blank"
      ])
    end
  end
end
