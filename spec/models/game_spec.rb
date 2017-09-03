require 'rails_helper'

RSpec.describe Game, type: :model do
  before(:each) do
    @sport = create(:sport)
    @sub_sport = create(:sub_sport, sport_id: @sport.id)
    @home_team = create(:home_team, sub_sport_id: @sub_sport.id)
    @away_team = create(:away_team, sub_sport_id: @sub_sport.id)
    @home_team1 = create(:spare_home_team, sub_sport_id: @sub_sport.id)
    @away_team1 = create(:spare_away_team, sub_sport_id: @sub_sport.id)
    @game = create(:game, home_team_id: @home_team.id, away_team_id: @away_team.id)
    @game1 = build(:game, home_team_id: nil, away_team_id: nil, game_time: nil)
    @game2 = create(:game, home_team_id: @home_team1.id, away_team_id: @away_team1.id, location: "Seattle, WA")
  end

  describe 'validations' do
    it 'requires game_time, home_team_id, and away_team_id' do
      
      # expect(@game.valid?).to eq(true)
      expect(@game1.valid?).to eq(false)
      expect(@game1.errors.full_messages).to eq([
        "Home team must exist", 
        "Away team must exist", 
        "Game time can't be blank", 
        "Home team can't be blank", 
        "Away team can't be blank"
      ])
    end

    it 'does not allow duplicate games to be created' do
      @game3 = build(:game, home_team_id: @home_team.id, away_team_id: @away_team.id)

      expect(@game3.valid?).to eq(false)
    end
  end
end
