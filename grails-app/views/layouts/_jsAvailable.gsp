<%-- 
    Document   : _js
    Created on : May 20, 2016, 5:02:03 PM
    Author     : hoshen.mahmud
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- jQuery 2.2.3 -->
%{--<script type="text/javascript" src="${resource(dir: "resources/plugins/jQuery", file: "jquery-2.2.3.min.js")}"></script>--}%
%{--
<script type="text/javascript">
    //Note : it should always on top.
    //    $.noConflict();
    var contextPath           = "${request.contextPath}";
    var pathname              = window.location.pathname;                            // /reflection/authUser/edit/1
    var url                   = window.location.href;                                // http://localhost:8090/reflection/authUser/edit/1
    var userAgent             = window.navigator.userAgent;                          // Firefox/31.0
    var protocol              = window.navigator.protocol;                           // "https:"
    var host                  = window.navigator.host;                               // "localhost"
    var port                  = window.navigator.port;                               // "8090"
    var search                = window.navigator.search;                             // "?authUsername=admin"
    var hash                  = window.navigator.hash;                               // ""
    var origin                = window.navigator.origin;                             // "https://reflection.com"
    var height                = window.screen.height;                                // 1024
    var width                 = window.screen.width;                                 // 1280
    var availHeight           = window.screen.availHeight;                           // 995
    var availWidth            = window.screen.availWidth;                            // 1280
    var colorDepth            = window.screen.colorDepth;                            // 24
    var ft                    = "${grailsApplication.config.format.dtp.time}";       // = 'hh:mm:ss tt'
    var ft12                  = "${grailsApplication.config.format.dtp.time12}";     // = 'hh:mm a'
    var ft24                  = "${grailsApplication.config.format.dtp.time24}";     // = 'hh:mm'
    var fd                    = "${grailsApplication.config.format.dtp.date}";       // = 'dd/MM/yyyy'
    var fdUi                  = "${grailsApplication.config.format.dtp.dateUi}";     // = 'dd/mm/yyyy'
    var fdt12                 = "${grailsApplication.config.format.dtp.dateTime12}"; // = 'dd/MM/yyyy hh:mm a'
    var fdt24                 = "${grailsApplication.config.format.dtp.dateTime24}"; // = 'dd/MM/yyyy hh:mm'
    var fy                    = "${grailsApplication.config.format.dtp.year}";       // = 'yyyy'
    var sSwfPathCopyCsvXls    = '${resource(dir: 'resources/plugins/datatables/extensions/TableTools/swf', file: 'copy_csv_xls.swf')}'  //For : jQuery DataTable > Printing.
    var sSwfPathCopyCsvXlsPdf = '${resource(dir: 'resources/plugins/datatables/extensions/TableTools/swf', file: 'copy_csv_xls_pdf.swf')}'  //For : jQuery DataTable > Printing.
    var AdminLTEOptions = {
        //Add slimscroll to navbar menus
        //This requires you to load the slimscroll plugin
        //in every page before app.js
        navbarMenuSlimscroll: true,
        navbarMenuSlimscrollWidth: "3px", //The width of the scroll bar
        navbarMenuHeight: "200px", //The height of the inner menu
        //General animation speed for JS animated elements such as box collapse/expand and
        //sidebar treeview slide up/down. This options accepts an integer as milliseconds,
        //'fast', 'normal', or 'slow'
        animationSpeed: 500,
        //Sidebar push menu toggle button selector
        sidebarToggleSelector: "[data-toggle='offcanvas']",
        //Activate sidebar push menu
        sidebarPushMenu: true,
        //Activate sidebar slimscroll if the fixed layout is set (requires SlimScroll Plugin)
        sidebarSlimScroll: true,
        //Enable sidebar expand on hover effect for sidebar mini
        //This option is forced to true if both the fixed layout and sidebar mini
        //are used together
        sidebarExpandOnHover: true,
        //BoxRefresh Plugin
        enableBoxRefresh: true,
        //Bootstrap.js tooltip
        enableBSToppltip: true,
        BSTooltipSelector: "[data-toggle='tooltip']",
        //Enable Fast Click. Fastclick.js creates a more
        //native touch experience with touch devices. If you
        //choose to enable the plugin, make sure you load the script
        //before AdminLTE's app.js
        enableFastclick: true,
        //Control Sidebar Options
        enableControlSidebar: true,
        controlSidebarOptions: {
            //Which button should trigger the open/close event
            toggleBtnSelector: "[data-toggle='control-sidebar']",
            //The sidebar selector
            selector: ".control-sidebar",
            //Enable slide over content
            slide: true
        },
        //Box Widget Plugin. Enable this plugin
        //to allow boxes to be collapsed and/or removed
        enableBoxWidget: true,
        //Box Widget plugin options
        boxWidgetOptions: {
            boxWidgetIcons: {
                //Collapse icon
                collapse: 'fa-minus',
                //Open icon
                open: 'fa-plus',
                //Remove icon
                remove: 'fa-times'
            },
            boxWidgetSelectors: {
                //Remove button selector
                remove: '[data-widget="remove"]',
                //Collapse button selector
                collapse: '[data-widget="collapse"]'
            }
        },
        //Direct Chat plugin options
        directChat: {
            //Enable direct chat by default
            enable: true,
            //The button to open and close the chat contacts pane
            contactToggleSelector: '[data-widget="chat-pane-toggle"]'
        }
    };

</script>
--}%

<!-- Bootstrap 3.3.6 -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/bootstrap/js", file: "bootstrap.min.js")}"></script>
<!-- ChartJS 1.0.1 -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/chartjs", file: "Chart.min.js")}"></script>
<!-- Morris.js charts -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/raphael", file: "raphael.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/morris", file: "morris.min.js")}"></script>
<!-- Sparkline -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/sparkline", file: "jquery.sparkline.min.js")}"></script>
<!-- jvectormap -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/jvectormap", file: "jquery-jvectormap-1.2.2.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/jvectormap", file: "jquery-jvectormap-world-mill-en.js")}"></script>
<!-- jQuery Knob Chart -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/knob", file: "jquery.knob.js")}"></script>
<!-- CK Editor -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/ckeditor", file: "ckeditor.js")}"></script>
<!-- date-range-picker -->
%{--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>--}%
%{--<script type="text/javascript" src="${resource(dir: "resources/plugins/moment.js", file: "moment.min.js")}"></script>--}%
<script type="text/javascript" src="${resource(dir: "resources/plugins/daterangepicker", file: "moment.min.js")}"></script>         %{-- NB : moment should be defined before dateRangePicker --}%
<script type="text/javascript" src="${resource(dir: "resources/plugins/daterangepicker", file: "daterangepicker.js")}"></script>    %{-- NB : moment should be defined before dateRangePicker --}%
<script type="text/javascript" src="${resource(dir: "resources/plugins/fullcalendar", file: "fullcalendar.min.js")}"></script>
<!-- bootstrap datepicker -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/datepicker", file: "bootstrap-datepicker.js")}"></script>
<!-- bootstrap time picker -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/timepicker", file: "bootstrap-timepicker.min.js")}"></script>
<!-- bootstrap color picker -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/colorpicker", file: "bootstrap-colorpicker.min.js")}"></script>
<!-- Bootstrap WYSIHTML5 -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/bootstrap-wysihtml5", file: "bootstrap3-wysihtml5.all.min.js")}"></script>
<!-- Slimscroll -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/slimScroll", file: "jquery.slimscroll.min.js")}"></script>
<!-- FastClick -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/fastclick", file: "fastclick.js")}"></script>

<!-- AdminLTE App -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/admin-lte/js", file: "app.js")}"></script>
%{--<script type="text/javascript" src="${resource(dir: "resources/plugins/admin-lte/js", file: "app.min.js")}"></script>--}%
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/admin-lte/js/pages", file: "dashboard.js")}"></script>
<!-- AdminLTE for demo purposes -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/admin-lte/js", file: "config.js")}"></script>

<!-- PACE -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/pace", file: "pace.min.js")}"></script>

<!-- InputMask -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/input-mask", file: "jquery.inputmask.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/input-mask", file: "jquery.inputmask.date.extensions.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/input-mask", file: "jquery.inputmask.extensions.js")}"></script>

<!-- DataTables -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/datatables", file: "jquery.dataTables.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/datatables", file: "dataTables.bootstrap.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/datatables/extensions/Responsive/js", file: "dataTables.responsive.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/datatables/extensions/TableTools/js", file: "dataTables.tableTools.js")}"></script>

<!-- iCheck -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/iCheck", file: "icheck.min.js")}"></script>
<!-- Select2 -->
%{--<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/select2", file: "select2.full.min.js")}"/>--}%
<script type="text/javascript" src="${resource(dir: "resources/plugins/select2", file: "select2.min.js")}"></script>
<!-- jquery-confirm -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/jquery-confirm", file: "jquery-confirm.min.js")}"></script>

%{-- AALAA; todo-marge with aalaa.js : after final test. --}%
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-system-info.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-content-loader.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-slide-to-top.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-skin-switcher.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-toggle-full-screen.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "custom-data-table.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "custom-master-details.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-calendar.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-form-element.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/rnd", file: "reflection-file-upload.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/rnd", file: "aalaa-confirm.js")}"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
%{--The HTML5 Shiv enables use of HTML5 sectioning elements in legacy Internet Explorer and provides basic HTML5 styling for Internet Explorer 6-9, Safari 4.x (and iPhone 3.x), and Firefox 3.x.--}%
<!--<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>-->
<script type="text/javascript" src="${request.contextPath}/resources/plugins/html5shiv/html5shiv.min.js"></script>

%{--A fast & lightweight polyfill for min/max-width CSS3 Media Queries (for IE 6-8, and more)--}%
%{--<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>--}%
<script type="text/javascript" src="${request.contextPath}/resources/plugins/respond/respond.min.js"></script>

<!--[endif]-->
%{--<script type="text/javascript" src="${resource(dir: "resources/plugins/html5shiv", file: "html5shiv.min.js")}"></script>--}%
%{--<script type="text/javascript" src="${resource(dir: "resources/plugins/respond", file: "respond.min.js")}"></script>--}%

%{--<script type="text/javascript" src="${resource(dir: "resources/plugins/", file: "")}"></script>--}%
%{--
<script type="text/javascript">
    jQuery(document).ready(function () {});
</script>
--}%
