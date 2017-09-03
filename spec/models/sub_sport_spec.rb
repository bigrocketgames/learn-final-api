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
end
