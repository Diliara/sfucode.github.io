---
# works with .show-hide-btn
---


(($) ->

  showHideBtn = $('.show-hide-btn')
  showHideBtnOnlyOne = $('.show-hide-btn.only-one')

  showHideBtn.click ->
    $(this).siblings().slideToggle()
    showHideBtnOnlyOne.not(this).siblings().slideUp()


  #Arrows for H3s

  #showHideBtnWithArrow = $('.arrow')
  showHideBtnWithArrow = $('h3.show-hide-btn')

  showHideBtnWithArrow.append '<span class="show-hide-arrow">&darr;</span><span class="show-hide-arrow">&rarr;</span>'
  showHideBtnWithArrow.each ->
    $(this).children().first().hide()

  showHideBtnWithArrow.click ->
    $(this).children().toggle()
    showHideBtnWithArrow.not(this).each ->
      $(this).children().first().hide()
      $(this).children().last().show()


) jQuery
