Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # /api/v1/users
      resources :users, only: [:index, :create, :destroy]

      # /api/v1/users/upgrade
      post '/users/:id/upgrade', to: "users#upgrade"
      # /api/v1/users/downgrade
      post '/users/:id/downgrade', to: "users#downgrade"

      # /api/v1/auth
      post '/auth', to: "auth#login"
      post '/auth/refresh', to: "auth#refresh"

      # /api/v1/sports
      resources :sports, only: [:index, :create, :show, :update, :destroy]

      # /api/v1/sub_sports
      resources :sub_sports, only: [:index, :create, :show, :update, :destroy]

      # /api/v1/teams
      resources :teams, only: [:index, :create, :show, :update, :destroy] do
        get '/schedule', to: "teams#schedule"
      end

      # /api/v1/games
      resources :games, only: [:index, :create, :show, :update, :destroy]

      # /api/v1/user_teams
      resources :user_teams, only: [:index, :create, :destroy]
    end
  end
end
