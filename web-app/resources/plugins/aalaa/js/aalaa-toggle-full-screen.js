/**
 * @Created_By  : AALAA
 * @Date        : 2016.11.04 03:47:55 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Toggle-Full-Screen.js
 * @Dependencies: Jquery.js, AALAA.js
 * @LastModified: 18.05.04
 * @version     : 3.0
 **/
/*==================================================================================================================================================*/

// $(document).ready(function () {
    // toggleFullScreen(getCookie("FULL_SCREEN"));
// });

// $('.toggle-fullscreen').click(function () {
//     toggleFullScreen();
// });

function toggleFullScreen(fullScreen) {
    if ((fullScreen && fullScreen == "TRUE") || (document.fullScreenElement && document.fullScreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
        if (document.documentElement.requestFullScreen) {
            document.documentElement.requestFullScreen();
        } else if (document.documentElement.mozRequestFullScreen) {
            document.documentElement.mozRequestFullScreen();
        } else if (document.documentElement.webkitRequestFullScreen) {
            document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
        }
        // setCookie("FULL_SCREEN", "TRUE", null);
    } else {
        if (document.cancelFullScreen) {
            document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        }
        // setCookie("FULL_SCREEN", "FALSE", null);
    }
}

$('.toggle-fullscreen').click(function () {
    toggleFullScreen();
});
/*======================================================================================================================================================*/
