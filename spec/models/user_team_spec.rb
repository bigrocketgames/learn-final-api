require 'rails_helper'

RSpec.describe UserTeam, type: :model do
  describe 'validations' do
    it 'requires a team_id and user_id' do
      user_team = build(:user_team, user_id: nil, team_id: nil)

      expect(user_team.valid?).to eq(false)
      expect(user_team.errors.full_messages).to eq([
        "User must exist", 
        "Team must exist", 
        "User can't be blank", 
        "Team can't be blank"
      ])
    end
  end

  describe 'relationships' do
    it 'belongs to a user' do
      user_team = create(:user_team)

      expect(user_team.user.id).to_not eq(nil)
    end

    it 'belongs to a team' do
      user_team = create(:user_team)

      expect(user_team.team.id).to_not eq(nil)
    end
  end
end
