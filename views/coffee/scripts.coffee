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



  # images = [
  #   "http://33.media.tumblr.com/1a426c7f7db34f40ac9cde0c77255249/tumblr_nic4edkOrS1qcvus4o1_500.gif" 
  #   "https://38.media.tumblr.com/c32ed7425180add1f42440f71ea551ee/tumblr_nezmo3KAVz1raz27ko1_500.gif" 
  #   "https://38.media.tumblr.com/d1a4d8ba7d6a2f474de069a78377b4c4/tumblr_n914h3PRwl1rodxovo2_1280.gif"
  # ]

  # $outside = $(".circle-outside")

  # for circle in $outside 
  #   for img in images
      
