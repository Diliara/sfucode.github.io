---
# Builds nav menu and attaches it to #inPageNav
---


buildLinks = ->
  h3Counter = 0
  to_sectionName = []
  sectionName = []

  jumpingToSectionFunction = (event) ->
    scrollingTo sectionName[event.data.param]
    return

  $('div:not([id=inPageNav]) ' + 'h3').each ->
    to_sectionName[h3Counter] = '#to_section_' + h3Counter
    sectionName[h3Counter] = '#section_' + h3Counter
    h3Counter++
    return
  totalNumberOfSections = h3Counter
  i = 0
  while i < totalNumberOfSections
    $(to_sectionName[i]).click { param: i }, jumpingToSectionFunction
    i++
  return

buildBookmarks = (navSection, sBookMarkNode) ->
  oList = undefined
  sectionCount = undefined
  fromSectionCount = undefined
  sectionCount = 0
  fromSectionCount = 0
  oList = $('<ul class=\'nav-list\'>')
  $('div:not([id=inPageNav]) ' + navSection).each ->
    console.log 'section : ' + sectionCount + ' - ' + $(this).text()
    $(this).before '<div class="section-identifier" id=\'section_' + sectionCount + '\'>'
    oList.append $('<li id=\'from_section_' + fromSectionCount++ + '\'><a href=\'#section_' + sectionCount++ + '\'>' + $(this).text() + '</a></li>')
    return
  $('#' + sBookMarkNode).append oList
  return

buildBookmarks 'h3', 'inPageNav'
buildLinks()
$('#inPageNav').next().last().append '<div class="extra-space"></div>'

