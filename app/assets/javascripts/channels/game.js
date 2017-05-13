
var ready = false

App.game = App.cable.subscriptions.create("GameChannel", {
  connected: function(data) {
    var numberOfPlayers = $('#subscribed').data('players');
    switch(numberOfPlayers) {
      case 1:
        ready = false;
        $('#status').html("Waiting for an other player.");
        break;
      case 2:
        ready = true
        // $('.to-board').children("input[type='submit']").val('Join Game')
        $('#status').html("Ready to begin.");
        break;
    }
  },
  disconnected: function() {
    return $('#status').html("You have been disconnected.")
  },
  received: function(data) {
    if (data.action === 'game start') {
// Put board logic here
      return $('#status').html("Game started! You play as #{data.msg}.")
    }
    },
    message: function(message) {
      return this.perform(message)

    }
  });

$(document).ready(function(event) {
  event.preventDefault
  $('#game').on('submit', function(event) {
    var input = $(this).children('input').val();
    App.game.message(input);
 });
  $('.player-1').submit (function(event) {
    var player1 = $('.player-1').addClass('hidden');
    var player2 = $('.player-2').removeClass('hidden');

  });
  $('.player-2').submit (function(event) {
    var player1 = $('.player-1').removeClass('hidden');
    var player2 = $('.player-2').addClass('hidden');

  });
});



