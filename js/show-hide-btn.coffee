---
---

jQuery ($) ->
  $(".show-hide-btn").css "background-color", "green"
  $(".show-hide-btn").click ->
    $(this).parent().children().not(".show-hide-btn").slideToggle()




### OLD

$ ->
  # executed only when the DOM is ready
  $(".show-hide-btn").css "background-color", "green"
  $(".show-hide-btn").click ->
    $(this).css "background-color", "black"
    $(this).parent().children().not(".show-hide-btn").slideToggle()
    return

  return

window.ready ->
  $(".show-hide-btn").click ->
    $(this).parent().children().not(".show-hide-btn").slideToggle()
###