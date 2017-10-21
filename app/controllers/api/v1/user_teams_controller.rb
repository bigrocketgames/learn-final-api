class Api::V1::UserTeamsController < ApplicationController
  before_action :authenticate_token!, only: [:index, :create, :destroy]
  
  def index
    @userTeams = @user.user_teams
    render '/user_teams/index.json.jbuilder', userTeams: @userTeams
  end

  def create
      userTeam = UserTeam.new(user_team_params)

      if userTeam.save
        @userTeams = @user.user_teams
        render '/user_teams/index.json.jbuilder', userTeams: @userTeams
      else
        render json: {
          errors: userTeam.errors
        }, status: 400
      end
  end

  def like
    @userTeam = UserTeam.find_by(id: params[:user_team_id])
    @userTeam.team.add_like
    render 'user_teams/show.json.jbuilder', userTeam: @userTeam
  end

  def destroy
    user_team = UserTeam.find_by(id: params[:id])

    if (user_team.user.id == @user.id)
      user_team.destroy
      @userTeams = @user.user_teams
      render '/user_teams/index.json.jbuilder', userTeams: @userTeams
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