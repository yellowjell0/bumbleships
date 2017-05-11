class GamesController < ApplicationController

def create
  ship = Ship.find(params[:id])
  ship.place_ship(space_params)
end

def space_params

end
end
