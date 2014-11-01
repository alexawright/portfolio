$ ->
              
  $.isMobile = ->
    navigator.platform.indexOf("iPad") isnt -1 or navigator.platform.indexOf("iPhone") isnt -1

  if $.isMobile()
    $("a").hover ->
      $(this).addClass "mobile-hover"

  # load images
  $(".load-img").on("load", ->
    $(@).addClass "loaded"

  ).each ->
    if @complete
      $(@).load()