---
---
$(window).bind "load", ->
  (($) ->

    # executed right now
    $ ->

      # executed only when the DOM is ready
      $(".show-hide-btn").css "background-color", "red"
      $(".show-hide-btn").click ->
        $(this).css "background-color", "black"
        $(this).parent().children().not(".show-hide-btn").slideToggle()
        return

      return

    return
  ) jQuery


### OLD
jQuery ($) ->
$(".show-hide-btn").click ->
  $(this).parent().children().not(".show-hide-btn").slideToggle()

window.ready ->
  $(".show-hide-btn").click ->
    $(this).parent().children().not(".show-hide-btn").slideToggle()
###