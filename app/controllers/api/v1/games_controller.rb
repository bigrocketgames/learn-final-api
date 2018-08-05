class Api::V1::GamesController < ApplicationController
before_action :get_game, only: [:show, :update, :destroy]
before_action :authenticate_token!, only: [:create, :update, :destroy]

  def index
    @games = Game.all.order(:id)
    render '/games/index.json.jbuilder', games: @games
  end

  def create
    if @user.admin
      @game = Game.new(game_params)

      if @game.save
        render '/games/show.json.jbuilder', game: @game
      else
        render json: {
          errors: @game.errors
        }, status: 400
      end
    else
      render json: {
        errors: ["You are not authorized to create new items."]
      }, status: 403
    end
  end

  def show
    render '/games/show.json.jbuilder', games: @game
  end

  def update
    if @user.admin
      if @game.update(game_params)
        render '/games/show.json.jbuilder', games: @game
      else
        render json: {
          errors: @game.errors
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
      @game.destroy
      render '/games/show.json.jbuilder', game: @game
    else
      render json: {
        errors: ["You are not authorized to delete items."]
      }, status: 403
    end
  end


private

  def get_game
    @game = Game.find_by(id: params[:id])
  end

  def game_params
    params.require(:game).permit(:game_time, :home_team_id, :away_team_id, :location, :season_id)
  end

end