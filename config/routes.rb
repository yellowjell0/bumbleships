Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "games#new"
  #
  get '/', to: "games#index"
  post '/games', to:"games#create"
  get '/games/:id', to: "game#show", as: :game
  # get '/games/:game_id/player/:id', to: "players#set_fleet", as: :set_fleet
    resources :players, only: [] do
      get :set_fleet, on: :member
      patch :add_ship, on: :member
      patch :guess, on: :member
    end
end
