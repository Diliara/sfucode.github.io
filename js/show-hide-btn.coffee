---
---

(($) ->
	$(".show-hide-btn").click ->
		$(this).siblings().slideToggle()
		$(".show-hide-btn .only-one").not(this).siblings().slideUp()
) jQuery
