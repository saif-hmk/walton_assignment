/**
 * @Created_By  : AALAA
 * @Date        : 2016.07.12 01:00:55 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Master-Details.js
 * @Dependencies: Jquery.js, AALAA.js, select2.js, iCheck.js, datepicker.js, AALAA-Confirm.js
 * @LastModified: 17.12.10
 * @version     : 3.0
 **/
/*==================================================================================================================================================*/

//----------------------------------------------------------------------------------------------------------------------------------
//  Master Details : Div > Add More
//----------------------------------------------------------------------------------------------------------------------------------
function dtlAdd(selectorClass) {
    var selectorIndex = $("." + selectorClass).length, cloneElement = "." + selectorClass + ":last";
    $(cloneElement).clone().insertAfter(cloneElement).show().find("*").each(function () {
        var name = this.name || "";
        this.name = name.replace(/\d+/, selectorIndex);
        var id = this.id || "";
        this.id = id.replace(/\d+/, selectorIndex);
    });
    var removeBtn = '<div class="box-footer"><div class="pull-right"><a class="btn btn-block btn-danger btn-xs" onclick="dtlRemove(\'' + selectorClass + '\', this);"><i class="fa fa-minus"></i>Remove</a></div></div>';
    if ($(cloneElement + " > .box-footer").length == 0) {
        $(cloneElement + " > .box-body").after(removeBtn);
    }
    /*------------------------------------------------------------------------------------------------------------------------------------------------------*/
    /*
     var removeBtn =
     '<div class="pull-right" style="padding-right: 10px">'+
     '   <a class="btn btn-block btn-danger btn-xs" onclick="dtlRemove(\'' + selectorClass + '\', this);">'+
     '       <i class="fa fa-minus">Remove</i>'+
     '   </a>'+
     '</div>';
     if ($(cloneElement + " > .box-footer").length == 0) {
     alert('dkjasldfj');
     $(cloneElement).after(removeBtn);
     }
     */
    /*------------------------------------------------------------------------------------------------------------------------------------------------------*/
    $(cloneElement).find('input').val('');
    $(cloneElement).find('textArea').val('');
    $(cloneElement).find('select').val('');
    $(cloneElement).find('.notCopy').after("<label>&nbsp;<label>");
    $(cloneElement).find('.notCopy').remove();
    selectorIndex++;
    return true;
}

function dtlRemove(selectorClass, _this) {
    $(_this).closest("." + selectorClass).remove();
    return true;
}

//==================================================================================================================================

$(document).ready(function () {
    refreshEscapableBlock();
    $(".md-table-am").each(function () {
        $(this).find("thead tr th:first").attr("colspan","2");
        var crude = "<td class='md-tr-crude'><label>&nbsp;</label></td>";
        var cTr = $(this).find("tbody>tr");
        if (cTr.length <= 1){
            $(cTr).find("td:first").before(crude);
            var eEn = $(this).find("tbody tr td:last").find(".removeThis").prop("name").replace('btnRemoveThis', 'id'), eId = $("[name='" + eEn + "']").val();
            if(eId){
                validateCrudeActivity(cTr, "r");
            }
            validateFirstRow($(this).find("tbody>tr:first"));
        }else{
            cTr.each(function () {
                $(this).find("td:first").before(crude);
                validateCrudeActivity(this, "r");
            });
        }
    });
});

function validateFirstRow(fTr) {
    /*
    * Note:
    * If no value found (while searching value exist or not @ first row) then disable all field including "hidden type"
    */
    // fRi = fTr.find('input,textarea,select,checkbox,radio').not(":hidden"), nVf = true;
    fRi = fTr.find('input,textarea,select,checkbox,radio'), nVf = true;
    fRi.each(function(i, e) {
        $(this).addClass("fR");
        if ($(e).is('input') || $(e).is('textArea')) {
            /*
             * HTML5 added several new input types:
             * color, date, datetime-local, email, month, number, range, search, tel, time, url & week
             */
            var type = $(this).prop('type');
            //alert(type);
            //alert($(this).val());
            if (type == 'number' && (!$(this).val() == "0" || !$(this).val() == "")) {
                nVf = false;
                return false;   //brake form main loop
            }
            else if (type == 'checkbox' && $(this).is(":checked")) {
                nVf = false;
                if ($(this).hasClass("cb")){
                    //alert($(this).prop("class"));
                    //alert(getStringFromJson($(this).parent().parent().html()));
                    $(this).removeClass("dFr");
                    // $(this).parent().removeAttr("aria-disabled");
                }
                return false;   //brake form main loop
            }
            else if (type == 'text' || type == 'textarea' || type == 'email' || type == 'password' || type == 'file' || type == 'url' ||  type == 'search' || type == 'date' || type == 'datetime-local' || type == 'month' || type == 'week' || type == 'tel' || type == 'time' || type == 'color' || type == 'range'){
                if (!$(this).val() == ""){
                    nVf = false;
                    return false;   //brake form main loop
                }
            }
        }
        else if ($(e).is('select')) {
            if (!$(e).val() == "0" || !$(e).val() == "") {
                nVf = false;
                return false;   //brake form main loop
            }
        }
    });
    fRi.each(function () {
        if (nVf == true) {
            $(this).addClass("dFr");
        } else {
            $(this).removeClass("dFr");
        }
    });
    $(".dFr").prop("disabled", true);
    reInitializeAllDependencies();
    return nVf;
}

function enableFirstRow(fTr) {
    /*
    * @Note : If you want to disable a field, you should have to put a class "disabled" to those field, don't use property "disabled" directly.
    */
    fTr.find('*').each(function () {
        if ($(this).attr("class") && !$(this).hasClass("disabled"))
            $(this).removeClass("dFr").removeAttr("disabled");
    });
}

function resetAllValue(cTr) {
    /*
     *@Options (tested) covered by custom-master-details;
     *@Option dont-reset         : if not want to remove value.
     *@Option data-target                : if want to open modal.
     *@Option input[type:text]
     *@Option input[type:number]
     *@Option input[type:password]
     *@Option select[option:value]       : don't remove value.
     *@Option select[options:selected]   : singleSelect or multiSelect.
     *@Option input[type:email]
     *@Option input[type:url]
     *@Option img[src]
     *
     *@Option input[type:date]           //Not yet added
     */
    cTr.find('*').each(function () {
        var d = $(this), src = $(this).attr('src') || "";
        if (d.hasClass('dont-reset')) {
            /*Do Nothing*/
        }
        else if (this.tagName.toLowerCase() == 'option') {
            if (d.closest('select').hasClass('dont-reset')) {
                /*Do Nothing*/
            }
            else {
                d.removeAttr('selected');
            }
        }
        else if (src) d.attr('src', '');
        else d.val('');
    });
    return true;
}

function resetAllIndex(cTb) {
    cTb.find('tr').each(function () {
        var t = $(this).index();
        $(this).find('*').each(function () {
            var n = this.name || "", i = this.id || "", dt = $(this).attr('data-target') || "";
            this.name ? this.name = n.replace(/\d+/, t) : "";
            this.id ? this.id = i.replace(/\d+/, t) : "";
            dt ? $(this).attr('data-target', dt.replace(/\d+/, t)) : "";
        });
    });
    return true;
}

function reInitializeAllDependencies() {
    //var fd = "dd/mm/yyyy";
    $(".select-with-search").select2();

    $(".select-multiple").select2({
        multiple: true,
        placeholder: "Select One",
        allowClear: true
    });

    $('.cb').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        increaseArea: '70%' // optional
    });

    $('.rb').iCheck({
        radioClass: 'iradio_square-blue',
        increaseArea: '70%' // optional
    });

    $('.dtp-date').datepicker({
        autoclose: true,
        multidate: false,
        format: fdUi,
        clearBtn: true,
        keyboardNavigation: true,
        todayHighlight: true,
        weekStart: 0
    }).prop('placeholder', fd);
}

function deleteIt(eEn, eId) {
    var status = {};
    $.ajax({
        async  : false,
        type   : "POST",
        url    : contextPath + "/comHandlerXhr/deleteIt",
        data   : {dn: eEn, id: eId},
        success: function (r) {
            status = r;
        }
    });
    return status;
}

function validateCrudeActivity(cTr, status) {
    $(cTr).find(".md-tr-crude").attr("class", "md-tr-crude md-status-" + status);
}

//----------------------------------------------------------------------------------------------------------------------------------
$(document).on("click", ".addMore", function () {
    //todo: add after cTr, not fTr
    var cTb = $(this).closest('tbody'), cTr = $(this).closest('tr'), cE = cTr.clone(), fTr = $(this).closest("tbody").find("tr:first"), iiFr = validateFirstRow(fTr);
    if (!iiFr) {
        resetAllValue(cE);
        cTr.after(cE);
        resetAllIndex(cTb);
        validateCrudeActivity(cE, "c");
    } else {
        validateCrudeActivity(cTr, "c");
        enableFirstRow(fTr);
    }
    reInitializeAllDependencies();
});

$(document).on("click", ".removeThis", function () {
    var cTb = $(this).closest('tbody'), cTr = $(this).closest('tr'), tTr = cTb.find('tr:last').index(), eEn = this.name.replace('btnRemoveThis', 'id'), eId = $("[name='" + eEn + "']").val(), message = "Data removed successfully...!";
    if(eId){
        if (confirm("Are you sure, you want to delete this (and all things associated with this) record...?")) {
            var status = false;
            try {
                validateCrudeActivity(cTr, "d");
                var r = deleteIt(eEn.split('[')[0], eId);
                //alert(JSON.stringify(r));
                if(r.status == "SESSION_OUT"){
                    message = "Sorry, your session has been expired! Please login again and try later!";
                    alert(message);
                }
                else if(r.status == "NOT_CONFIGURED"){
                    message = "Sorry, Deleting from this table has not yet configured!";
                    alert(message);
                }
                else if(r.status == "NOT_AUTHORISED"){
                    message = "Sorry, You are not authorised to perform this activity!";
                    alert(message);
                }
                else if(r.status == "FAILED"){
                    message = "Sorry, an internal error occurred please contact with authority!\n" + r.errorMessage;
                    alert(message);
                }
                else status = true;
            } catch (e) {
                message = "Sorry, failed to removed record...!";
                console.log(e);
            }
            if (status == true) {
                if (tTr > 0) {
                    cTr.remove().fadeOut('slow');
                }
                else {
                    resetAllValue(cTr);
                    validateFirstRow(cTr);
                }
                resetAllIndex(cTb);
            }
        }
    }
    else {
        if (confirm("Are you sure, you want to remove this row...?")) {
            if (tTr > 0) {
                cTr.remove().fadeOut('slow');
            }
            else {
                resetAllValue(cTr);
                validateFirstRow(cTr);
            }
            resetAllIndex(cTb);
            aalaaAlert({type: "MESSAGE", content: message});
        }
    }
});

$(document).on("click", ".escape-this-block", function () {
    refreshEscapedBlock($(this));
});

function refreshEscapedBlock(i) {
    if(i.is(':checked')){
        i.closest(".escapable-block").find("input, select, textarea").not(".escape-this-block").each(function () {
            $(this).prop("disabled", true);
        });
    }
    else{
        i.closest(".escapable-block").find("input, select, textarea").not(".escape-this-block").each(function () {
            $(this).prop("disabled", false);
        });
    }
}

function refreshEscapableBlock() {
    $(".escape-this-block").each(function () {
        refreshEscapedBlock($(this));
    });
}
//==================================================================================================================================
