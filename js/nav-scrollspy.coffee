---
# Works with #fixtop-nav
# Scrollspy catches menu on the page & fixes it on top + activates scrollspy for menu items
---

$('#fixtop-nav').each ->
  content = $(this).nextAll()
  contentPosition = content.position()
  $(this).scrollspy
    min: contentPosition.top
    max: contentPosition.top + content.first().parent().height()
    onEnter: ->
      $('#fixtop-nav').addClass 'fixed'
      return
    onLeave: ->
      $('#fixtop-nav').removeClass 'fixed'
      $('.active').removeClass 'active'
      return
  console.log('min: '+contentPosition.top+' max: 'content.first().parent().height())
  return

$('h3').prev().each ->
  position = $(this).position()
  $(this).scrollspy
    min: position.top + 100
    max: position.top + $(this).height() + 200
    onEnter: (element) ->
      activeSectionID = element.id
      activeSectionName = 'from_' + activeSectionID
      $('.active').removeClass 'active'
      $('#' + activeSectionName).addClass 'active'
      #console.log('entering ' + activeSectionID);
      return
    onLeave: (element, position) ->
      #console.log('leaving ' + element.id);
  return
  return

$('#fixtop-nav').next().last().append '<div class="extra-space"></div>'
