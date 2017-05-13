
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
      alert(data)
      // board logic goes here

    },

  });




