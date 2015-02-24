---
# Works with #nav-scrollspy
# Scrollspy catches menu on the page & fixes it on top + activates scrollspy for menu items
---

$nav = $('#nav-scrollspy')
navHeight = $nav.height()
#console.log 'navHeight ' + navHeight

$SectionIdentifier = $('.section-identifier')
$singleWordInNav = $('.space-right')

#default (offset space for canvas lms UI)
#todo: make the numbers relative to the wikipage
offsetSpace = 95

# .section-identifier height has to update relative to the # of lines in the nav (height) & the "jumping" interaction in nav-build.js
# offsetSpace has to update relative to the # of lines in the nav (height) & space allocated for .section-identifier
# <32 = 1 line => $SectionIdentifier.height sets to 5 => offsetSpace = 160
# default = 2 lines => $SectionIdentifier.height is 10 => offsetSpace = 95
# >70 = 3 lines => $SectionIdentifier.height sets to 30 => offsetSpace = 80
if navHeight > 70
  $SectionIdentifier.css 'height', 30
  offsetSpace = 80
else if navHeight <= 32
  $SectionIdentifier.css 'height', 5
  $singleWordInNav.css 'padding-right', 0
  offsetSpace = 155


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
  return




# $('h3').prev() '.section-identifier'
$SectionIdentifier.each ->
  sectionContent = $(this).nextUntil('.section-identifier')
  sectionContentFirstPosition =  sectionContent.position()
  sectionContentLastPosition = sectionContent.last().position()
  sectionContentHeight =  sectionContentLastPosition.top - sectionContentFirstPosition.top + sectionContent.last().height()
  identifierPosition = $(this).position()
  
  #console.log '// ' + $(this).attr("id") + ': ' + $(this).next().text()
  #console.log 'identifierPosition top: ' + identifierPosition.top
  #console.log 'offsetSpace: ' + offsetSpace
  #console.log 'min: ' + (identifierPosition.top + offsetSpace)

  #console.log 'identifierPosition top: ' + identifierPosition.top
  #console.log 'offsetSpace: ' + offsetSpace
  #console.log 'sectionContent height: ' + sectionContentHeight
  ##console.log '['
  ##console.log 'sectionContentFirstPosition: ' + sectionContentFirstPosition.top
  ##console.log 'sectionContentLastPosition: ' + sectionContentLastPosition.top
  ##console.log 'sectionContentLastPosition Height: ' + sectionContent.last().height()
  ##console.log ']'
  #console.log 'this height: ' + $(this).height()
  #console.log 'max: ' + (identifierPosition.top + offsetSpace + sectionContentHeight + $(this).height())
  
  #console.log '////////////////////////////// \n\n'

  $(this).scrollspy
    min: identifierPosition.top + offsetSpace
    max: identifierPosition.top + offsetSpace + sectionContentHeight + $(this).height()
    onEnter: (element) ->
      activeSectionID = element.id
      activeSectionName = 'from_' + activeSectionID
      $('.active').removeClass 'active'
      $('#' + activeSectionName).addClass 'active'
      #console.log 'entering ' + activeSectionID
      return
    onLeave: (element) ->
      #currentSectionID = element.id
      #console.log 'leaving ' + currentSectionID 
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
