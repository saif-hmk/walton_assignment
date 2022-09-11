/**
 * @Created_By  : AALAA Technology
 * @Date        : 2017.05.06 02:13:55 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : aalaa-dashboard.js
 * @Dependencies: Jquery.js, aalaa.js, aalaa-color.js
 * @LastModified: 22.01.30
 * @version     : 2.5
 **/
/*==================================================================================================================================================*/
//https://www.chartjs.org/samples/2.6.0/
//https://www.chartjs.org/docs/3.3.2/samples/bar/vertical.html
//https://www.chartjs.org/docs/3.7.0/samples/bar/vertical.html
//https://tobiasahlin.com/blog/chartjs-charts-to-get-you-started/
let lastStorageTime,
    admBranch,
    dbDrToDate     = new Date(),
    dbDrFromDate   = new Date(new Date().setDate(dbDrToDate.getDate() - 29)),
    dbDatums       = {},
    buttons        =
        "<li>" +
        "   <input type='text' class='dtp-date im-date ac-off btn-large center fromDate' id='dbFromDate' name='fromDate' value='"+ (dbDrFromDate.getFullYear() + "-" + (dbDrFromDate.getMonth() + 1).toString().padStart(2,'0') +  "-" + dbDrFromDate.getDate()) +"'>" +
        "</li>" +
        "<li>" +
        "   <input type='text' class='dtp-date im-date ac-off btn-large center toDate'   id='dbToDate'   name='toDate'   value='"+ (dbDrToDate.getFullYear() + "-" + (dbDrToDate.getMonth() + 1).toString().padStart(2,'0') +  "-" + dbDrToDate.getDate()) +"'>" +
        "</li>" +
        "<li>" +
        "    <button type='submit' id='refreshDashboard' class='btn btn-block btn-xs btn-purple pull-right btn-large' style='padding: 1px 10px'>" +
        "        Refresh &nbsp;" +
        "        <i class='fa fa-refresh'></i>" +
        "    </button>" +
        "</li>";

$(document).ready(function () {
    $(".top-links").append(buttons);
    validateDateRange();
    getDashboardDatums();
    initializeAllDependencies();

    //console.log(dbDatums);
    //console.log(auId);

    if(!$.isEmptyObject(dbDatums.COUNTER)){
        generateCounter(dbDatums.COMPONENT_GROUPS, dbDatums.COUNTER);
    }
    if(!$.isEmptyObject(dbDatums.CHARTER)){
        generateChart(dbDatums.COMPONENT_GROUPS, dbDatums.CHARTER);
    }
    if(!$.isEmptyObject(dbDatums.TABULAR)){
        generateTabular(dbDatums.COMPONENT_GROUPS, dbDatums.TABULAR);
    }
    if(!$.isEmptyObject(dbDatums.TABULAR_CROSS)){
        generateTabularCross(dbDatums.COMPONENT_GROUPS, dbDatums.TABULAR_CROSS);
    }
});

function validateDateRange() {
    try {
        if($.getFromLocalStorage("DB_DR_TO_DATE")) dbDrToDate = new Date($.getFromLocalStorage("DB_DR_TO_DATE")); else dbDrToDate = new Date();
    } catch (e) {
        console.log(e);
    }
    try {
        if($.getFromLocalStorage("DB_DR_FROM_DATE")) dbDrFromDate = new Date($.getFromLocalStorage("DB_DR_FROM_DATE")); else dbDrFromDate = new Date(new Date().setDate(dbDrToDate.getDate() - 29));;
    } catch (e) {
        console.log(e);
    }

    $('#dbFromDate').val((dbDrFromDate.getFullYear() + "-" + (dbDrFromDate.getMonth() + 1).toString().padStart(2, '0') + "-" + dbDrFromDate.getDate().toString().padStart(2, '0')));
    $('#dbToDate'  ).val((dbDrToDate  .getFullYear() + "-" + (dbDrToDate  .getMonth() + 1).toString().padStart(2, '0') + "-" + dbDrToDate  .getDate().toString().padStart(2, '0')));

    initializeDtpDate();
}

function validateDataset() {
    var isValid = true;
    try {
        lastStorageTime = new Date($.getFromLocalStorage("DB_DATUMS_TIME"));
    } catch (e) {
        console.log(e);
    }
    if (!lastStorageTime || (((new Date().getTime() - new Date(lastStorageTime).getTime()) / 1000) - 3600) > 0) {   // > 1hr or not
        console.log("It's time to update dashboard! Last Update time is: " + lastStorageTime);
        isValid = false;
    }
    return isValid;
}

function getDashboardDatums() {
    try {
        dbDatums = JSON.parse($.getFromLocalStorage("DB_DATUMS"));
    }
    catch (e) {
        console.log(e);
    }
    try {
        lastStorageTime = new Date($.getFromLocalStorage("DB_DATUMS_TIME"));
    } catch (e) {
        console.log(e);
    }

    if($.isEmptyObject(dbDatums) || !validateDataset()){
        //var startedAt   = new Date();
        lastStorageTime = new Date();
        admBranch       = $("#admBranchId").val();
        dbDrToDate      = $("#dbToDate"   ).val();
        dbDrFromDate    = $("#dbFromDate" ).val();
        dbDatums        = getResponseByXhr({controller: "authHome", action: "getDashboardDatums", data: {admBranch: admBranch, fromDate: dbDrFromDate, toDate: dbDrToDate}});
        //var terminatedAt= new Date();
        //console.log("|Time Taken (Dashboard Load): " + (terminatedAt.getTime() - startedAt.getTime()) + "ms");
        $.setToLocalStorage("DB_DR_FROM_DATE", dbDrFromDate             );
        $.setToLocalStorage("DB_DR_TO_DATE"  , dbDrToDate               );
        $.setToLocalStorage("DB_DATUMS_TIME" , lastStorageTime          );
        $.setToLocalStorage("DB_DATUMS"      , JSON.stringify(dbDatums) );
    }
    return dbDatums;
}

$(document).on("click", "#refreshDashboard", function () {
    Pace.start();
    setTimeout(function(){
        $(".content-wrapper > .content > .box").empty();
        $.removeFromLocalStorage("DB_DATUMS");
        getDashboardDatums();
        initializeAllDependencies();
        generateCounter(dbDatums.COMPONENT_GROUPS, dbDatums.COUNTER);
        generateChart  (dbDatums.COMPONENT_GROUPS, dbDatums.CHARTER);
        aalaaAlertAutoClose({type: "MESSAGE", content: "Dashboard components has been refreshed successfully."});
    }, 500);
    Pace.stop();
});

function getUniqueComponentGroups(ds) {
    var keys = [];
    $.each(ds , function(i, v) {
        keys.push(v.componentGroup)
    });
    return keys.unique();
}

function generateCounter(cgs, ds) {
    var content = "<div class='box-body'>\n<div class='block-counter'>\n<fieldset>\n";
    $.each(cgs , function(i, v) {
        if (getUniqueComponentGroups(ds).toString().indexOf(v.id) >= 0){
            content += "<div class='row p-l-15 p-r-15'>\n\t<legend>" + v.title + "</legend>\n";
            $.each(ds , function(j, k) {
                content += "\t<div class='" + (k.mediaClass ? k.mediaClass : "col-xs-12 col-sm-6 col-md-4 col-lg-3") + "'>\n" +
                "\t   <a href='" + (k.detailsUrl.indexOf("#") >= 0 ? "#" : contextPath + k?.detailsUrl ) + "' title='Click to get more details.'>\n" +
                "\t       <div class='form-group small-box " + k.classBody + "'>\n" +
                "\t           <div class='" + k.classText + "'>\n" +
                "\t               <h3 class='f-bn-SolaimanLipi'>" + k.data.toNativeNumber() + "</h3>\n" +
                "\t               <p class='f-bn-SolaimanLipi'>" + getLocalWiseValue(k.title, k.titleNative) + "</p>\n" +
                "\t           </div>\n" +
                "\t          <div class='" + k.classFooter + "'>\n" +
                "\t               <i class='" + (k?.classIcon ? k?.classIcon : "fa fa-cog") + "'></i>\n" +
                "\t           </div>\n" +
                "\t       </div>\n" +
                "\t   </a>\n" +
                "\t</div>\n";
            });
            content += "</div>\n";
        }
    });
    content += "</fieldset>\n</div>\n</div>";
    $(".content-wrapper > .content > .box-info").append(content);
}

function generateChart(cgs, ds) {
    // console.log(ds);
    //Generating Context
    var content = "" +
        "<div class='box-body'>\n" +
        "   <div class='block-chart'>\n" +
        "       <fieldset>\n";
    $.each(cgs , function(i, v) {
        if (getUniqueComponentGroups(ds).indexOf(v.keyword) >= 0){
            content += "<div class='row p-l-15 p-r-15'>\n\t<legend>" + v.title + "</legend>\n";
            $.each(ds , function(j, k) {
                content += "" +
                    "<div class='" + k.mediaClass + "'>\n" +
                    "   <canvas id='" + k.canvasId + "' width='" + k.canvasWidth + "' height='" + k.canvasHeight + "'></canvas>\n" +
                    "</div>";
            });
            content += "</div>\n";
        }
    });
    content += "</fieldset>\n</div>\n</div>";
    $(".content-wrapper > .content > .box-info").append(content);

    //Generating Chart
    $.each(ds , function(i, v) {
        //console.log(i, v);
        var ct = v.chartType, chartContext = {};
        if(ct == "pie")
            chartContext = generateChartPie(v);
        else if(ct == "doughnut")
            chartContext = generateChartDoughnut(v);
        else if(ct == "bar")
            chartContext = generateChartBar(v);
        try {
            new Chart(document.getElementById(v.canvasId), chartContext);
        }
        catch (e) {
            console.log(e);
        }
    });
}

function generateTabular(cgs, ds) {
    //Generating Table
    var content = "" +
        "<div class='box-body'>\n" +
        "   <div class='block-tabular'>\n" +
        "       <fieldset>\n";
    $.each(cgs, function (i, v) {
        if (getUniqueComponentGroups(ds).indexOf(v.keyword) >= 0) {
            content += "<div class='row p-l-15 p-r-15'>\n\t<legend>" + v.title + "</legend>\n";

            $.each(ds, function (j, l) {
                content += "<h5><u>" + l.title + "</u></h5>";
                content += "<table class='table table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored'><thead><tr>";
                $.each(l.data.columns, function (b, c) {
                    content += "<th>" + c + "</th>";
                });
                content += "</tr></thead><tbody>";
                $.each(l.data.values, function (b, c) {
                    content += "<tr>";
                    $.each(c, function (d, e) {
                        content += "<td>" + e + "</td>";
                    });
                    content += "</tr>";
                });
                content += "</tbody></table></div>\n";
            });
        }
    });
    content += "</fieldset>\n</div>\n</div>";
    $(".content-wrapper > .content > .box-info").append(content);
}

//todo complete it from dashboard service.
function generateTabularCross(cgs, ds) {
    // console.log(cgs)
    // console.log(ds)
    //Generating Cross-Tab Report
    var content = "" +
        "<div class='box-body'>\n" +
        "   <div class='block-tabular'>\n" +
        "       <fieldset>\n";
    $.each(cgs, function (i, v) {
        if (getUniqueComponentGroups(ds).indexOf(v.keyword) >= 0) {
            content += "<div class='row p-l-15 p-r-15'>\n\t<legend>" + v.title + "</legend>\n";

            $.each(ds, function (j, l) {
                content += "<h5><u>" + l.title + "</u></h5>";
                content += "<table class='table table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored'><thead><tr>";
                $.each(l.data.columns, function (b, c) {
                    content += "<th>" + c + "</th>";
                });
                content += "</tr></thead><tbody>";
                $.each(l.data.values, function (b, c) {
                    content += "<tr>";
                    $.each(c, function (d, e) {
                        content += "<td>" + e + "</td>";
                    });
                    content += "</tr>";
                });
                content += "</tbody></table></div>\n";
            });
        }
    });
    content += "</fieldset>\n</div>\n</div>";
    $(".content-wrapper > .content > .box-info").append(content);
}

function generateLabels(ds){
    var labels = [];
    if(!ds["TITLE"] && !ds["TITLE_NATIVE"]){
        console.log("Please ensure that your dataSet has following columns: SL, KEYWORD, TITLE, TITLE_NATIVE & VALUE_01, VALUE_02, VALUE_N");
    }
    else{
        if(userLocal.toLowerCase() == "en"){
            labels = ds["TITLE"];
        }
        else{
            labels = ds["TITLE_NATIVE"];
        }
    }
    return labels;
}

function generateDataSets(ds) {
    var dataSets = [], keys = Object.keys(ds);
    $.each(["SL", "KEYWORD", "TITLE", "TITLE_NATIVE"], function (i, v) {
        keys.splice($.inArray(v, keys),1);
    });
    $.each(keys, function (i, v) {
        var values = {}, data = [], backgroundColor = [];
        data = ds[v];
        $.each(data, function (j) {
            backgroundColor.push(getChartColor(j));
        });
        values["label"          ] = v;  //todo convert to sentence case or get it from db/json dataset
        values["data"           ] = data;
        values["backgroundColor"] = backgroundColor;
        dataSets.push(values);
    });
    return dataSets;
}

function generateChartData(ds) {
    var pivotTable = generatePivotTable(ds.dataSet);
    return {
        labels  : generateLabels  (pivotTable),
        datasets: generateDataSets(pivotTable)
    };
}

function generateChartPie(ds){
    var context = {
        type   : "pie",
        data   : generateChartData(ds),
        options: {
            responsive: true,
            title     : {
                display : ds.showTitle,
                position: ds.titlePosition,
                text    : ds.title  //todo: use lang property to filter title & titleNative
            }
        }
    }
    return context;
}

function generateChartDoughnut(ds){
    var context = {
        type   : "doughnut",
        data   : generateChartData(ds),
        options: {
            responsive: true,
            title     : {
                display : ds.showTitle,
                position: ds.titlePosition,
                text    : ds.title  //todo: use lang property to filter title & titleNative
            }
        }
    }
    return context;
}

function generateChartBar(ds) {
    //console.log(ds);
    var context = {
        type   : "bar",
        data   : generateChartData(ds),
        options: {
            responsive: true,
            title     : {
                display : ds.showTitle,
                position: ds.titlePosition,
                text    : ds.title  //todo: use lang property to filter title & titleNative
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    }
    return context;
}
