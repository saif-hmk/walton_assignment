/**
 * @Created_By  : AALAA
 * @Date        : 2018.08.01 03:55:17 PM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-File-Chooser.js
 * @Dependencies: Jquery.js, AALAA.js
 * @LastModified: 19.03.12
 * @version     : 2.0
 **/
/*==================================================================================================================================================*/
//todo: modify file browse system, add single & multi file browse system, add extra content (eg. div, span) automatically.
$(document).on('change', ':file', function () {
//        $(this).closest(".input-group").find(".file-name").val($(this).val().replace(/\\/g, '/').replace(/.*\//, ''));
    $(this).closest(".input-group").find("input[type='text']").val($(this).val().replace(/\\/g, '/').replace(/.*\//, ''));
});
$(document).on('click', '.clear-file', function () {
    $(this).closest(".input-group").find(":file").val("");
    $(this).closest(".input-group").find(".file-name").val("");
    $("." + $(this).closest(".input-group").find(":file").attr("ib")).empty();
});
$(document).on("change", ".file-single", function (e) {
    var ib = $(this).attr("ib");
    if(ib) previewImage(this, ib);
});
function previewImage(imageFile, ib) {
    $("." + ib).empty().append("<img src='' class='single-image img-responsive'/>");
    var fileReader = new FileReader();
    fileReader.onload = function (e) {
        $(".single-image").attr("src", e.target.result);
    }
    fileReader.readAsDataURL(imageFile.files[0]);
}
/*======================================================================================================================================================*/
