module GamesControllerHelper

  def player1_or_player2(player)
    session[:player1] ||= @player.id
    session[:player2] ||= @player.id
  end
end

