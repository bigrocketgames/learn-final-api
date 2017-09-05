class Api::V1::GamesController < ApplicationController
before_action :get_game, only: [:show, :update, :destroy]
before_action :authenticate_token!, only: [:create, :update, :destroy]

  def create
    if @user.admin
      @game = Game.new(game_params)

      if @game.save
        render json: @game
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
    render json: @game
  end

  def update
    if @user.admin
      if @game.update(game_params)
        render json: @game
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
      render json: { Status: "Game successfully destroyed!" }
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
    params.require(:game).permit(:game_time, :home_team_id, :away_team_id)
  end

end