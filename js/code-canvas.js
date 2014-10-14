// CODE javascript include

(function () {
    var script_modernizr = document.createElement('script');
    var script_jquery = document.createElement('script');
    var script_foundation = document.createElement('script');
    var script_foundation_init = document.createElement('script');

    //script_jquery.type = 'text/javascript';
    //script_foundation.type = 'text/javascript';

    script_modernizr.src = 'js/vendor/modernizr.js';
    script_jquery.src = document.location.protocol + '//code.jquery.com/jquery-1.11.1.min.js';
    script_foundation.src = 'js/foundation.min.js';

    document.getElementsByTagName('head')[0].appendChild(script_modernizr)
    document.body.appendChild(script_jquery);
    document.body.appendChild(script_foundation);

    script_foundation_init.appendChild(document.createTextNode("$(document).foundation();"));
    document.body.appendChild(script_foundation_init);

})();
