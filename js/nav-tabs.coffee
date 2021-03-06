---
# Automatically builds nav to work with jQuery tabs and triggers the tabs
---

buildAndEnableNavigation = (sectionsTabs, navPlaceholderTabs) ->
  sectionTabCount = 0
  listOfLinksTabs = $("<ul>")

  $(sectionsTabs).each ->
    sectionTabTitle = $(@).text()
    #console.log "tab : #{sectionTabCount} - #{sectionTabTitle}"
    #console.log '\n'

    if !$(@).hasClass 'exclude'
      #in the content
      $(@).nextUntil('h3').andSelf().wrapAll "<div id='tab_#{sectionTabCount}'>"

      #Building up list of linked sectionsTabs (with hrefs)
      listOfLinksTabs.append "<li><a href='#tab_#{sectionTabCount++}'>#{sectionTabTitle}</a></li>"

  #Placing a list of linked sectionsTabs
  $(".#{navPlaceholderTabs}").html listOfLinksTabs
  return


# for tabbed nav
if $('.tabs-build')[0]
  $('.tabs-build').nextAll().andSelf().wrapAll "<div id='tabs-nav' />"
  buildAndEnableNavigation 'h3', 'tabs-build'

  if $('.vertical')[0]
    $(".vertical").parent().tabs().addClass "ui-tabs-vertical ui-helper-clearfix"
    $(".vertical li").removeClass("ui-corner-top").addClass "ui-corner-right"

  else
    #jQuery Tabs
    $("#tabs-nav").tabs()


  unless document.location.hash is ""

    #get the index from URL hash
    tabSelect = document.location.hash.substr(1, document.location.hash.length)
    #console.log "tabSelect is: #{tabSelect}"
    $("#tabs-nav").tabs "option", "active", tabSelect
