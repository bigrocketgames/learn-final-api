json.user do
  json.(@user, :id, :email, :admin, :username)
end

json.token(Auth.create_token(@user.id))