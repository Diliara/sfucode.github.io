---
# CoffeeScript
#
# Add this code to include a js file:
# $.cachedScript "YOUR_FILE_HERE.js"
#
---

# Code that gets and loads the js file:

jQuery.cachedScript = (url, options) ->
  options = $.extend(options or {},
    dataType: "script"
    cache: true
    url: url
  )
  jQuery.ajax options

#                                #
# (DO NOT TOUCH ABOVE THIS LINE) #
#                                #

# Where are the files?
fileLocation = "https://repo.code.sfu.ca/canvas/js/"

# Scripts to be loaded
$.cachedScript "show-hide-btn.js"
$.cachedScript fileLocation + "alert.js"
