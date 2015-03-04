---
# Drag and Drop
---

$(".drag-and-drop").mouseenter ->
    $(@).children('ol').first().children("li").draggable
        revert: true
        #cursor: 'move'
        containment: $(@)
        snap: '.drop-area'
        snapMode: 'inner'
        #stack: $(@).children('ol').first().children("li")
        zIndex: 100

    $(@).find('.drop-area').droppable
        accept: $(@).children('ol').first().children('li')
        activeClass: "drop-area-trigger"
        hoverClass: "drop-area-hover"
        drop: handleDropEventFunction


handleDropEventFunction = (event, ui) ->
    item = ui.draggable #item that is being dragged and dropped
    itemClass = item.attr("class").split(' ')[0]
    dropArea = $(@)
    dropAreaClass = $(@).attr("class").split(' ')[0]

    if itemClass is dropAreaClass
        item.addClass 'dropped'
        item.draggable 'disable'
        $(@).droppable 'disable' #do not drop in the same box

        console.log "Dragged and drpped item: " + itemClass
        console.log "Dropped area: " + dropAreaClass

        $(@).addClass("drop-area-dropped")

        #$(@).addClass("drop-area-dropped").parent().find(".feedback").html "correct!"
        item.position
          of: $(@)
          my: "left bottom"
          at: "left bottom"
        item.draggable( 'option', 'revert', false );




