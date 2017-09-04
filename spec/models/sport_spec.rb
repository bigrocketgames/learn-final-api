require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'validations' do
    it 'Requires a sport name' do
      sport = build(:sport, name: nil)

      expect(sport.valid?).to eq(false)
    end

    it 'requires that each sport name be unique' do
      sport = create(:sport)
      sport1 = build(:sport)

      expect(sport1.valid?).to eq(false)
      expect(sport1.errors.full_messages).to eq([
        "Name has already been taken"
      ])
    end
  end

  describe 'relationships' do
    it 'has many sub sports' do
      sport = create(:sport)
      sport.sub_sports.create(name: "NFL", conference_split: true)
      sport.sub_sports.create(name: "NCAAF", conference_split: true)

      expect(sport.sub_sports.length).to eq(2)
    end
  end
end
