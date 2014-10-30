---
#CoffeeScript
---

jQuery.cachedScript = (url, options) ->
  options = $.extend(options or {},
    dataType: "script"
    cache: true
    url: url
  )
  jQuery.ajax options

$.cachedScript "/js/michael2.js"
