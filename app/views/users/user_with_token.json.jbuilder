json.user do
  json.(@user, :id, :email, :admin)
end

json.token(Auth.create_token(@user.id))