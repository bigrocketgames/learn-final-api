require 'rails_helper'

RSpec.describe "Api::V1::Teams", Type: :request do

  describe "get /teams/:team_id/schedule" do
    it "returns the team and the teams's games" do
      sport = Sport.create(
        name: "Football"
      )

      sub_sport = SubSport.create(
        name: "NFL",
        sport_id: sport.id,
        conference_split: true
      )

      @team1 = Team.create(
        name: "Seattle",
        mascot: "Seahawks",
        stadium_location: "Seattle, WA",
        sub_sport_id: sub_sport.id
      )

      @team2 = Team.create(
        name: "Oakland",
        mascot: "Raiders",
        stadium_location: "Oakland, CA",
        sub_sport_id: sub_sport.id
      )

      game1 = Game.create(
        game_time: Time.now,
        home_team_id: @team1.id,
        away_team_id: @team2.id
      )

      game2 = Game.create(
        game_time: Time.now,
        home_team_id: @team2.id,
        away_team_id: @team1.id
      )

      get "/api/v1/teams/#{@team1.id}/schedule"

      binding.pry
    end
  end

end