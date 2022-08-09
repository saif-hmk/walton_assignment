/**
 * @Created_By  : AALAA
 * @Date        : 2019.02.02 10:56:00 PM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : aalaa-menu.js
 * @Dependencies: Jquery.js, AALAA.js
 * @LastModified: 19.02.02
 * @version     : 1.0
 **/
/*==================================================================================================================================================*/
var u = url.split(contextPath)[1], v;
$(document).ready(function () {
    try {
        if (u.split("/").length > 3) u = u.substring(0, u.lastIndexOf("/"));
        else if (u.indexOf("#") > 0) u = "/#" + u.split("#")[1];
    } catch (e) {
        console.log(e)
    }
    if (u) {
        activateMenu(u);
        if (!v) activateMenu("/#" + u.split("/")[1]);
    }
});

function activateMenu(u) {
    try {
        $("section.sidebar > ul.sidebar-menu li").each(function (f) {
            var m = $(this)
            var a = m.find("a[href='" + contextPath + u + "']");
            if (a.attr("href") == (contextPath + u)) {
                m.closest("li").addClass("active");
                v = true;
            }
        });
    } catch (e) {
        console.log(e);
    }
}
function getAuthMenu() {
    var code =  $("input[name='authMenuCode']").val();
    if (code != null && code != "") {
        $.ajax({
            url: contextPath + "/comHandlerXhr/getAuthMenu", type: "POST", async: false, dataType: "JSON", data: {code: code}, success: function (r) {
                //alert($.getStringFromJson(r));
                if(r.url != null && r.url != "null" && r.url != ""){
                    var win = window.open(contextPath + r.url, openSearchItemInNewTab() ? '_blank' : "_self");
                    if (win) {
                        //Browser has allowed it to be opened
                        win.focus();
                    } else {
                        //Browser has blocked it
                        aalaaAlert({type: "MESSAGE", content: "Please allow popups for this application."});
                    }
                }else{
                    aalaaAlert({type: "MESSAGE", content: "Please enter a valid menu code...!"});
                }
            }
        });
    }
}
/*======================================================================================================================================================*/