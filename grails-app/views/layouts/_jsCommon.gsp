<%-- 
    Document   : _js
    Created on : May 20, 2016, 5:02:03 PM
    Author     : hoshen.mahmud
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- InputMask -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/input-mask", file: "jquery.inputmask.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/input-mask", file: "jquery.inputmask.date.extensions.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/input-mask", file: "jquery.inputmask.extensions.js")}"></script>
<!-- date-range-picker -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/daterangepicker", file: "moment.min.js")}"></script>         %{-- NB : moment should be defined before dateRangePicker --}%
<script type="text/javascript" src="${resource(dir: "resources/plugins/daterangepicker", file: "daterangepicker.js")}"></script>    %{-- NB : moment should be defined before dateRangePicker --}%
<script type="text/javascript" src="${resource(dir: "resources/plugins/bootstrap-datetimepicker", file: "bootstrap-datetimepicker.js")}"></script>    %{-- NB : moment should be defined before dateRangePicker --}%
%{--xxx--}%
<script type="text/javascript" src="${resource(dir: "resources/plugins/fullcalendar", file: "fullcalendar.min.js")}"></script>
<!-- bootstrap datepicker -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/datepicker", file: "bootstrap-datepicker.js")}"></script>
<!-- bootstrap time picker -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/timepicker", file: "bootstrap-timepicker.min.js")}"></script>
<!-- SlimScroll -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/slimScroll", file: "jquery.slimscroll.min.js")}"></script>
<!-- iCheck 1.0.1 -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/iCheck", file: "icheck.min.js")}"></script>
<!-- FastClick -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/fastclick", file: "fastclick.js")}"></script>
%{--xxx--}%
<script type="text/javascript" src="${resource(dir: "resources/plugins/pace", file: "pace.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/respond", file: "respond.min.js")}"></script>

<script type="text/javascript" src="${resource(dir: "resources/plugins/datatables", file: "jquery.dataTables.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/datatables", file: "dataTables.bootstrap.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/datatables/extensions/Responsive/js", file: "dataTables.responsive.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/datatables/extensions/TableTools/js", file: "dataTables.tableTools.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/jquery-confirm", file: "jquery-confirm.js")}"></script>
%{-- AALAA: todo-marge with aalaa.js : after final test. --}%
%{--<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa.js")}"></script>--}%
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-layout.js")}"></script>
%{--<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-system-info.js")}"></script>--}%
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-content-loader.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-ajaxHandler.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-file-chooser.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-slide-to-top.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-skin-switcher.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-toggle-full-screen.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-data-table.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-master-details.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-form-element.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-calendar.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-date-format.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-checkbox.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-confirm.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-color.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-menu.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/rnd", file: "aalaa-file-upload.js")}"></script>
<script type="text/javascript" src="${resource(dir: 'resources/js/org/aalaa/loc', file: 'filterLocationHierarchy.js')}"></script>

<script type="text/javascript" src="${resource(dir: "resources/plugins/admin-lte/js", file: "app.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/admin-lte/js", file: "config.js")}"></script>
%{--
<script type="text/javascript">
    jQuery(document).ready(function () {
        setMenuType();
    });
    alert(getMenuType());
</script>
--}%
