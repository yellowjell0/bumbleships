class PlayersController < ApplicationController
 def index
  @player = Player.new
 end

 def create
  if Game.all.size == 0 || Game.last.players.count == 2
    @game = Game.create
  else
    @game = Game.last
  end
  @player = Player.create(player_params)
  @game.players << @player
  redirect_to "/battleship/#{@game.id}"
 end


 private
 def player_params
  params.require(:player).permit(:username)
 end
end
