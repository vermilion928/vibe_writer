App.vibes = App.cable.subscriptions.create "VibesChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    new Audio("sounds/vibe.ogg").play()

    hue_num = data['hue_num']
    window.vibe hue_num
    window.vibeCount = if $(".vibes").length > vibeCount then $(".vibes").length else vibeCount

  send_vibes: (content) ->
    @perform 'send_vibes', content

$(document).on 'ready', (e) ->
  $(this).gShake ->
    App.vibes.send_vibes hue_num: $('#hue_num').val()

window.vibeCount = 0

window.vibe = (hue_num) ->
  $('#standby_screen').append(
    '<div class="vibes" style="color: hsl(' + hue_num + ',65%,50%); top:' + Math.round(Math.random() * 100) +
    '%; left:' + Math.round(Math.random() * 100) + '%; font-size:' + ($(".vibes").length + 10) +
    'px;">＿人人人＿<br />＞VIBES!＜<br />‾ＹＹＹＹ‾</div>')
  $('.vibes').fadeOut(1000, -> $(this).remove() )
