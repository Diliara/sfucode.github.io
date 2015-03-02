---
# Drag and Drop
---

(($) ->

    $("#drag-options").children("li").draggable revert: "invalid"
    $(".drop-area").droppable
      activeClass: "drop-area-trigger"
      hoverClass: "drop-area-active"
      drop: (event, ui) ->
        $(this).addClass("drop-area-dropped").parent().find(".feedback").html "correct!"

) jQuery