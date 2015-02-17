---
# Works with .build-nav
# Builds nav menu and attaches it to .build-nav
---


buildLinks = ->
  h3Counter = 0
  to_sectionName = []
  sectionName = []

  jumpingToSectionFunction = (event) ->
    scrollingTo sectionName[event.data.param]
    return

  $('h3').each ->
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
  $(navSection).each ->
    console.log 'section : ' + sectionCount + ' - ' + $(this).text()
    $(this).before '<div class="section-identifier" id=\'section_' + sectionCount + '\'>'
    if $(this).text().split(' ').length == 1
      oList.append $('<li id=\'from_section_' + fromSectionCount++ + '\'><a class=\'space-right\' href=\'#section_' + sectionCount++ + '\'>' + $(this).text() + '</a></li>')
    else
      oList.append $('<li id=\'from_section_' + fromSectionCount++ + '\'><a href=\'#section_' + sectionCount++ + '\'>' + $(this).text() + '</a></li>')
    return
  $('.' + sBookMarkNode).append oList
  return

buildBookmarks 'h3', 'build-nav'
buildLinks()

