---
# Alert you to its working
---

floating_navigation_offset_top = $('#inPageNav').offset().top

floating_navigation = ->
  scroll_top = $(window).scrollTop()
  if scroll_top > floating_navigation_offset_top
    $('#inPageNav').css
      'position': 'fixed'
      'top': 50
      'width': 200
      'margin-top': '-2.2em'
  else
    $('#inPageNav').css
      'position': 'absolute'
      'right': 0
      'width': 200
      'margin-top': '50px'
  return

floating_navigation()
$(window).scroll ->
  floating_navigation()
  return