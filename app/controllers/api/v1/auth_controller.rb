class Api::V1::AuthController < ApplicationController
  before_action :authenticate_token!, only: [:refresh]

  def login
    @user = User.find_by(email: params[:user][:email].to_s.downcase) || User.find_by(username: params[:user][:email])

    if !@user
      render json: {
        errors: {
          email: ["Unable to find a user with the provided email address"]
        }
      }, status: 500
    elsif @user && @user.authenticate(params[:user][:password])
        # render json user with JWT token
        render 'users/user_with_token.json.jbuilder', user: @user
    else
      render json: {
        errors: {
          password: ["password does not match the provided email"]
        }
      }, status: 500
    end
  end

  def refresh
    render 'users/user_with_token.json.jbuilder', user: @user
  end


end