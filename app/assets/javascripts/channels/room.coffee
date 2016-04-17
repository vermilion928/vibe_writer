App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    if data['is_complete'] == true
      goal()
    else
      new Audio('sounds/type.ogg').play()
      color = data['color']
      chara = data['chara']
      $('#word').append('<span class="text" style="color: hsl(' + color + ', 50%, 50%);">' + chara + '</span>')
      $('#paper').animate(scrollTop: $(document).height(), 'fast')

  key_type: (content) ->
    @perform 'key_type', content

$(document).on 'click', 'a', (e) ->
  new Audio('sounds/type.ogg').play()
  App.room.key_type { chara: e.target.innerText, hue_num: $('#hue_num').val() }

window.goal = () ->
  $('article#congrats').fadeIn(100)
  $('article#congrats h3 strong').css('font-size', 16 + vibeCount + 'px').text(vibeCount)
  for i in [0..vibeCount] then setTimeout (-> vibe(Math.round Math.random() * 360)), 100 * i
  setTimeout (->
    window.vibeCount = 0
    $('article#congrats').fadeOut(100)
    setTimeout (-> location.reload()), 100
  ), 3000
