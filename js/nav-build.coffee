---
# Works with .nav-build
# Builds nav menu and attaches it to .nav-build
---

buildAndEnableNavigation = (sections, navPlaceholder) ->
  sectionCount = 0
  fromSectionCount = 0
  listOfLinks = $('<ul class=\'nav-list\'>')

  $(sections).each ->
    console.log 'section : ' + sectionCount + ' - ' + $(this).text()

    #Placing links (section ids) within the content (above each section)
    $(this).before '<div class="section-identifier" id=\'section_' + sectionCount + '\'>'

    #Building up list of linked sections (with hrefs)
    if $(this).text().split(' ').length == 1
      listOfLinks.append $('<li id=\'from_section_' + fromSectionCount++ + '\'><a class=\'space-right\' href=\'#section_' + sectionCount++ + '\'>' + $(this).text() + '</a></li>')
    else
      listOfLinks.append $('<li id=\'from_section_' + fromSectionCount++ + '\'><a href=\'#section_' + sectionCount++ + '\'>' + $(this).text() + '</a></li>')
    return

  #Placing a list of linked sections
  $('.' + navPlaceholder).html(listOfLinks)
  return

buildAndEnableNavigation 'h3', 'nav-build'


