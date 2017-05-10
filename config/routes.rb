Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/', to: "players#index"
post '/players', to: "players#create"
get '/battleship/:id', to: "games#show"
end