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

window.goal = () ->
  $('article#congrats').css('display', 'block')
  $('article#congrats h3 strong').css('font-size', 16 + vibeCount + 'px').text(vibeCount)
  for i in [0..vibeCount] then setTimeout (-> vibe(Math.round Math.random() * 360)), 100 * i
  setTimeout (-> $('article#congrats').fadeOut()), 3000
  window.dictCount = if dict.length > dictCount + 1 then dictCount + 1 else 0
  $('#paper p small strong').text(dict[dictCount].length - 1)
  $('.text').fadeOut(3500, -> $(this).remove())
  window.vibeCount = 0
