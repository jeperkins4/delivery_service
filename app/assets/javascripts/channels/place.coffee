App.place = App.cable.subscriptions.create "PlaceChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#place_' + data.message.id + '_quote_time').html(data.message.estimated_prep_time + " minutes")
    $('#messages').append data['message']['estimated_prep_time']
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    @perform 'speak', message: message
