class ApplicationController < ActionController::API

  helper_method :authenticate_token!, :current_user
  
  private

  def authenticate_token!

    #check for HTTP_Authorization
    if request.env['HTTP_AUTHORIZATION']
    # -> if it exists
      # pass in a begin block because we want to rescue from possible Auth module errors
      begin
        # grab the token from the HTTP_AUTHORIZATION
        token = request.env['HTTP_AUTHORIZATION'].split(" ").last
        
        # decode the token with our Auth modeule
        decoded = Auth.decode_token(token)

          @user_id = decoded[0]["user_id"]
      rescue JWT::DecodeError
        errors = [{ message: "Token is invalid!" }]
      end

      if !current_user || !decoded || errors
        render json: {
          errors: errors
        }, status: 403
      end

    else
      # render the error message of "You must include a JWT token!" with a 403 status
      render json: {
        errors: [
          { message: "You must include a JWT token!"}
        ]
      }, status: 403
    end
  end

  def current_user
    @user ||= User.find_by(id: @user_id) if @user_id
  end

end
