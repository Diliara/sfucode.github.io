---
---

# Show all siblings of .show-hide-btn. Mainly for displaying answers.

$ ->
  $(".show-hide-btn").click ->
    $(this).parent().children().not(".show-hide-btn").slideToggle()
    return

  return





### OLD
jQuery ($) ->
$(".show-hide-btn").click ->
  $(this).parent().children().not(".show-hide-btn").slideToggle()

window.ready ->
  $(".show-hide-btn").click ->
    $(this).parent().children().not(".show-hide-btn").slideToggle()
###