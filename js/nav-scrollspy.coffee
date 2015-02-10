---
# Catches menu on the page and fixes it on top + activates scroll spy
---
$('#inPageNav').each ->
  content = $(this).next()
  contentPosition = content.position()
  $(this).scrollspy
    min: contentPosition.top - 50
    max: contentPosition.top + content.height()
    onEnter: ->
      $('#inPageNav').addClass 'fixed'
      return
    onLeave: ->
      $('#inPageNav').removeClass 'fixed'
      $('.active').removeClass 'active'
      return
  return
$('h3').prev().each ->
  position = $(this).position()
  $(this).scrollspy
    min: position.top - 50
    max: position.top + $(this).height()
    onEnter: (element) ->
      activeSectionID = element.id
      activeSectionName = 'from_' + activeSectionID
      $('.active').removeClass 'active'
      $('#' + activeSectionName).addClass 'active'
      # console.log('entering ' + activeSectionID);
      return
    onLeave: (element, position) ->
      # console.log('leaving ' + element.id);
      return
  return
