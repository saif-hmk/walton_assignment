<%--
    Document   : _js
    Created on : May 20, 2016, 5:02:03 PM
    Author     : hoshen.mahmud
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="${resource(dir: "resources/plugins/jQuery"       , file: "jquery-2.2.3.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/bootstrap/js" , file: "bootstrap.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/select2"      , file: "select2.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js", file: "aalaa.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js", file: "aalaa-system-info.js")}"></script>
<script type="text/javascript">
    //Note : it should always on top (head part).
    //    $.noConflict();
    var url                   = window.location.href
    var contextPath           = "${request.contextPath}";           // /aalaa
    var sessionTimeRemaining  = "${session.getMaxInactiveInterval()}"               // 1800sec / 30min
    var auId                  = "${applicationContext.springSecurityService.getCurrentUserId()}"                  // -1
    var userLocal             = "${session.getAttribute("USER_LOCAL") ?: "EN"}";                // "EN"
    var ft                    = "${grailsApplication.config.format.dtp.time}";       // 'hh:mm:ss tt'
    var ft12                  = "${grailsApplication.config.format.dtp.time12}";           // 'hh:mm a'
    var ft24                  = "${grailsApplication.config.format.dtp.time24}";             // 'hh:mm'
    var fd                    = "${grailsApplication.config.format.dtp.date}";        // 'yyyy-MM-dd'
    var fdUi                  = "${grailsApplication.config.format.dtp.dateUi}";        // 'yyyy-mm-dd'
    var fdt12                 = "${grailsApplication.config.format.dtp.dateTime12}";// 'yyyy-MM-dd hh:mm a'
    var fdt24                 = "${grailsApplication.config.format.dtp.dateTime24}";  // 'yyyy-MM-dd hh:mm'
    var fdt12Ui               = "${grailsApplication.config.format.dtp.dateTime12ui}";// 'YYYY-MM-DD HH:mm A'
    var fdt14Ui               = "${grailsApplication.config.format.dtp.dateTime24ui}";  // 'YYYY-MM-DD HH:mm'
    var fy                    = "${grailsApplication.config.format.dtp.year}";              // 'yyyy'
    var menuType              = "${applicationContext.authUserService?.menuType}";              // LEFT, TOP_TREE, TOP_MEGA, NONE
    var bodyClass             = "${applicationContext.authUserService?.bodyClass}";  // hold-transition skin-blue layout-top-nav
    var startupDate           = "${new java.util.Date(applicationContext.startupDate)}"
    var sSwfPathCopyCsvXls    = "${resource(dir: 'resources/plugins/datatables/extensions/TableTools/swf', file: 'copy_csv_xls.swf')}"      //For : jQuery DataTable > Printing.
    var sSwfPathCopyCsvXlsPdf = "${resource(dir: 'resources/plugins/datatables/extensions/TableTools/swf', file: 'copy_csv_xls_pdf.swf')}"  //For : jQuery DataTable > Printing.
    var selectOne             = "<option value=''>Select One</option>";
    //---------------------------------------------------------------------------------------------------------------------------------------------------
    var AdminLTEOptions       = {         //if require any change @ AdminLTE Options
        //Add slimscroll to navbar menus. This requires you to load the slimscroll plugin in every page before app.js
        navbarMenuSlimscroll        : true,
        navbarMenuSlimscrollWidth   : "3px",    //The width of the scroll bar
        navbarMenuHeight            : "200px",  //The height of the inner menu
        //General animation speed for JS animated elements such as box collapse/expand and sidebar treeview slide up/down.
        // This options accepts an integer as milliseconds, 'fast', 'normal', or 'slow'
        animationSpeed              : 500,
        sidebarToggleSelector       : "[data-toggle='offcanvas']",  //Sidebar push menu toggle button selector
        sidebarPushMenu             : true,                         //Activate sidebar push menu
        //Activate sidebar slimscroll if the fixed layout is set (requires SlimScroll Plugin)
        sidebarSlimScroll           : true,
        //Enable sidebar expand on hover effect for sidebar mini. This option is
        //forced to true if both the fixed layout and sidebar mini are used together
        sidebarExpandOnHover        : false,
        enableBoxRefresh            : true, //BoxRefresh Plugin
        enableBSTooltip             : true, //Bootstrap.js tooltip
        BSTooltipSelector           : "[data-toggle='tooltip']",
        //Enable Fast Click. Fastclick.js creates a more native touch experience with touch devices.
        //If you choose to enable the plugin, make sure you load the script before AdminLTE's app.js
        enableFastclick             : true,
        enableControlSidebar        : true, //Control Sidebar Options
        controlSidebarOptions       : {
            toggleBtnSelector       : "[data-toggle='control-sidebar']",    //Which button should trigger the open/close event
            selector                : ".control-sidebar",                   //The sidebar selector
            slide                   : true                                  //Enable slide over content
        },
        enableBoxWidget             : true, //Box Widget Plugin. Enable this plugin to allow boxes to be collapsed and/or removed
        boxWidgetOptions            : {     //Box Widget plugin options
            boxWidgetIcons  : {
                collapse    : 'fa-minus',   //Collapse icon
                open        : 'fa-plus',    //Open icon
                remove      : 'fa-times'    //Remove icon
            },
            boxWidgetSelectors      : {
                remove      : '[data-widget="remove"]',     //Remove button selector
                collapse    : '[data-widget="collapse"]'    //Collapse button selector
            }
        },
        directChat                  : {                                     //Direct Chat plugin options
            enable                  : true,                                 //Enable direct chat by default
            contactToggleSelector   : '[data-widget="chat-pane-toggle"]'    //The button to open and close the chat contacts pane
        }
    };
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');ga('create', 'UA-93368809-1', 'auto');ga('send', 'pageview');
    function getUserProperties() {$.ajax({url: contextPath + "/authUserProperty/getUserProperties", type: "POST", async: false, dataType: "JSON", success: function (r) {return r;}});}
</script>
