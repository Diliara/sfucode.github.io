---
# CoffeeScript
# Where are the js files? #
---

switch window.location.hostname
# when "canvas-test.sfu.ca" then fileLocation = "https://diliara.github.io/sfucode.github.io/js/"
  when "canvas-test.sfu.ca" then fileLocation = "https://repo.code.sfu.ca/canvas/js/"
  when "canvas-stage.sfu.ca" then fileLocation = "https://sfucode.github.io/js/"
  when "canvas.sfu.ca" then fileLocation = "https://sfucode.github.io/js/"
  when "repo.code.sfu.ca" then fileLocation = "https://repo.code.sfu.ca/canvas/js/"
  when "localhost", "127.0.0.1" then fileLocation = "/js/"
  else fileLocation = ""

# Function to use setTimeout: #

delay = (ms, func) ->
  console.log "Waiting..."
  setTimeout func, ms

# Function to check if something is an array: #

typeIsArray = Array.isArray || ( value ) -> return {}.toString.call( value ) is '[object Array]'

# What page elements are we testing for? #

wrappers =
  [
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

# Need to globably initialize the pageLoaded variable #

pageLoaded = ""

# Function to check for the page elements above: #

pageContentCheck = (elements) ->
  for count, element of elements
    if $(element.id).html() then element.name else

# Function to get and load the js files: #

jQuery.runScript = (url, options) ->
  options = $.extend(options or {},
    dataType: "script"
    cache: true
    url: fileLocation + url
  )
  jQuery.ajax options

# Function that checks to see if the page elements have loaded their content: #

cachedScript = (url, type, options) ->
  pageLoaded = pageContentCheck(wrappers)
  if pageLoaded.length == 0
    delay 100, -> cachedScript(url, type, options)
  else
    console.log "Found: #{pageLoaded}"
    if type?
      if typeIsArray type
        for y, z of pageLoaded
          for w, x of type
            if x == z
              console.log "Loading: #{url} (#{z})"
              $.runScript url, options
              return
      else
        for y, z of pageLoaded
          if type == z
            console.log "Loading: #{url} (#{z})"
            $.runScript url, options
            return
    else
      console.log "Loading: #{url}"
      $.runScript url, options
      return

# Code that loads when the document is ready: #

$ ->
  console.log "CODE-Canvas Checking In"
  cachedScript "alert.js"

  # How to load a script:
  #
  # Add this code to include a js file (make sure to include >TWO< Spaces at the front):
  #   cachedScript "YOUR_FILE_HERE.js"
  # or
  #   cachedScript "YOUR_FILE_HERE.js", "type of page"
  # or
  #   cachedScript "YOUR_FILE_HERE.js", ["array", "of", "page", "types"]
  #
  #                                #
  # (DO NOT TOUCH ABOVE THIS LINE) #
  #                                #

  #vendors
  #cachedScript "vendors/jquery-scrollspy.js"

  #cachedScript "vendors/prism.js"
  #cachedScript "vendors/prism-vb.js"


  #CODE Development
  cachedScript "nav-accordion.js"

  #CODE
  cachedScript "show-hide-btn.js"
  cachedScript "nav-build.js"
  cachedScript "drag-and-drop.js"
  cachedScript "nav-tabs.js"




  #CODE Postponed
  #cachedScript "nav-scrollspy.js"

