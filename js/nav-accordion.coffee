---
# Works with .nav-accordion [optionally - .nav-arrow .nav-only-one]
# Automatically builds accordion navigation 
---

buildAccordionNavigation = (sectionTitle) ->

  $(sectionTitle).each ->
    sectionNewTitle = $(@).text()
    #console.log "sectionTitle : #{sectionNewTitle}"
    $(sectionTitle).addClass "show-hide-btn"
    $(@).nextUntil(sectionTitle).wrapAll "<div class='panel panel-answer'/>"
    $(@).nextUntil(sectionTitle).andSelf().wrapAll "<div />"


# if .nav-accordion class exists
if $('.nav-accordion')[0]
   buildAccordionNavigation 'h3'

  if $('.nav-accordion').hasClass 'nav-arrow'
    $('h3').each ->
      $('h3').addClass "arrow"

  if $('.nav-accordion').hasClass 'nav-only-one'
    $('h3').each ->
      $('h3').addClass "only-one"

  $('.nav-accordion').remove();