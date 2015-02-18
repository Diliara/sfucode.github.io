---
# Works with #nav-scrollspy
# Scrollspy catches menu on the page & fixes it on top + activates scrollspy for menu items
---

$nav = $('#nav-scrollspy')
navHeight = $nav.height()
#console.log 'navHeight ' + navHeight

$spaceForLinks = $('.section-identifier')
$singleWordInNav = $('.space-right')

#something requires offSet (canvas lms?)
offsetSpace = 50
  
# <32 = 1 line => $spaceForLinks.height sets to 5 => offsetSpace = 100
# 2 lines => $spaceForLinks.height is 10 (default) => offsetSpace = 50 (default)
# >70 = 3 lines => $spaceForLinks.height sets to 30 => offsetSpace = 0
if navHeight > 70
  $spaceForLinks.css 'height', 30
  offsetSpace = 0
else if navHeight <= 32
  $spaceForLinks.css 'height', 5
  $singleWordInNav.css 'padding-right', 0
  offsetSpace = 100
  

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

# $('h3').prev() '.section-identifier'
$spaceForLinks.each ->
  sectionContent = $(this).nextUntil('.section-identifier').first().parent()
  sectionContentHeight = sectionContent.height()
  identifierPosition = $(this).position()
  
  console.log 'identifierPosition top: ' + identifierPosition.top
  console.log 'navHeight: ' + navHeight
  console.log 'this height: ' + $(this).height()
  console.log 'offsetSpace: ' + offsetSpace
  console.log '-----------------------------'
  console.log 'min: ' + identifierPosition.top + navHeight + $(this).height() + offsetSpace + '\n'

  console.log 'identifierPosition top: ' + identifierPosition.top
  console.log 'navHeight: ' + navHeight
  console.log 'this height: ' + $(this).height()
  console.log 'sectionContent height: ' + sectionContent.height()
  console.log '-----------------------------'
  console.log 'max: ' + identifierPosition.top + navHeight + $(this).height() + sectionContentHeight + '\n\n'
  

  $(this).scrollspy
    min: identifierPosition.top + navHeight + $(this).height() + offsetSpace
    max: identifierPosition.top + navHeight + $(this).height() + sectionContentHeight
    onEnter: (element) ->
      activeSectionID = element.id
      activeSectionName = 'from_' + activeSectionID
      $('.active').removeClass 'active'
      $('#' + activeSectionName).addClass 'active'
      console.log 'entering ' + activeSectionID
      return
    onLeave: (element) ->
      #currentSectionID = element.id
      console.log 'leaving ' + currentSectionID
      #prevSectionID = currentSectionID.replace(/\d+$/, (a) ->
        ##a can be -1, no section is active
        #a - 1
        ##eliminating a = -1
        ##a = a - 1
        ##if a - 1 < 0
        ## a = 0
        ##a
      #)
      #console.log 'prevSectionID ' + prevSectionID
      #prevSectionName = 'from_' + prevSectionID
      #$('.active').removeClass 'active'
      #$('#' + prevSectionName).addClass 'active'
  return
  return

$nav.nextAll().parent().append '<div class="extra-space"></div>'
