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

/*	Code to include js files:
	$.cachedScript "/js/YOUR_FILE.js" 
*/

