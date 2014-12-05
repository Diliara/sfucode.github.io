---
---

# Show all siblings of .show-hide-btn. Mainly for displaying answers.

jQuery ($) ->
  $(document).ready ->
    $(".show-hide-btn").click ->
      $(this).parent().children().not(".show-hide-btn").slideToggle()



### OLD
window.ready ->
  $(".show-hide-btn").click ->
    $(this).parent().children().not(".show-hide-btn").slideToggle()
###
