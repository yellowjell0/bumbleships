 class PlayersController < ApplicationController
 def index
  @player = Player.new

 end

 def set_fleet
  @player = Player.find(params[:id])
 end

 def add_ship
  @player = Player.find(params[:id])
  @ship = Ship.find(params[:ship][:ship_id])
  if @ship.set_ship(params[:ship][:start_coordinate], params[:ship][:direction])
    @ship.save
    @player.save
    redirect_to set_fleet_player_path(@player)
  else
    @error = "you can't place your ship there!"
    render :set_fleet
  end
 end

 private
 def player_params
  params.require(:player).permit(:username)
 end
end
