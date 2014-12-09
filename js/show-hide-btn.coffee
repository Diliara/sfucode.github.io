---
---

$(document).ready ->
  $("span.show-hide-btn.button-answer").css "background-color", "red"
  message =
    domain: window.location.hostname
    text: "I'm Working!"

  $("span.show-hide-btn.button-answer").click ->
    $(this).css "background-color", "black"
    $(this).parent().children().not(".show-hide-btn").slideToggle()
    alert message.text
    return

  console.log message
  return


### OLD
jQuery ($) ->
$(".show-hide-btn").click ->
  $(this).parent().children().not(".show-hide-btn").slideToggle()

window.ready ->
  $(".show-hide-btn").click ->
    $(this).parent().children().not(".show-hide-btn").slideToggle()
###