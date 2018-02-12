require 'rails_helper'

RSpec.describe "Api::V1::SubSports", Type: :request do

  before(:each) do
    @user = User.create(
      email: "test@test.com",
      password: "password",
      admin: true
    )

    @sport = Sport.create(
      name: "football"
    )

    @token = Auth.create_token(@user.id)
  end


  describe "POST /sub_sports" do
    before (:each) do

      @subsport_params = {
        sub_sport: {
          name: "NFL",
          sport_id: @sport.id,
          conference_split: true
        }
      }

      post "/api/v1/sub_sports",
      params: @subsport_params.to_json,
      headers: { 
        'Content-Type': 'application/json',
        'Authorization': "Bearer: #{@token}"
      }

      @response = response

    end

    describe "on success" do
      
      it "creates a new sub_sport from the params" do
        expect(SubSport.all.count).to eq(1)
      end

      it "returns the new sub_sport" do
        body = JSON.parse(@response.body)

        expect(response.status).to eq(200)
        expect(body['name']).to eq("NFL")
        expect(body['sport']['name']).to eq("football")
        expect(body['conference_split']).to eq(true)
      end

    end

    describe "on error" do

      it "does not create a new sub sport without params" do
        params = {
          sub_sport: {
            name: '',
            sport_id: nil,
            conference_split: nil
          }
        }

        post "/api/v1/sub_sports",
        params: params.to_json,
        headers: { 
          'Content-Type': 'application/json',
          'Authorization': "Bearer: #{@token}"
        }

        body = JSON.parse(response.body)

        expect(response.status).to eq(400)
        expect(body['errors']). to eq(
          "conference_split" => ["can't be blank"],
          "name" => ["can't be blank"],
          "sport" => ["must exist"],
          "sport_id" => ["can't be blank"]
        )
      end
    end


  end

end