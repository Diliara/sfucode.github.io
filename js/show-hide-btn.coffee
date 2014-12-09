---
---

# Show all siblings of .show-hide-btn. Mainly for displaying answers.
$(".show-hide-btn").click ->
  $(this).css "background-color", "black"
  $(this).parent().children().not(".show-hide-btn").slideToggle()
  return

message =
  domain: window.location.hostname
  text: "I'm Working!"

# Send the message text in a popup:
#alert message.text

# Send the message to console:
console.log message


### OLD
jQuery ($) ->
$(".show-hide-btn").click ->
  $(this).parent().children().not(".show-hide-btn").slideToggle()

window.ready ->
  $(".show-hide-btn").click ->
    $(this).parent().children().not(".show-hide-btn").slideToggle()
###