---
# Works with .nav-build
# Builds nav menu and attaches it to .nav-build
---

buildAndEnableNavigation = (sections, navPlaceholder) ->
  sectionCount = 1
  fromSectionCount = 1
  listOfLinks = $('<ol class=\'nav-list\'>')

  $(sections).each ->
    console.log 'section : ' + sectionCount + ' - ' + $(this).text()
    console.log '\n'

    if sectionCount > 0
      $(this).before '<p class="top"><a href="#top">top &uarr;</a></p>'


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


if $('.nav-build')[0]
  buildAndEnableNavigation 'h3', 'nav-build'
