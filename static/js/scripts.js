(function() {
  $(function() {
    var $content, $el, $load, $pageWrap, activeNav, everPushed, loadContent, newHash;
    $(".nav li a").on("click", function() {
      if ($(this).hasClass("about-link")) {
        return false;
      } else {
        return $("#about").slideUp();
      }
    });
    $(".about-link").on("click", function(e) {
      e.preventDefault();
      return $("#about").slideToggle();
    });
    $.isMobile = function() {
      return navigator.platform.indexOf("iPad") !== -1 || navigator.platform.indexOf("iPhone") !== -1;
    };
    if ($.isMobile()) {
      $("a").hover(function() {
        return $(this).addClass("mobile-hover");
      });
    }
    activeNav = function() {
      var navItem;
      navItem = $(".nav li");
      $(".nav li").removeClass("active");
      if (window.location.pathname === "/graphics") {
        navItem.eq(0).addClass("active");
      }
      if (window.location.pathname === "/") {
        navItem.eq(0).addClass("active");
      }
      if (window.location.pathname === "/fashion") {
        navItem.eq(2).addClass("active");
      }
      if (window.location.pathname === "/play") {
        navItem.eq(3).addClass("active");
      }
      if (window.location.pathname === "/web") {
        return navItem.eq(1).addClass("active");
      }
    };
    activeNav();
    if (Modernizr.history) {
      everPushed = false;
      newHash = "";
      $load = $("#load");
      $content = $(".content");
      $pageWrap = $(".page-wrap");
      $el = void 0;
      loadContent = function(href) {
        $content.height($content.height());
        return $load.fadeOut(200, function() {
          return $load.hide().load(href + "?_ajax=1", function() {
            return $load.fadeIn(200, function() {
              $content.css("height", "");
              return activeNav();
            });
          });
        });
      };
      $(".nav li a, .projects li a").on("click", function(e) {
        var _link;
        e.preventDefault();
        _link = $(this).attr("href");
        history.pushState(null, null, _link);
        everPushed = true;
        loadContent(_link);
        return false;
      });
      return $(window).on("popstate", function() {
        var _link;
        _link = location.pathname.replace("'", "");
        if (everPushed) {
          return loadContent(_link);
        }
      });
    }
  });

}).call(this);