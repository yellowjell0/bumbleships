class GamesController < ApplicationController

  def index

  end
  def show
    @game = Game.find(params[:id])
    @player = @game.players.first
  end
  def create
    if Game.all.size == 0 || Game.last.players.count == 2
      @game = Game.create
      session[:url] = @game.id
    else
      @game = Game.last
    end
      @player = Player.create(player_params)
      player1_or_player_2(@player)
  if @player.id
    Board.generate_player_game(@player)
    @game.players << @player
    redirect_to set_fleet_player_path(@player)
  end
end

  def player_params
    params.require(:player).permit(:username)
  end

  def statistics
    @game = Game.find(params[:id])
  end
end
