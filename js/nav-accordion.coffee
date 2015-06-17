---
# Works with .nav-accordion
# Automatically builds accordion navigation 
---

buildAccordionNavigation = (sectionTitle) ->

  $(sectionTitle).each ->
    sectionNewTitle = $(@).text()
    console.log "sectionTitle : #{sectionNewTitle}"
    $(sectionTitle).addClass "show-hide-btn arrow"
    $(@).nextUntil(sectionTitle).wrapAll "<div class='panel panel-answer'/>"
    $(@).nextUntil(sectionTitle).andSelf().wrapAll "<div />"

# for tabbed nav
if $('.nav-accordion')[0]
  #$('.nav-accordion').nextAll().andSelf().wrapAll "<div id='nav-accordion' />"
  buildAccordionNavigation 'h3'
  $('.nav-accordion').remove();
  #$( "#nav-accordion").accordion();

