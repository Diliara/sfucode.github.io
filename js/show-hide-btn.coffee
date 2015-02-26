---
# works with .show-hide-btn
---


(($) ->

  showHideBtn = $('.show-hide-btn')
  showHideBtnOnlyOne = $('.show-hide-btn.only-one')

  #Arrows for H3s

  showHideBtnWithArrow = $('.arrow')
  #showHideBtnWithArrow = $('h3.show-hide-btn')

  showHideBtnWithArrow.append '<span class="open-arrow"></span><span class="close-arrow"></span>'
  showHideBtnWithArrow.each ->
    $(this).children().hide()

  showHideBtn.click ->
    $(this).siblings().slideToggle()
    showHideBtnOnlyOne.not(this).siblings().slideUp()

  showHideBtnWithArrow.on 'mouseover click', ->
    if $(this).siblings().css('display') == 'block'
      $(this).children('.open-arrow').hide()
      $(this).children('.close-arrow').show()
    else
      $(this).children('.open-arrow').show()
      $(this).children('.close-arrow').hide()

  showHideBtnWithArrow.mouseout ->
    $(this).children('.close-arrow').hide()
    $(this).children('.open-arrow').hide()


) jQuery
