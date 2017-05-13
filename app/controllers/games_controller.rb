class GamesController < ApplicationController

  def index

  end
  def show
    @game = Game.find(params[:id])
    @player = @game.players.last
    ActionCable.server.broadcast 'game channel',
                            game: @game,
                            player_id: @player.id,
                            board: render_board(@player)
  end
  def create

    if Game.all.size == 0 || Game.last.players.count == 2
      @game = Game.create
      session[:url] = @game.id
    else
      @game = Game.last
    end
      @player = Player.create(player_params)
      helpers.player1_or_player2(@player)
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

  def render_board(player)
    render partial: 'board_2_top', locals: {spaces: player.spaces.order(:coordinate)}
  end
end
