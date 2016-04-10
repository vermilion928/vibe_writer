App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    new Audio('sounds/type.ogg').play()
    color = data['color']
    chara = data['chara']
    $('#word').append('<span class="text" style="color: hsl(' + color + ', 50%, 50%);">' + chara + '</span>')
    $('#paper').animate({ scrollTop: $(document).height() }, 'fast')

  key_type: (content) ->
    @perform 'key_type', content

$(document).on 'click', 'a', (e) ->
  App.room.key_type { chara: e.target.innerText, hue_num: $('#hue_num').val() }
