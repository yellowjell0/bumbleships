App.game = App.cable.subscriptions.create("GameChannel", {
  connected: function(data) {
    return $('#status').html("Waiting for an other payer.");
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
      console.log(message)
    }
  });

// $(document).ready(function() {
//   event.preventDefault
//   $('#game').on('submit', function(event) {
//     App.message(this);
//  });
// })


