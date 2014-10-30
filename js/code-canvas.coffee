---
#CoffeeScript
---

# Code that gets and loads the js file:

jQuery.cachedScript = (url, options) ->
  options = $.extend(options or {},
    dataType: "script"
    cache: true
    url: url
  )
  jQuery.ajax options

# Add this code below to include a js file:
#
# $.cachedScript "/js/YOUR_FILE_HERE.js"
#
# (DO NOT TOUCH ABOVE THIS LINE)

