/**
 * @Created_By  : AALAA
 * @Date        : 2018.03.03 12:48:00 PM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Layout.js
 * @Dependencies: Jquery.js, AALAA.js
 * @LastModified: 18.05.04
 * @version     : 2.0
 **/
/*==================================================================================================================================================*/

function openSearchItemInNewTab() {
    var v = false;
    $.ajax({url: contextPath + "/comHandlerXhr/openSearchItemInNewTab", type: "POST", async: false, dataType: "JSON", success: function (r) {v = r.openSearchItemInNewTab;}});
    return v;
}

$(".authMenuCode").onPressEnter(function () {
    getAuthMenu();
});

$(document).on("click", "#authMenuCode", function () {
    getAuthMenu();
});

function showSessionTimeout(timeRemaining, replaceToId) {
    var x = setInterval(function() {
        // Time calculations for days, hours, minutes and seconds
        var minutes = Math.floor(timeRemaining / 60);
        var seconds = Math.floor(timeRemaining % 60);

        $("#" + replaceToId).text(minutes.toString().padStart(2, '0') + ":" + seconds.toString().padStart(2, '0'));

        if (timeRemaining < 0) {
            clearInterval(x);
            $("#" + replaceToId).text("Expired!");
        }
        else{
            timeRemaining -= 1;
        }
    }, 1000);
}

jQuery(document).ready(function () {
    showSessionTimeout(parseInt(sessionTimeRemaining), "sessionTimer");
});
/*======================================================================================================================================================*/