---
# works with .show-hide-btn
---

# Name of arrow images (without extention)
openArrow = "slider_open"
closedArrow = "slider_closed"

# Name of arrow class
arrow = "arrow"

(($) ->
    $(".show-hide-btn").click ->
        $(@).siblings().slideToggle()
        $(".show-hide-btn.only-one").not(this).each ->
            $(@).siblings().slideUp()
            if $(@).hasClass(arrow) and $(@).css("background-image").indexOf(closedArrow) is -1
                $(@).css "background-image", (index, value) ->
                    value.replace openArrow, closedArrow
        if $(@).hasClass(arrow)
            $(@).css "background-image", (index, value) ->
                unless $(@).css("background-image").indexOf(closedArrow) is -1
                    value.replace closedArrow, openArrow
                else value.replace openArrow, closedArrow
) jQuery
