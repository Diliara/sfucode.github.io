---
# Works with .nav-build
# Builds nav menu and attaches it to .nav-build
---

buildAndEnableNavigation = (sections, navPlaceholder) ->
  sectionCount = 1
  fromSectionCount = 1
  listOfLinks = $("<ol class='nav-list no-space'>")

  $(sections).each ->
    sectionTitle = $(@).text()
    #console.log "section : #{sectionCount} - #{sectionTitle}"
    #console.log '\n'

    if sectionCount > 1
      $(@).before "<p class='top'><a href='#top'>top &uarr;</a></p>"

    #without nav-scrollspy
    if !$(@).hasClass 'exclude'
      $(@).replaceWith "<h3 id='section_#{sectionCount}'>#{sectionTitle}</h3>"

      #Building up list of linked sections (with hrefs)
      listOfLinks.append "<li id='from_section_#{fromSectionCount++}'><a href='#section_#{sectionCount++}'>#{sectionTitle}</a></li>"

  #Placing a list of linked sections
  $(".#{navPlaceholder}").html listOfLinks
  return


if $('.nav-build')[0]
  buildAndEnableNavigation 'h3', 'nav-build'

$('.nav-build').parent().append "<p class='top'><a href='#top'>top &uarr;</a></p>"