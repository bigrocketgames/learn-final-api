Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # /api/v1/users
      resources :users, only: [:create, :show, :update, :destroy]
    end
  end
end
