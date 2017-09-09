class Api::V1::UsersController < ApplicationController
  before_action :authenticate_token!, only: [:index]

  def index
    if @user.admin
      @users = User.all
      render json: @users
    else
      render json: {
        errors: ["You are not authorized to view this content."]
      }, status: 403
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render 'users/user_with_token.json.jbuilder', user: @user
    else
      render json: {
        errors: @user.errors
      }, status: 500
    end
  end

  def upgrade
    if @user.admin
      @user = User.find_by(id: params[:id])
      @user.upgrade
    else
      render json: {
        errors: ["You are not authorized to upgrade this user."]
      }, status: 403
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

end