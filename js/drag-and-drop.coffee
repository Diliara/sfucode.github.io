---
# Drag and Drop
---

$(".drag-and-drop").mouseenter ->
    $(@).children('ol').first().children("li").draggable
        revert: "invalid"
        containment: $(@)
        snap: '.drop-area'
        snapMode: 'inner'
        #stack: $(@).children('ol').first().children("li")
        zIndex: 100

    $(@).find('.drop-area').droppable
        accept: $(@).children('ol').first().children('li')
        activeClass: "drop-area-trigger"
        hoverClass: "drop-area-active"
        drop: handleDropEventFunction


handleDropEventFunction = (event, ui) ->
    item = ui.draggable #item that is being dragged and dropped
    item.addClass 'dropped'
    item.draggable 'disable'
    $(@).droppable 'disable' #do not drop in the same box
    console.log "Dropped item: " + item.attr("class").split(' ')[0]
    $(@).addClass("drop-area-dropped").parent().find(".feedback").html "correct!"
    item.position
      of: $(@)
      my: "left bottom"
      at: "left bottom"
    #item.draggable( 'option', 'revert', false );




