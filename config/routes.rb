Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# get '/', to: "players#index"
post '/players', to: "players#create"
get '/battleship/:id', to: "games#show"
post '/place_ship', to: "games#place_ship"
root to: "players#index"
mount ActionCable.server => '/cable'
end
