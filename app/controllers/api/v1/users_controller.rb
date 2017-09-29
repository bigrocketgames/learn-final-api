class Api::V1::UsersController < ApplicationController
  before_action :authenticate_token!, only: [:index, :upgrade, :downgrade, :destroy]

  def index
    if @user.admin
      @users = User.order(:id)
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
      user = User.find_by(id: params[:id])
      user.admin = true
      if user.save
        @users = User.all
        render json: @users
      else
        render json: {
          errors: user.errors
        }, status: 400
      end
    else
      render json: {
        errors: ["You are not authorized to upgrade this user."]
      }, status: 403
    end
  end

  def downgrade
    if @user.admin
      user = User.find_by(id: params[:id])
      user.admin = false
      if user.save
        @users = User.all
        render json: @users
      else
        render json: {
          errors: user.errors
        }, status: 400
      end
    else
      render json: {
        errors: ["You are not authorized to upgrade this user."]
      }, status: 403
    end
  end

  def destroy
    if @user.admin
      user = User.find_by(id: params[:id])
      if user.destroy
        @users = User.all
        render json: @users
      else render json: {
        errors: user.errors
      }, status: 400
      end
    else
      render json: {
        errors: ["You are not authorized to delete users."]
        }, status: 403
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end

end