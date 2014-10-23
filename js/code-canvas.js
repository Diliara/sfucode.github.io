// CODE javascript include

(function () {
    var script_jquery = document.createElement('script');
    script_jquery.src = document.location.protocol + '//code.jquery.com/jquery-1.11.1.min.js';
    document.body.appendChild(script_jquery);

    // testing JS
    document.getElementsByClassName('vid').appendChild(document.createTextNode('Video is loading'));
    document.getElementsByClassName('vid').style.backgroundColor = "black";

})();
