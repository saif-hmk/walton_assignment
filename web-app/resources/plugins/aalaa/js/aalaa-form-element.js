/**
 * @Created_By  : AALAA
 * @Date        : 2016.03.17 9:55:17 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Form-Element.js
 * @Dependencies: Jquery.js, AALAA.js, select2.js, inputmask.js, select2.js, iCheck.js, datepicker.js, timepicker.js, daterangepicker.js, datetimepicker.js
 * @Dependencies: AALAA.js; AALAA-Calendar.js;
 * @LastModified: 18.05.04
 * @version     : 3.0
 **/
/*==================================================================================================================================================*/

$(document).ready(function () {
    initializeAllDependencies();
});

function initializeAllDependencies() {
    copyToClipboard();
    initializeAllPlaceHolders();
    initializeInputMasking();
    initializePluginSelect2();
    initializePluginIcheck();
    initializeDtpYear();
    initializeDtpDateQuarter();
    initializeDtpDate();
    initializeDtpSysDate();

    initializeDtpDatePast();
    initializeDtpDateFuture();
    initializeDtpDateRange();
    
    initializeDtpDateTime();
    initializeDtpDateTime24();
    
    initializeDtpTime();
    initializeDtpTime24();

    initializeAllTitles();
    
    initializeValidations();
    initializeUtilities();
}

/*
$(function() {
    $('.copy-to-clipboard').click(function() {
        $(this).focus();
        $(this).select();
        document.execCommand('copy');
    });
    $('.copy-to-clipboard').attr("title", "Double click or select to copy.")
});
*/

function copyToClipboard() {
    $('.copy-to-clipboard').click(function() {
        $(this).focus();
        $(this).select();
        document.execCommand('copy');
    });
    $('.copy-to-clipboard').attr("title", "Double click or select to copy.")
}

function initializeUtilities() {
    $('.ac-off').attr('autocomplete', "off");
    $(".multiple").prop("multiple", true);
    $('.tbl-r').parent().addClass('table-responsive');
    $('.upper').each(function () {
        $(this).val($(this).val().toUpperCase());
    });
    $('.lower').each(function () {
        $(this).val($(this).val().toLowerCase());
    });
    $(".create-only").each(function () {
        try{
            if(pathname.indexOf("edit")>0)
                $(this).prop("disabled", true);
        }catch(exception) {
            console.log(exception)
        }
    });
    $(".dt").closest(".dataTables_wrapper").find(".col-sm-6").each(function () {
        // alert($(this).prop("class"));
        //aalaaAlert({type: "MESSAGE", content: "Please use a modern browser to properly view this template...!"});
        $(this).prop("class").replace("col-xs-12 col-sm-6")
    });
    $(".dataTables_filter").addClass("pull-right");
    $(".dataTables_paginate").addClass("pull-right");
}

function initializeAllPlaceHolders() {
//----------------------------------------------------------------------------------------------------------------------------------
//  ID, Password, Name, Address, Phone, Email, IP, Url & Fax
//----------------------------------------------------------------------------------------------------------------------------------
    $(".ph-id").prop('placeholder', 'Please enter ID');
    $(".ph-code").prop('placeholder', 'Please enter code');
    $(".ph-nid").prop('placeholder', 'Please enter national ID');
    $(".ph-password").prop('placeholder', 'Please enter password');
    $(".ph-title").prop('placeholder', 'Please enter title');
    $(".ph-name").prop('placeholder', 'Please enter name');
    $(".ph-address").prop('placeholder', 'Please enter address');
    $(".ph-mobile").prop('placeholder', 'Please enter mobile no.');
    $(".ph-phone").prop('placeholder', 'Please enter phone no.');
    $(".ph-email").prop('placeholder', 'someone@example.com');
    $(".ph-fax").prop('placeholder', 'Please enter fax no.');
    $(".ph-ip").prop('placeholder', 'Please enter IP Address');
    $(".ph-url").prop('placeholder', 'http://');
    $(".ph-web").prop('placeholder', 'www.example.com');
//----------------------------------------------------------------------------------------------------------------------------------
}

function initializeAllTitles() {
    $(".t-nId").prop('title', 'Must be 10, 13 or 17 characters long');
}

function initializeInputMasking() {
//----------------------------------------------------------------------------------------------------------------------------------
//  Input Masking
//----------------------------------------------------------------------------------------------------------------------------------
    $('.im-mobile-bd').inputmask({
        mask:"+8801999999999"
    });

    $('.im-phone-bd').inputmask({
        mask:"+88099999999"
    });

    $('.im-ip').inputmask({
        alias:"ip"
    });

    $('.im-date').inputmask({
        alias:"yyyy-mm-dd"
    });

    /*
    $('.im-date-time-24').inputmask({
        alias:"yyyy-MM-dd hh:mm"
    });
    */
//----------------------------------------------------------------------------------------------------------------------------------
}

function initializeValidations() {
    $(document).on("blur", ".v-space", function () {
        $(this).val($(this).val().replace(/  +/g, ' ').trim());
    });

    $('.v-name').each(function () {
        var minLength = ($(this).attr("minLength") && $(this).attr("minLength") > 0) ? $(this).attr("minLength") : 3,
            maxLength = ($(this).attr("maxLength") && $(this).attr("maxLength") > 0) ? $(this).attr("maxLength") : 35;
        $(this).prop('title', "Must be " + minLength + " to " + maxLength + " characters long");
        $(this).prop('placeholder', 'Please enter name.');
        $(this).prop('minLength', minLength);
        $(this).prop('maxLength', maxLength);
        $(this).prop('pattern', "[a-z A-Z]{" + minLength + "," + maxLength + "}");
        $(this).after("<label class='l-name'></label>");
    });
    $(document).on("keyup", ".v-name", function () {
        $(this).val($(this).val().replace(/[^a-z A-Z]+/gi, "").toUpperCase());
    });
    $(document).on("blur", ".v-name", function () {
        $(this).val($(this).val().replace(/  +/g, ' ').trim());
        var name      = $(this).val(),
            minLength = ($(this).attr("minLength") && $(this).attr("minLength") > 0) ? $(this).attr("minLength") : 3,
            maxLength = ($(this).attr("maxLength") && $(this).attr("maxLength") > 0) ? $(this).attr("maxLength") : 35;
        if (name && (name.length < minLength || name.length > maxLength)) {
            $(this).parent().addClass("has-error");
            $(this).siblings(".l-name").text("Must be " + minLength + " to " + maxLength + " characters long").show();
        } else {
            $(this).parent().removeClass("has-error");
            $(this).siblings(".l-name").text('').hide();
        }
    });

    $('.v-address').each(function () {
        var minLength = ($(this).attr("minLength") && $(this).attr("minLength") > 0) ? $(this).attr("minLength") : 2,
            maxLength = ($(this).attr("maxLength") && $(this).attr("maxLength") > 0) ? $(this).attr("maxLength") : 255;
        $(this).prop('title', "Must be " + minLength + " to " + maxLength + " characters long");
        $(this).prop('placeholder', 'Please enter address.');
        $(this).prop('minLength', minLength);
        $(this).prop('maxLength', maxLength);
        $(this).prop('pattern', "[a-z A-Z0-9.,-]{" + minLength + "," + maxLength + "}");
        $(this).after("<label class='l-address'></label>");
    });
    $(document).on("keyup", ".v-address", function () {
        $(this).val($(this).val().replace(/[^a-z A-Z0-9.,-]+/gi, "").toUpperCase());
    });
    $(document).on("blur", ".v-address", function () {
        var address = $(this).val().trim(),
            minLength = ($(this).attr("minLength") && $(this).attr("minLength") > 0) ? $(this).attr("minLength") : 2,
            maxLength = ($(this).attr("maxLength") && $(this).attr("maxLength") > 0) ? $(this).attr("maxLength") : 255;
        if (address && (address.length < minLength || address.length > maxLength)) {
            $(this).parent().addClass("has-error");
            $(this).siblings(".l-address").text("Must be " + minLength + " to " + maxLength + " characters long").show();
        } else {
            $(this).parent().removeClass("has-error");
            $(this).siblings(".l-address").text('').show();
        }
    });

    $('.v-nid').each(function () {
        $(this).prop('title', 'Must be 10, 13 or 17 characters long');
        $(this).prop('placeholder', 'Please enter national ID');
        $(this).prop('minLength', '10');
        $(this).prop('maxLength', '17');
        $(this).prop('pattern', '([0-9]{10,10})|([0-9]{13,13})|([0-9]{17,17})');
        $(this).after("<label class='l-nid'></label>");
    });
    $(document).on("keyup", ".v-nid", function () {
        $(this).val($(this).val().replace(/[^0-9]+/gi, ""));
    });
    $(document).on("blur", ".v-nid", function () {
        var nId = $(this).val();
        if (nId && nId.length != 10 && nId.length != 13 && nId.length != 17) {
            $(this).parent().addClass("has-error");
            $(this).siblings(".l-nid").text('Must be 10, 13 or 17 characters long').show();
        } else {
            $(this).parent().removeClass("has-error");
            $(this).siblings(".l-nid").text('').hide();
        }
    });

    $('.v-mobile-bd').each(function () {
        $(this).prop('title', "Must be 14 characters long, start with '+8801' and operator allowed only [3-9]!");
        $(this).prop('minLength', '14');
        $(this).prop('maxLength', '14');
        $(this).prop('pattern', "([+]{1})+8801+([3-9]{1})+([0-9]{8,8})");
        $(this).after("<label class='l-mobile-bd'></label>");
    });

    $(document).on("blur", ".v-mobile-bd", function () {
        var mobileNo = $(this).val().replace(/\D/g,'').trim();
        console.log(mobileNo);
        if (mobileNo && (mobileNo.length != 13)) {
            $(this).parent().addClass("has-error");
            $(this).siblings(".l-mobile-bd").text('Please enter a valid mobile no.').show();
        } else {
            $(this).parent().removeClass("has-error");
            $(this).siblings(".l-mobile-bd").text('').show();
        }
    });

    $('.v-email').each(function () {
        // $(this).prop('title', 'Must be 10, 13 or 17 characters long');
        // $(this).prop('placeholder', 'Please enter national ID');
        // $(this).prop('minLength', '10');
        // $(this).prop('maxLength', '17');
        // $(this).prop('pattern', '([0-9]{10,10})|([0-9]{13,13})|([0-9]{17,17})');
        // $(this).after("<label class='l-nid'></label>");
    });
    $(document).on("blur", ".v-email", function () {
        // var nId = $(this).val();
        // if (nId && nId.length != 10 && nId.length != 13 && nId.length != 17) {
        //     $(this).parent().addClass("has-error");
        //     $(this).siblings(".l-nid").text('Must be 10, 13 or 17 characters long').show();
        // } else {
        //     $(this).parent().removeClass("has-error");
        //     $(this).siblings(".l-nid").text('').show();
        // }
    });

    /*
    //R&D
    $(document).on("keyup", ".nf", function (kc) {
        if(kc.charCode < 48 || kc.charCode > 57) return false;
        //$(this).val();
    });
    */
}

function initializePluginSelect2() {
//----------------------------------------------------------------------------------------------------------------------------------
//  Select2 (Select @ dropdown, Select Multiple Item)
//----------------------------------------------------------------------------------------------------------------------------------
    $(".select-with-search").select2({
        multiple: false,
        placeholder: "Select One",
        allowClear: true
    });

    $(".select-multiple").select2({
        multiple: true,
        placeholder: "Select One or More",
        allowClear: true
    });
//----------------------------------------------------------------------------------------------------------------------------------
}

function initializePluginIcheck() {
//----------------------------------------------------------------------------------------------------------------------------------
//  iCheck (Checkbox & Radio Button)
//----------------------------------------------------------------------------------------------------------------------------------
    $('.cb').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        // increaseArea: '70%' // optional
    });

    $('.rb').iCheck({
        radioClass: 'iradio_square-blue',
        // increaseArea: '70%' // optional
    });
//----------------------------------------------------------------------------------------------------------------------------------
}

function initializeDtpYear() {
    $('.dtp-year').datepicker({
        //autoclose: false,
        //beforeShowDay: $.noop,
        //calendarWeeks: false,
        //clearBtn: false,
        //daysOfWeekDisabled: [],
        //endDate: Infinity,
        //forceParse: true,
        //format: 'mm/dd/yyyy',
        //keyboardNavigation: true,
        //language: 'en',
        //minViewMode: 0,
        //multidate: false,
        //multidateSeparator: ',',
        //orientation: "auto",
        //rtl: false,
        //startDate: -Infinity,
        //startView: 0,
        //todayBtn: false,
        //todayHighlight: false,
        //weekStart: 0

        //Accepts: years,
        autoclose: true,
        format: fy,
        clearBtn: true,
        keyboardNavigation: true,
        todayHighlight: true,
        weekStart: 0
    }).prop('placeholder', fy);
}

function initializeDtpDateQuarter() {
    $('.dtp-date-quarter').datepicker({
        startDate: getStartDateOfCurrentQuarter(),
        endDate: getEndDateOfCurrentQuarter(),
        //daysOfWeekDisabled: [5,6],
        todayHighlight: true,
        weekStart: 0,
        keyboardNavigation: true,
        multidate: false,
        clearBtn: true,
        autoclose: true,
        format: fdUi,
    }).prop('placeholder', fdUi);
}

function initializeDtpDate() {
    $('.dtp-date').datepicker({
        //autoclose: false,
        //beforeShowDay: $.noop,
        //calendarWeeks: false,
        //clearBtn: false,
        //daysOfWeekDisabled: [],
        //endDate: Infinity,
        //forceParse: true,
        //format: 'mm/dd/yyyy',
        //keyboardNavigation: true,
        //language: 'en',
        //minViewMode: 0,
        //multidate: false,
        //multidateSeparator: ',',
        //orientation: "auto",
        //rtl: false,
        //startDate: -Infinity,
        //startView: 0,
        //todayBtn: false,
        //todayHighlight: false,
        //weekStart: 0

        autoclose: true,
        multidate: false,
        format: fdUi,
        clearBtn: true,
        keyboardNavigation: true,
        todayHighlight: true,
        weekStart: 0
    })
    .prop('placeholder', fd)
    .addClass("ac-off");
}

function initializeDtpSysDate() {
    $('.dtp-date-current').datepicker({
        autoclose           : true,
        multidate           : false,
        format              : fdUi,
        clearBtn            : true,
        keyboardNavigation  : true,
        todayHighlight      : true,
        weekStart           : 0,
        startDate           : new Date(),
        endDate             : new Date()
    })
    .prop('placeholder', fd)
    .addClass("ac-off");
}

function initializeDtpDatePast() {
    $('.dtp-date-past').datepicker({
        autoclose           : true,
        multidate           : false,
        format              : fdUi,
        clearBtn            : true,
        keyboardNavigation  : true,
        todayHighlight      : true,
        weekStart           : 0,
        endDate             : new Date()
    })
    .prop('placeholder', fd)
    .addClass("ac-off");
}

function initializeDtpDateFuture() {
    $('.dtp-date-future').datepicker({
        autoclose           : true,
        multidate           : false,
        format              : fdUi,
        clearBtn            : true,
        keyboardNavigation  : true,
        todayHighlight      : true,
        weekStart           : 0,
        startDate           : new Date()
    })
    .prop('placeholder', fd)
    .addClass("ac-off");
}

function initializeDtpDateRange() {
//<g:textField name="dateOfBirth" class="form-control  dtp-date-range im-date" fromDate="${(applicationContext.calendarService.getModifiedDateTime(-50)).format(grailsApplication.config.format.dtp.date)}" toDate="${(applicationContext.calendarService.getModifiedDateTime(-5)).format(grailsApplication.config.format.dtp.date)}" value="${formatDate(date: entPersonalInfoInstance?.dateOfBirth, format: 'dd/MM/yyyy')}" required="required"/>
    /*
    $('.dtp-date-range').each(function () {
        $(this).datepicker({
            autoclose: true,
            multidate: false,
            format: fdUi,   //'mm/dd/yyyy',
            clearBtn: true,
            keyboardNavigation: true,
            todayHighlight: true,
            weekStart: 0,
            startDate: $(this).attr("fromDate"),    //dd/mm/yyyy
            endDate: $(this).attr("toDate")         //dd/mm/yyyy
        })
        .prop('placeholder', fd)
        .addClass("ac-off");
    });
    */

    $('.dtp-date-range').daterangepicker({
            ranges: {
                'Today'       : [moment(), moment()],
                'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month'  : [moment().startOf('month'), moment().endOf('month')],
                'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            // startDate: moment().subtract(29, 'days'),
            // endDate  : moment(),

            startDate: $.getFromLocalStorage("DB_DR_FROM_DATE"),
            endDate  : $.getFromLocalStorage("DB_DR_TO_DATE"  ),

            minDate  : moment().subtract(5, 'month').startOf('month'),
            maxDate  : moment(),
            locale : {
                format: 'YYYY-MM-DD'
            },
            // autoUpdateInput: false,
        },
        function (sd, ed) {
            //alert(ed);
            var startDate = sd.format('MMMM D, YYYY'), endDate = ed.format('MMMM D, YYYY'),
                text = "<input type='hidden' id='dbFromDate' name='fromDate' value='" + sd.format('DD-MMM-YYYY') + "'></inpu>" +
                       "<input type='hidden' id='dbToDate'   name='toDate'   value='" + ed.format('DD-MMM-YYYY') + "'></inpu>";
            if(startDate != endDate){
                $('.dtp-date-range span').html(text + startDate + ' - ' + endDate);
            }
            else{
                $('.dtp-date-range span').html(text + endDate);
            }
        }
    );
}

function initializeDtpDateTime() {
//http://eonasdan.github.io/bootstrap-datetimepicker/Options/
    $('.dtp-date-time').datetimepicker({
        format         : fdt12Ui,//'YYYY-MM-DD HH:mm',
        showTodayButton: true,
        showClear      : true,
        icons: {
            time: "fa fa-clock-o",
            date: "fa fa-calendar",
            up  : "fa fa-arrow-up",
            down: "fa fa-arrow-down"
        }
    }).prop('placeholder', fdt12Ui);
}

function initializeDtpDateTime24() {
    //https://eonasdan.github.io/bootstrap-datetimepicker/
    $('.dtp-date-time-24').datetimepicker({
        format         : fdt14Ui,//'YYYY-MM-DD HH:mm',
        showTodayButton: true,
        showClear      : true,
        icons: {
            time: "fa fa-clock-o",
            date: "fa fa-calendar",
            up  : "fa fa-arrow-up",
            down: "fa fa-arrow-down"
        }
    }).prop('placeholder', fdt14Ui);
}

function initializeDtpTime() {
//http://eonasdan.github.io/bootstrap-datetimepicker/Options/
    /*$('.dtp-time').datetimepicker({}).prop('placeholder', ft);*/
    /*
     $(".dtp-time").timepicker({
     defaultTime: 'current',
     disableFocus: false,
     isOpen: false,
     minuteStep: 15,
     modalBackdrop: false,
     secondStep: 15,
     showSeconds: false,
     showInputs: false,
     showMeridian: true,
     template: 'dropdown',
     appendWidgetTo: '.bootstrap-timepicker',
     upArrowStyle: 'glyphicon glyphicon-chevron-up',
     downArrowStyle: 'glyphicon glyphicon-chevron-down',
     containerClass: 'bootstrap-timepicker'
     });
     */
}

function initializeDtpTime24() {
//http://eonasdan.github.io/bootstrap-datetimepicker/Options/
    /*$('.dtp-time').datetimepicker({}).prop('placeholder', ft);*/
    /*
     $(".dtp-time").timepicker({
     defaultTime: 'current',
     disableFocus: false,
     isOpen: false,
     minuteStep: 15,
     modalBackdrop: false,
     secondStep: 15,
     showSeconds: false,
     showInputs: false,
     showMeridian: true,
     template: 'dropdown',
     appendWidgetTo: '.bootstrap-timepicker',
     upArrowStyle: 'glyphicon glyphicon-chevron-up',
     downArrowStyle: 'glyphicon glyphicon-chevron-down',
     containerClass: 'bootstrap-timepicker'
     });
     */
}
/*======================================================================================================================================================*/
