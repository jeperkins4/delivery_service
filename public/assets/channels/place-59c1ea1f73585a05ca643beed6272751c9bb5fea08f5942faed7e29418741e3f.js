(function() {
  App.place = App.cable.subscriptions.create("PlaceChannel", {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      return alert(data['message']);
    },
    wait_time_message: function(message) {
      return this.perform('wait_time_message', {
        message: message
      });
    }
  });

}).call(this);
