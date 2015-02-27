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
        $this = $(this)
        $this.siblings().slideToggle()
        $(".show-hide-btn.only-one").not(this).each() ->
            $thisOnlyOne = $(this)
            $thisOnlyOne.siblings().slideUp()
            if $thisOnlyOne.hasClass(arrow) and $thisOnlyOne.css("background-image").indexOf(closedArrow) is -1
                $thisOnlyOne.css "background-image", (index, value) ->
                    value.replace openArrow, closedArrow
        if $this.hasClass(arrow)
            $this.css "background-image", (index, value) ->
                unless $this.css("background-image").indexOf(closedArrow) is -1
                    value.replace closedArrow, openArrow
                else value.replace openArrow, closedArrow
) jQuery
