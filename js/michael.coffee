---
#CoffeeScript
---

$.cachedScript = (url, options) ->
  
  options = $.extend(options or {},
    dataType: "script"
    cache: true
    url: url
  )
  
  $.ajax options

$.cachedScript "michael2.js"
