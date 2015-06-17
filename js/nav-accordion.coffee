---
# Works with .nav-accordion .nav-arrow .nav-only-one
# Automatically builds accordion navigation 
---

buildAccordionNavigation = (sectionTitle) ->

  $(sectionTitle).each ->
    sectionNewTitle = $(@).text()
    #console.log "sectionTitle : #{sectionNewTitle}"
    $(sectionTitle).addClass "show-hide-btn"
    $(@).nextUntil(sectionTitle).wrapAll "<div class='panel panel-answer'/>"
    $(@).nextUntil(sectionTitle).andSelf().wrapAll "<div />"

# for tabbed nav
if $('.nav-accordion')[0]
  #$('.nav-accordion').nextAll().andSelf().wrapAll "<div id='nav-accordion' />"
  #$( "#nav-accordion").accordion();
  buildAccordionNavigation 'h3'

  if $('.nav-accordion').hasClass 'nav-arrow'
    $('h3').each ->
      $('h3').addClass "arrow"

  if $('.nav-accordion').hasClass 'nav-only-one'
    $('h3').each ->
      $('h3').addClass "only-one"

  $('.nav-accordion').remove();