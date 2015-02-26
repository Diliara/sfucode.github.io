---
# works with .show-hide-btn
---


(($) ->

  showHideBtn = $('.show-hide-btn')
  showHideBtnOnlyOne = $('.show-hide-btn.only-one')

  #Arrows for H3s

  #showHideBtnWithArrow = $('.arrow')
  showHideBtnWithArrow = $('h3.show-hide-btn')

  showHideBtnWithArrow.append '<span class="show-hide-arrow down-arrow">&or;</span><span class="show-hide-arrow up-arrow">&and;</span>'
  showHideBtnWithArrow.each ->
    $(this).children().hide()

  showHideBtn.click ->
    $(this).siblings().slideToggle()
    showHideBtnOnlyOne.not(this).siblings().slideUp()

  showHideBtnWithArrow.mouseover ->
    if $(this).siblings().css('display') == 'block'
      $(this).children('.down-arrow').hide()
      $(this).children('.up-arrow').show()
    else
      $(this).children('.down-arrow').show()
      $(this).children('.up-arrow').hide()

  showHideBtnWithArrow.mouseout ->
    $(this).children('.up-arrow').hide()
    $(this).children('.down-arrow').hide()

  #showHideBtnWithArrow.click ->
    #$(this).children().toggle()
    #showHideBtnWithArrow.not(this).each ->
      #$(this).children().first().hide()
      #$(this).children().last().show()

) jQuery
