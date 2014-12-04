---
# CoffeeScript
#
# Add this code to include a js file:
# $.cachedScript "YOUR_FILE_HERE.js"
#
---

# Where are the files?

switch window.location.hostname
	when "canvas-test.sfu.ca" then fileLocation = "https://repo.code.sfu.ca/canvas/js/"
	when "canvas-stage.sfu.ca" then fileLocation = "http://sfucode.github.io/js/"
	when "canvas.sfu.ca" then fileLocation = "http://sfucode.github.io/js/"
	when "localhost" then fileLocation = /js/"
	else fileLocation = ""

# Code that gets and loads the js file:

jQuery.cachedScript = (url, options) ->
  options = $.extend(options or {},
    dataType: "script"
    cache: true
    url: fileLocation + url
  )
  jQuery.ajax options

#                                #
# (DO NOT TOUCH ABOVE THIS LINE) #
#                                #


# Scripts to be loaded
$.cachedScript "show-hide-btn.js"
