Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "games#index"
  post '/games', to:"games#create"
  get '/games/:id', to: "games#show", as: :game
  get '/games/:id/statistics', to: "games#statistics", as: :statistics
    resources :players, only: [] do
      get :set_fleet, on: :member
      patch :add_ship, on: :member
      patch :guess, on: :member
    end
  mount ActionCable.server => '/cable'
end
