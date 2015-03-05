---
# Works with .nav-build
# Builds nav menu and attaches it to .nav-build
---

buildAndEnableNavigation = (sections, navPlaceholder) ->
  sectionCount = 1
  fromSectionCount = 1
  listOfLinks = $("<ol class='nav-list'>")

  $(sections).each ->
    sectionTitle = $(@).text()
    #console.log "section : #{sectionCount} - #{sectionTitle}"
    #console.log '\n'

    if sectionCount > 1
      $(@).before "<p class='top'><a href='#top'>top &uarr;</a></p>"


    #Placing links (section ids) within the content (above each section)

    #for nav-scrollspy (comment out without nav-scrollspy)
    #$(@).before "<div class='section-identifier' id=\'section_#{sectionCount}'>"


    #without nav-scrollspy
    if !$(@).hasClass 'exclude'
      $(@).replaceWith "<h3 id='section_#{sectionCount}'>#{sectionTitle}</h3>"


      #Building up list of linked sections (with hrefs)
      if sectionTitle.split(' ').length == 1
        listOfLinks.append "<li id='from_section_#{fromSectionCount++}'><a class='space-right' href='#section_#{sectionCount++}'>#{sectionTitle}</a></li>"
      else
        listOfLinks.append "<li id='from_section_#{fromSectionCount++}'><a href='#section_#{sectionCount++}'>#{sectionTitle}</a></li>"
      return

  #Placing a list of linked sections
  $(".#{navPlaceholder}").html listOfLinks
  return


if $('.nav-build')[0]
  buildAndEnableNavigation 'h3', 'nav-build'


$('.nav-build').parent().append "<p class='top'><a href='#top'>top &uarr;</a></p>"
