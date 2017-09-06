class Api::V1::UserTeamsController < ApplicationController
before_action :authenticate_token!, only: [:create, :destroy]

  def create
    if @user.admin
      @userTeam = UserTeam.new(user_team_params)

      if @userTeam.save
        render json: @userTeam
      else
        render json: {
          errors: @userTeam.errors
        }, status: 400
      end
    else
      render json: {
        errors: ["You are not authorized to create new items."]
      }, status: 403
    end
  end

  def destroy
    if @user.admin
      @user_team = UserTeam.find_by(id: params[:id])
      @user_team.destroy
      render json: { Status: "User Team successfully destroyed!" }
    else
      render json: {
        errors: ["You are not authorized to delete items."]
      }, status: 403
    end
  end

  private

  def user_team_params
    params.require(:user_team).permit(:user_id, :team_id)
  end

end