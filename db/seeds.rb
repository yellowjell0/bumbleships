game1 = Game.new

player1 = Player.create(username: "Ray")
player2 = Player.create(username: "Wes")
game1.players << player1
game1.players << player2
game1.save

game2 = Game.new
player3 = Player.create(username: "Sarah")
player4 = Player.create(username: "Karin")
game2.players << player3
game2.players << player4
game2.save

players = [player1, player2, player3, player4]

players.each_with_index do |player, j|
  Board.generate_player_game(player)
  player.ships.each_with_index do |ship, i|
    if j%2 == 0
      ship.set_ship("A#{i}", "down")
    else
      ship.set_ship("I#{i}", "up")
    end
    ship.save
  end
  player.save
end
