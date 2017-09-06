class Api::V1::TeamsController < ApplicationController
before_action :get_team, only: [:show, :update, :destroy]
before_action :authenticate_token!, only: [:create, :update, :destroy]

  def create
    @team = Team.new(team_params)

    if @user.admin
      if @team.save
        render json: @team
      else
        render json: {
          errors: @team.errors
        }, status: 400
      end
    else
      render json: {
        errors: ["You are not authorized to create new items."]
      }
    end
  end

  def show
    render json: @team
  end

  def update
    if @user.admin
      if @team.update(team_params)
        render json: @team
      else
        render json: {
          errors: @team.errors
        }, status: 400
      end
    else
      render json: {
        errors: ["You are not authorized to modify items."]
      }, status: 403
    end
  end

  def destroy
    if @user.admin
      @team.destroy
      render json: { Status: "Team successfully destroyed!" }
    else
      render json: {
        errors: ["You are not authorized to delete items."]
      }, status: 403
    end
  end

  def schedule
    @team = Team.find_by(id: params[:team_id])
    render json: @team.get_games
  end


private

  def get_team
    @team = Team.find_by(id: params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :mascot, :stadium_location, :sub_sports_id)
  end

end