class Api::V1::SportsController < ApplicationController
  before_action :get_sport, only: [:show, :update, :destroy]
  before_action :authenticate_token!, only: [:create, :update, :destroy]

  def index
    @sports = Sport.all.order(:id)
    render 'sports/index.json.jbuilder', sport: @sports
  end

  def create
    if @user.admin
      @sport = Sport.new(sport_params)

      if @sport.save
        render 'sports/show.json.jbuilder', sport: @sport
      else
        render json: {
          errors: @sport.errors
        }, status: 400
      end
    else
      render json: {
        errors: ["You are not authorized to create new items."]
      }, status: 403
    end
  end

  def show
    render json: @sport
  end

  def update
    if @user.admin 
      if @sport.update(sport_params)
        render json: @sport
      else
        render json: {
          errors: @sport.errors
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
      @sport.destroy
      render 'sports/show.json.jbuilder', sport: @sport
    else
      render json: {
        errors: ["You are not authorized to delete items."]
      }, status: 403
    end
  end

  private

  def get_sport
    @sport = Sport.find_by(id: params[:id])
  end

  def sport_params
    params.require(:sport).permit(:name)
  end

end