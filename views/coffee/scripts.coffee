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

$ ->
  console.log("DOM is ready")

  $(document).on "click", ".button2", ->
  console.log("delegated button click!")

  div.animate {width: 200}, 2000

  div.animate
    width: 200
    height: 200
    2000