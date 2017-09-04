require 'rails_helper'

RSpec.describe "Api::V1::Sports", Type: :request do

  describe "POST /sports" do
    
    before (:each) do
      @user = User.create(
        email: "test@test.com",
        password: "password",
        admin: true
      )

      token = Auth.create_token(@user.id)

      sport_params = {
        sport: {
          name: "Football"
        }
      }

      post "/api/v1/sports",
        params: sport_params.to_json,
        headers: { 
          'Content-Type': 'application/json',
          'Authorization': "Bearer: #{token}"
        }

      @response = response

    end

    describe "on success" do

      it "creates a sport from the params" do
        expect(Sport.all.count).to eq(1)
      end

      it "returns the new sport" do
        body = JSON.parse(@response.body)

        expect(response.status).to eq(200)
        expect(body['id']).not_to eq(nil)
        expect(body['name']).to eq("Football")
      end
      
      it "renders the sport by id in params" do
        body = JSON.parse(@response.body)
        @sport_id = body['id']

        get "/api/v1/sports/" + @sport_id.to_s,
          headers: {
            'Content-Type:': 'application/json'
          }

        body1 = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(body1['name']).to eq("Football")
      end

    end

    describe "on error" do
      
      before(:each) do
        @user1 = User.create(
          email: "test1@test.com",
          password: "password",
          admin: false
        )
  
        @token = Auth.create_token(@user1.id)

        body = JSON.parse(@response.body)
        @sport_id = body['id']
      end

      it "will not update the sport if user is not authorized" do
        
        params = {
          sport: {
            name: "Cheese Monkeys"
          }
        }

        patch "/api/v1/sports/" + @sport_id.to_s,
          params: params.to_json,
          headers: { 
            'Content-Type': 'application/json',
            'Authorization': "Bearer: #{@token}"
          }

        @response1 = response

        body1 = JSON.parse(@response1.body)
        expect(response.status).to eq(403)
        expect(body1['errors']).to eq([
          "You are not authorized to modify items."
        ])
      end

      it "will not delete the sport if user is not authorized" do

        delete "/api/v1/sports/" + @sport_id.to_s,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer: #{@token}"
          }

        body1 = JSON.parse(response.body)
        expect(response.status).to eq(403)
        expect(body1['errors']).to eq([
          "You are not authorized to delete items."
        ])
      end

    end

  end

end