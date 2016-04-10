App.vibes = App.cable.subscriptions.create "VibesChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    hue_num = data['hue_num']

  send_vibes: (content) ->
    @perform 'send_vibes', content

$(document).on 'ready', (e) ->
  $(this).gShake ->
    App.vibes.send_vibes hue_num: $('#hue_num').val()

