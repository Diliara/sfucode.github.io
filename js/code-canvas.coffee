---
# CoffeeScript
---
# Where are the files? #

switch window.location.hostname
  when "canvas-test.sfu.ca" then fileLocation = "https://repo.code.sfu.ca/canvas/js/"
  when "canvas-stage.sfu.ca" then fileLocation = "http://sfucode.github.io/js/"
  when "canvas.sfu.ca" then fileLocation = "http://sfucode.github.io/js/"
  when "repo.code.sfu.ca" then fileLocation = "https://repo.code.sfu.ca/canvas/js/"
  when "localhost", "127.0.0.1" then fileLocation = "/js/"
  else fileLocation = ""

# Stuff to check to see if page content has loaded: #

delay = (ms, func) ->
  setTimeout func, ms

typeIsArray = Array.isArray || ( value ) -> return {}.toString.call( value ) is '[object Array]'

pageLoaded = ""

wrappers = 
  [
    { # Course Front Page
      name: "front"
      id: "#course_home_content"
    }
    { # Wiki Page
      name: "wiki"
      id: "#wiki_page_show"
    }
    { # Discussion
      name: "discussion"
      id: "#discussion_topic"
    }
    { # Syllabus
      name: "syllabus"
      id: "#course_syllabus"
    }
    { # Assignment
      name: "assignment"
      id: "#assignment_show"
    }
  ]


pageContentCheck = (elements) ->
  for count, element of elements
    if $(element.id).length > 0 then element.name else

# Code that gets and loads the js file: #

jQuery.runScript = (url, options) ->
  options = $.extend(options or {},
    dataType: "script"
    cache: true
    url: fileLocation + url
  )
  jQuery.ajax options

cachedScript = (url, type, options) ->
  if pageLoaded.length == 0
    delay 100, -> cachedScript(arguments)
  else
    console.log "Page Type: " + pageLoaded
    if type?
      if typeIsArray type
        for y, z of pageLoaded
          for w, x of type
            if x == z then $.runScript url, options
      else
        for y, z of pageLoaded
          if type == z then $.runScript url, options
    else
      $.runScript url, options

$ ->
  console.log "CODE-Canvas Checking In"
  pageLoaded = pageContentCheck(wrappers)
  cachedScript "alert.js"

  #                                #
  # (DO NOT TOUCH ABOVE THIS LINE) #
  #                                #


  # Scripts to be loaded
  #
  # Add this code to include a js file (make sure to include TWO Spaces:
  #   cachedScript "YOUR_FILE_HERE.js"
  # or
  #   cachedScript "YOUR_FILE_HERE.js", "type of page"
  # or
  #   cachedScript "YOUR_FILE_HERE.js", ["array", "of", "page", "types"]
  #

  cachedScript "show-hide-btn.js", "wiki"

