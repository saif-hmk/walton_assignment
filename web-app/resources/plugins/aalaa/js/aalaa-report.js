/**
 * @Created_By  : AALAA Technology
 * @Date        : 2020.10.27 06:34:55 PM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : aalaa-default.js
 * @Dependencies: Jquery.js
 * @LastModified: 21.05.22
 * @version     : 3.5
 **/
/*==================================================================================================================================================*/
var lang          = "en",    //todo: skip converting value (depending on lang) at service layer. get directly from session/db/function/json on load.
    reports       = {},
    reportFormats = "" +
        "<option value=''     >Select One    </option>" +
        "<option value='DOCX' >DOCX          </option>" +
        "<option value='PDF_D'>PDF - Download</option>" +
        "<option value='PDF_V'>PDF - View    </option>" +
        "<option value='RTF'  >RTF           </option>" +
        "<option value='XLS'  >XLS           </option>" +
        "<option value='XLSX' >XLSX          </option>",
    paramsBlock =
        "<div class='box-body' id='paramsPanel'>" +
        "    <legend>Parameters</legend>" +
        "    <div id='paramsBlock'></div>" +
        "</div>",
    refreshButton =
        "<li>" +
        "   <button type='button' class='btn btn-block btn-purple btn-xs' id='refreshReport' title='Refresh Components'>" +
        "       <i class='fa fa-refresh'></i> " +
        "       Refresh" +
        "   </button>" +
        "</li>";

$(document).ready(function () {
    $(".top-links").append(refreshButton);
    $("#reportPanel").after(paramsBlock);
    getReports();


    //validateCryptos();
});

//todo move to proper package
function validateCryptos() {
    /**
     *Todo: evaluate script/js using hash code
     * to compare scripts use these.
     **/

    console.log("AALAA Technoloty".toHashNo());
    console.log("AALAA Technoloty".toMd5   ());
    console.log("AALAA Technoloty".toSha256());
    var aesString = "AALAA Technoloty".encryptAsAesString("secretKey");
    console.log(aesString);
    console.log(aesString.decryptFromAesString("secretKey"));
}




function getReports() {
    try {
        reports = JSON.parse($.getFromLocalStorage("RPT_REPORTS"));
    } catch (e) {
        console.log(e);
    }
    if(!reports){
        reports = getResponseByXhr({controller: "rptReport", action: "getReports"});
        $.setToLocalStorage("RPT_REPORTS", JSON.stringify(reports));
    }
    return reports;
}

function getReport(key) {
    return findByKey(reports, key);
}

function refreshDefaults(m) {
    $("#rptReportFormat").val(m.defaultFormat.key);
}

function refreshMessage(m) {
    if(m.exist){
        var t = m.type, x = m.text, c = "", i = "", messageBlock = "";
        switch(t) {
            case "message":
                c = "alert-info message";
                i = "fa-info";
                break;
            case "success":
                c = "alert-success success";
                i = "fa-check";
                break;
            case "warning":
                c = "alert-warning warning";
                i = "fa-remove";
                break;
            default:
                c = "alert-danger exception";
                i = "fa-remove";
        }
        messageBlock += "<div id='messageBlock' class='m-l-25 m-r-25 alert alert-dismissable " + c + "'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button><i class='icon fa " + i + "'></i> " + x + "</div>"
        $(  "#reportPanel").after(messageBlock);
        removeMessage();
    }
}

function removeMessage() {
    setTimeout(function () {
        $('.success').fadeTo(5000, 0).slideUp();
    }, 15000);
    setTimeout(function () {
        $('.message').fadeTo(5000, 0).slideUp();
    }, 60000);
    setTimeout(function () {
        $('.warning').fadeTo(5000, 0).slideUp();
    }, 30000);
    setTimeout(function () {
        $('.error').fadeTo(5000, 0).slideUp();
    }, 120000);
    setTimeout(function () {
        $('.exception').fadeTo(5000, 0).slideUp();
    }, 120000);
}

function generateComponent(params) {
    //console.log("params:\n" + JSON.stringify(params));
    var components = "";
    if(params)
    for (var i = 0; i < params.length; i++) {
        //console.log("params:" + (i+1) + ":\n\t" + JSON.stringify(params[i]));
        var p = params[i], a = p.rptParameter, required = p.required, classLabel = p.classLabel,
            lc = ((required ? "required" : "") + (classLabel ? " " + classLabel : "")).trim(),
            //component = "<div class='" + p.classResponsive + "'><div class='form-group'><label " + (lc ? " class='" + lc + "'" : "") + ">" + a.title + " <span class='c-purple'>(" + p.dataType + ")</span>" + "</label>";
            component = "<div class='" + p.classResponsive + "'><div class='form-group'><label " + (lc ? " class='" + lc + "'" : "") + ">" + a.title + "</label>";
        try {
            if (p.dataType == "STRING"     ) {  //done
                component += "<input type='text' name='" + a.keyword + "'" + (p.jsId ? " id='" + p.jsId + "'" : "") + (p.classCss ? " class='" + p.classCss + "'" : "") + (p.defaultValue ? " value='" + p.defaultValue + "'" : "") + (p.placeholder ? " placeholder='" + p.placeholder + "'" : "") + (p.title ? " title='" + p.title + "'" : "") + (required ? " required" : "") + (p.min ? " minLength='" + p.min + "'" : "") + (p.max ? " maxLength='" + p.max + "'" : "") + ">";
            }
            else if (p.dataType == "CSV"        ) {
                /**
                 *TODO ADD Something for Tags/CSV's.
                 * Use dropdown/multiSelect for small dataset & autoComplete for big dataset.
                 * Add Length/Min-Max Property to verify quantity.
                 **/
                component += "<input type='text' name='" + a.keyword + "'" + (p.jsId ? " id='" + p.jsId + "'" : "") + (p.classCss ? " class='" + p.classCss + "'" : "") + (p.defaultValue ? " value='" + p.defaultValue + "'" : "") + (p.placeholder ? " placeholder='" + p.placeholder + "'" : "") + (p.title ? " title='" + p.title + "'" : "") + (required ? " required" : "") + ">";
            }
            else if (p.dataType == "DATE"       ) {
                //TODO: addOrLess option.
                component += "<input type='text' name='" + a.keyword + "'" + (p.jsId ? " id='" + p.jsId + "'" : "") + (p.classCss ? " class='" + p.classCss + "'" : "") + (p.defaultValue ? " value='" + p.defaultValue + "'" : "") + (p.placeholder ? " placeholder='" + p.placeholder + "'" : "") + (p.title ? " title='" + p.title + "'" : "") + (required ? " required" : "") + (p.min ? " fromDate='" + p.min + "'" : "") + (p.max ? " toDate='" + p.max + "'" : "") + ">";
            }
            else if (p.dataType == "TIME"    || p.dataType == "DATE_TIME" || p.dataType == "YEAR") {
                //TODO:add 24 hour time format (class), change year picker.
                component += "<input type='text' name='" + a.keyword + "'" + (p.jsId ? " id='" + p.jsId + "'" : "") + (p.classCss ? " class='" + p.classCss + "'" : "") + (p.defaultValue ? " value='" + p.defaultValue + "'" : "") + (p.placeholder ? " placeholder='" + p.placeholder + "'" : "") + (p.title ? " title='" + p.title + "'" : "") + (required ? " required" : "") + ">";
            }
            else if (p.dataType == "INTEGER" || p.dataType == "LONG"      || p.dataType == "BIG_DECIMAL" || p.dataType == "FLOAT"   || p.dataType == "DOUBLE") {
                //done
                component += "<input type='number' name='" + a.keyword + "'" + (p.jsId ? " id='" + p.jsId + "'" : "") + (p.classCss ? " class='" + p.classCss + "'" : "") + (p.defaultValue ? " value='" + p.defaultValue + "'" : "") + (p.placeholder ? " placeholder='" + p.placeholder + "'" : "") + (p.title ? " title='" + p.title + "'" : "") + (required ? " required" : "") + (p.min ? " min='" + p.min + "'" : "") + (p.max ? " max='" + p.max + "'" : "") + (p.step ? " step='" + p.step + "'" : "") + ">";
            }
            else if (p.dataType == "BOOLEAN"    ) { //done
                component += "<label class='switch'><input type='checkbox' name='" + a.keyword + "'" + (p.jsId ? " id='" + p.jsId + "'" : "") + (p.classCss ? " class='" + p.classCss + "'" : "") + (p.defaultValue ? " value='" + p.defaultValue + "'" : "") + (required ? " required" : "") + "><div class='slider round'></div></label>";
            }
            else if (p.dataType == "CHECKBOX"   ) { //done
                component += "<input type='checkbox' name='" + a.keyword + "'" + (p.jsId ? " id='" + p.jsId + "'" : "") + (p.classCss ? " class='" + p.classCss + "'" : " class='cb'") + (p.defaultValue ? " value='" + p.defaultValue + "'" : "") + (required ? " required" : "") + ">";
            }
            else if (p.dataType == "RADIO"      ) { //done
                for (var k = 0; k < a.rptParameter.length; k++) {
                    var o = a.rptParameter[k], v = o.title, n = o.titleNative, s = (p.defaultValue == o.title.toLowerCase() ? true : false), w = (!k == 0 ? "&nbsp;&nbsp;" : "");
                    component += w + "<input type='radio' name='" + a.keyword + "'" + (p.classCss ? (" class='" + p.classCss + "'") : "") + (" value='" + k + "'") + (required ? " required" : "") + (s == true ? " checked" : "") + ">&nbsp;<label for='" + k + "'>" + (lang == "en" ? v : n) + "</label>";
                }
            }
            else if (p.dataType == "LIST" || p.dataType == "SET") {
                /***
                 *TODO COMPLETE
                 * Note:
                 * To generate a dropdown we have required a dataset with key & value pair.
                 * That means, to check that, is it comes from db or not is not our concern. We have to focus on dataset. Not on source.
                 * Only Enum typed list's will create issues. To bypass it we have to create a Table (to generate options) as like Enum.
                 * Table should have to create under Report module (Not under common). So that we could avoid the conflict between Enum & Table.
                 ***/
                //console.log(p.dropDownList);
                component += "<select name='" + a.keyword + "'" + (p.jsId ? " id='" + p.jsId + "'" : "") + (p.classCss ? " class='" + p.classCss + "'" : "") + (p.defaultValue ? " value='" + p.defaultValue + "'" : "") + (p.placeholder ? " placeholder='" + p.placeholder + "'" : "") + (p.title ? " title='" + p.title + "'" : "") + (required ? " required" : "") + ">" + p.dropDownList + "</select>";
            }
        } catch (e) {
            console.log(e);
        }
        component  += "</div></div>";
        components += component;
    }
    return components;
}

function initializeScripts(s) {
    for (var i = 0; i < s.length; i++) {
        var script = s[i].script
        if(script){
            try {
                eval(script);
            } catch (e) {
                console.log(script);
                console.log(e)
            }
        }
    }
}

$(document).on("change", "#rptReport", function () {
    $("#messageBlock"   ).remove();
    $("#paramsBlock"    ).empty();
    $("#paramsPanel"    ).hide();
    $("#rptReportFormat").empty().append(reportFormats);
    var id = $(this).val();
    if(id){
        var r = getReport(id.toString());
        if(!r){
            $.removeFromLocalStorage("RPT_REPORTS");
            aalaaAlert({type: "MESSAGE", content: "Please reload your page and try again."});
        }
        else{
            var meta = r.meta, f = r.formats, p = r.params, c = generateComponent(p);
            $("#rptReportFormat").empty().append(f);
            if(c){
                $("#paramsBlock").append(c);
                $("#paramsPanel").show();
            }
            if(r.scripts.length > 0){
                initializeScripts(r.scripts);
            }
            refreshDefaults(meta);
            refreshMessage(meta.message);
            initializeAllDependencies();
        }
    }
});

$(document).on("click", "#refreshReport", function () {
    Pace.start();
    setTimeout(function(){
        $.removeFromLocalStorage("RPT_REPORTS");
        getReports();
        aalaaAlert({type: "MESSAGE", content: "Report components has been refreshed successfully."});
    }, 500);
    Pace.stop();
});
