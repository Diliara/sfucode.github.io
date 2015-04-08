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
  #jQuery Tabs
  $("#tabs-nav").tabs()

  # grab the url
  url = document.URL

  # grab the value of the hash
  hashValue = url.substring(url.indexOf("#")).replace("#", "")

  # check to make sure it is a number
  # set the active tab
  $("#tabs").tabs "option", "active", hashValue  unless isNaN(hashValue)

    