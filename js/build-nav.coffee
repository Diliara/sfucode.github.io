---
# Builds side nav and attaches it to #inPageNav
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
  sectionCount = 0
  oList = $('<ul class=\'side-nav custom-side-nav\'>')
  $('div:not([id=inPageNav]) ' + navSection).each ->
    console.log 'section : ' + sectionCount + ' - ' + $(this).text()
    $('#outline').append '<li>' + $(this).text() + '</li>'
    $(this).replaceWith '<h3 id=\'section_' + sectionCount + '\'>' + $(this).html()
    oList.append $('<li class=\'side-nav-section\' id=\'to_section_' + sectionCount++ + '\'><a>' + $(this).text() + '</a></li>')
    return
  $('#' + sBookMarkNode).append oList
  return

buildBookmarks 'h3', 'inPageNav'
buildLinks()
