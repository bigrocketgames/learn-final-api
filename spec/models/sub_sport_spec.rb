require 'rails_helper'

RSpec.describe SubSport, type: :model do
  describe 'validations' do
    it 'requires a name, conference_split, and sport_id' do
      subSport = create(:sub_sport)
      subSport1 = build(:sub_sport, name: nil, conference_split: nil, sport_id: nil)

      expect(subSport.valid?).to eq(true)
      expect(subSport1.valid?).to eq(false)
      expect(subSport1.errors.full_messages).to eq([
        "Sport must exist", 
        "Name can't be blank", 
        "Sport can't be blank",
        "Conference split can't be blank"
      ])
    end
  end

  describe 'relationships' do
    it 'belongs to a sport' do
      subSport = create(:sub_sport)

      expect(subSport.sport.id).to_not eq(nil)
    end

    it 'has many teams' do
      subSport = create(:sub_sport)
      team1 = create(:home_team, sub_sport_id: subSport.id)
      team2 = create(:away_team, sub_sport_id: subSport.id)

      expect(subSport.teams.length).to eq(2)
    end
  end
end
