class Api::V1::UserTeamsController < ApplicationController
  before_action :authenticate_token!
  
  def index
    render '/user_teams/index.json.jbuilder', user: @user
  end

  def create
      userTeam = UserTeam.new(user_team_params)

      if userTeam.save
        render '/user_teams/index.json.jbuilder', user: @user
      else
        render json: {
          errors: userTeam.errors
        }, status: 400
      end
  end

  def destroy
    user_team = UserTeam.find_by(id: params[:id])

    if (user_team.user.id == @user.id)
      user_team.destroy
      render '/user_teams/index.json.jbuilder', user: @user
    else
      render json: {
        errors: ["You can not remove a favorite that isn't yours."]
      }, status: 403
    end
  end

  private

  def user_team_params
    params.require(:user_team).permit(:user_id, :team_id)
  end

end