$ ->
  $(".nav li a").on "click", ->
    if $(this).hasClass "about-link"
      false
    else 
      $("#about").slideUp()


  $(".about-link").on "click", (e) ->
    e.preventDefault()
    $("#about").slideToggle()

  $.isMobile = ->
    navigator.platform.indexOf("iPad") isnt -1 or navigator.platform.indexOf("iPhone") isnt -1

  if $.isMobile()
    $("a").hover ->
      $(this).addClass "mobile-hover"


  activeNav = ->

    navItem = $(".nav li")
    $(".nav li").removeClass "active"

    if window.location.pathname is "/graphics" 
      navItem.eq(0).addClass "active"    

    if window.location.pathname is "/" 
      navItem.eq(0).addClass "active"
    
    if window.location.pathname is "/fashion"
      navItem.eq(2).addClass "active"
    
    if window.location.pathname is "/play"
      navItem.eq(3).addClass "active"
    
    if window.location.pathname is "/web"
      navItem.eq(1).addClass "active"

  activeNav()

  if Modernizr.history

    everPushed = false

    newHash = ""
    $load = $("#load")
    $content = $(".content")
    $pageWrap = $(".page-wrap")
    $el = undefined

    loadContent = (href) ->
      $content.height $content.height()
      $load.fadeOut 200, ->
        $load.hide().load href+"?_ajax=1", ->
          $load.fadeIn 200, ->
            $content.css "height", ""
            activeNav()  

    $(".nav li a, .projects li a").on "click", (e) ->
      e.preventDefault()      
      _link = $(this).attr("href")

      history.pushState null, null, _link   
      everPushed = true

      loadContent _link
      false

    $(window).on "popstate", ->
      _link = location.pathname.replace("'", "")
      if everPushed
        loadContent _link


# otherwise, history is not supported, so nothing fancy here.