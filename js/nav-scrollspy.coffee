---
# Works with #fixtop-nav
# Scrollspy catches menu on the page & fixes it on top + activates scrollspy for menu items
---

$nav = $('#fixtop-nav')
navHeight = $nav.height()
console.log 'navHeight ' + navHeight

$spaceForLinks = $('.section-identifier')
$singleWordInNav = $('.space-right')

# 1 line => $spaceForLinks.height sets to 5
# 2 lines => $spaceForLinks.height is 10 (default)
# 3 lines => $spaceForLinks.height sets to 30
if navHeight > 70
  $spaceForLinks.css 'height', 30
else if navHeight <= 32
  $spaceForLinks.css 'height', 5
  $singleWordInNav.css 'padding-right', 0

$nav.each ->
  content = $(this).nextAll()
  contentPosition = content.position()
  $(this).scrollspy
    min: contentPosition.top
    max: contentPosition.top + content.first().parent().height()
    onEnter: ->
      $nav.addClass 'fixed'
      return
    onLeave: ->
      $nav.removeClass 'fixed'
      $('.active').removeClass 'active'
      return
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

$nav.nextAll().parent().append '<div class="extra-space"></div>'
