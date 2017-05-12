App.game = App.cable.subscriptions.create("GameChannel", {
  connected: function() {
    return $('#status').html("Waiting for an other payer.");
  },
  disconnected: function() {
    return $('#status').html("You have been disconnected.")
  },
  received: function(data) {
    console.log(data)
    }
  });
