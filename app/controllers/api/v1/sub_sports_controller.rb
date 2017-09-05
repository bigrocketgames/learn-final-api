class Api::V1::SubSportsController < ApplicationController
  before_action :get_subsport, only: [:show, :update, :destroy]
  before_action :authenticate_token!, only: [:create, :update, :destroy]
  def create
    if @user.admin = true
      @sub_sport = SubSport.new(subsport_params)

      if @sub_sport.save
        render json: @sub_sport
      else
        render json: {
          errors: @sub_sport.errors
        }, status: 400
      end
    else
      render json: {
        errors: ["You are not authorized to create new items."]
      }
    end
  end

  def show
    render json: @sub_sport
  end

  def update
    if @user.admin = true
      if @sub_sport.update(subsport_params)
        render json: @sub_sport
      else
        render json: {
          errors: @sub_sport.errors
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
      @sub_sport.destroy
      render json: { Status: "Sub Sport successfully destroyed!" }
    else
      render json: {
        errors: ["You are not authorized to delete items."]
      }, status: 403
    end
  end

  private

  def get_subsport
    @sub_sport = Sport.find_by(id: params[:id])
  end

  def subsport_params
    params.require(:sub_sport).permit(:name, :sport_id, :conference_split)
  end

end