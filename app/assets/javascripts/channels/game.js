
App.game = App.cable.subscriptions.create("GameChannel", {
  connected: function(data) {
    var numberOfPlayers = $('#subscribed').data('players');
    switch(numberOfPlayers) {
      case 1:
        return $('#status').html("Waiting for an other payer.");
        break;
      case 2:
        return $('#status').html("Ready to begin.");
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

$(document).ready(function() {
  event.preventDefault
  $('#game').on('submit', function(event) {
    var input = $(this).children('input').val();
    App.game.message(input);
 });
})



