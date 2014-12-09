$(document).ready(function(){
    $(".show-hide-btn").css("background-color", "green");
    $(".show-hide-btn").click(function() {
        $(this).parent().children().not(".show-hide-btn").slideToggle();
    });
});