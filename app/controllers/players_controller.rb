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
  Board.generate_player_game(@player)
  @game.players << @player
  @fleet = @player.ships
  render :'games/show'
 end

 private
 def player_params
  params.require(:player).permit(:username)
 end
end
