/**
 * @Created_By  : AALAA
 * @Date        : 2017.01.17 9:55:17 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Checkbox.js
 * @Dependencies: Jquery.js, AALAA.js
 * @LastModified: 18.05.04
 * @version     : 2.0
 **/
/*==================================================================================================================================================*/

$(document).on('click', ".checkAll", function () {
    if ($(this).is(':checked')) {
        $(".checkThis").each(function () {
            $(this).prop("checked", true);
            $(this).closest('td').find('input[type=hidden]').prop('disabled', false);
        });
    }
    else {
        $(".checkThis").each(function () {
            $(this).prop("checked", false);
            $(this).closest('td').find('input[type=hidden]').prop('disabled', true);
        });
    }
});

$(document).on('click', '.checkThis', function () {
    if ($(this).is(':checked')) {
        $(this).closest('td').find('input[type=hidden]').prop('disabled', false);
    }
    else {
        $(this).closest('td').find('input[type=hidden]').prop('disabled', true);
    }
});

function isCheckedAtLeastOne(t) {
    var isChecked = false;
    t.find(".checkThis").each(function () {
        if ($(this).is(':checked')) {
            isChecked = true;
            return;
        }
    });
    return isChecked;
}

$("button#validateCheck").on("click", function (x) {
    var t = $(this); validationMessage = t.attr("validationMessage");
    $("form").submit(function(e){e.preventDefault();});

    // console.log(aalaaAlert({type: "MESSAGE", content: "Are you sure, you want to proceed...?"}));

    if (confirm(validationMessage)) {
    //if (aalaaConfirm(null, null, "Are you sure, you want to proceed...?")) {
    // var r = aalaaConfirm(null, null, validationMessage);
    //     alert(r.toString());
    // if (r!=null) {
        if(isCheckedAtLeastOne(t.closest("form"))){
            $('form').unbind('submit').submit();
        }
        else {
            aalaaAlert({type: "MESSAGE", content: "Please check at least one item!"});
        }
    }
});
/*============================================================================================================================================*/
