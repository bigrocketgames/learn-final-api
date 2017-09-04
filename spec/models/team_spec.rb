require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    it 'requires a name, mascot, and sport upon creation' do
      team = build(:team, name: nil, mascot: nil, sub_sport: nil, stadium_location: nil)

      expect(team.valid?).to eq(false)
      expect(team.errors.full_messages).to eq([
        "Sub sport must exist",
        "Name can't be blank",
        "Mascot can't be blank",
        "Stadium location can't be blank",
        "Sub sport can't be blank"
      ])
    end
  end

  context 'after_create' do
    it 'adds a fullname to the team' do
      team = create(:home_team)

      expect(team.fullname).to eq(team.name + " " + team.mascot)
    end
  end

  describe 'relationships' do
    it 'belongs to a sub_sport' do
      team = build(:team)

      expect(team.sub_sport).to_not eq(nil)
    end

    it 'has many fans through favorite teams' do
      team = create(:team)
      team.fans.create(email: "test@test.test", password: "password")
      team.fans.create(email: "test1@test.test", password: "password")

      expect(team.fans.length).to eq(2)
    end
  end
end
