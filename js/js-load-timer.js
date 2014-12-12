var path;

switch (window.location.hostname) {
    case "canvas-test.sfu.ca":
        path = "https://repo.code.sfu.ca/canvas/js/";
        break;
    case "canvas-stage.sfu.ca":
        path = "https://sfucode.github.io/js/";
        break;
    case "canvas.sfu.ca":
        path = "https://sfucode.github.io/js/";
        break;
    case "repo.code.sfu.ca":
        path = "https://repo.code.sfu.ca/canvas/js/";
        break;
    case "localhost":
    case "127.0.0.1":
        path = "/js/";
        break;
    default:
        path = "";
}

console.log("I am in js-load-timer.js file")


// If any of these elements exist, we will watch for page content in them to load
var contentWrappersArray = [
    //'#course_home_content', // Course Front Page
    '#wiki_page_show'//, // Content page
    //'#discussion_topic', // Discussions page
    //'#wiki_page_show', // Syllabus page
    //'#assignment_show' // Assignments page
]

// Check to see if the page content has loaded yet
function pageContentCheck(contentWrapperElement) {
    'use strict';
    var contentLoaded = false;
    // Content Pages
    if ($('.show-content').length > 0 && $('.show-content').text().length > 0) {
        contentLoaded = true;

    }





    // Discussions
    //else if ($('#discussion_topic').length > 0 && $('.user_content').text().length > 0) {
    //contentLoaded = true;
    // Assignment (Teacher View)
    // } else if ($('#assignment_show .teacher-version').length > 0) {
    //     contentLoaded = true;
    // } else if ($('#assignment_show .student-version').length > 0) {
    //      contentLoaded = true;
    //  }

    if (contentLoaded) {
        console.log('Content has loaded');
        afterContentLoaded();
    } else {
        setTimeout(function () {
            console.log('Still no content, check again (' + contentWrapperElement + ')');
            pageContentCheck(contentWrapperElement);
        }, 100);
    }
}

// Commands to run after the page content has loaded
function afterContentLoaded() {
    'use strict';
    console.log('afterContentLoaded()');

    // Our scripts
    $.getScript(path + "show-hide-btn.js", function () {
        console.log("show-hide-btn.js should be loaded.");
    });

}


(function () {
    'use strict';
    var i;
    // Identify which page we are on and when the content has loaded
    for (i = 0; i <= contentWrappersArray.length; i++) {
        if ($(contentWrappersArray[i]).length > 0) {
            console.log(contentWrappersArray[i] + ' Found');
            pageContentCheck(contentWrappersArray[i]);
            break;
        }
    }
}());