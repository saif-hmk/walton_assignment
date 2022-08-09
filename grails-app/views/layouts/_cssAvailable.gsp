<%-- 
    Document   : css
    Created on : May 20, 2016, 5:01:33 PM
    Author     : hoshen.mahmud
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
%{--<%@page contentType="text/html" pageEncoding="UTF-8"%>--}%

<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${resource(dir: "resources/images", file: "favicon.ico")}"/>

<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/bootstrap/css", file: "bootstrap.min.css")}">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/colorpicker", file: "bootstrap-colorpicker.min.css")}">
<!-- bootstrap datepicker -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/datepicker", file: "datepicker3.css")}">
<!-- Bootstrap time Picker -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/timepicker", file: "bootstrap-timepicker.min.css")}">
<!-- daterange picker -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/daterangepicker", file: "daterangepicker.css")}">
<!-- fullCalendar 2.2.5-->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/fullcalendar", file: "fullcalendar.min.css")}">
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/fullcalendar", file: "fullcalendar.print.css")}" media="print">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/bootstrap-wysihtml5", file: "bootstrap3-wysihtml5.min.css")}">

<!-- Font Awesome -->
<!--<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/font-awesome/css", file: "font-awesome.min.css")}">-->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/font-awesome/css", file: "font-awesome.min.css")}">
<!-- Ionicons -->
<!--<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">-->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/ionicons/css", file: "ionicons.min.css")}">

<!-- Theme style -->
%{--<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/admin-lte/css", file: "AdminLTE.min.css")}">--}%
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/admin-lte/css", file: "AdminLTE.css")}">
<!-- AdminLTE Skins. Choose a skin from the css/skins
   folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/admin-lte/css/skins", file: "_all-skins.min.css")}">
<!--<link rel="stylesheet" type="text/css" href="< %=request.getContextPath()%>/resources/plugins/admin-lte/css/skins/skin-blue.min.css">-->
  <!-- Pace style -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/pace", file: "pace.min.css")}">
<!-- iCheck for checkboxes and radio inputs -->
%{--<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/iCheck", file: "all.css")}">--}%
%{--<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/iCheck/flat", file: "blue.css")}"/>--}%
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/iCheck/square", file: "blue.css")}"/>
<!-- Select2 -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/select2", file: "select2.min.css")}"/>
<!-- Morris chart -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/morris", file: "morris.css")}">
<!-- jvectormap -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/jvectormap", file: "jquery-jvectormap-1.2.2.css")}">

<!-- DataTables -->
%{--<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/datatables", file: "jquery.dataTables.css")}"/>--}% %{--Do not use "jquery.dataTables.css" or "dataTables.bootstrap.css" at a time.--}%
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/datatables", file: "dataTables.bootstrap.css")}">       %{--Do not use "jquery.dataTables.css" or "dataTables.bootstrap.css" at a time.--}%
%{--<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/datatables/extensions/Responsive/css", file: "dataTables.responsive.css")}"/>--}%
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/datatables/extensions/TableTools/css", file: "dataTables.tableTools.css")}"/>

<!-- Animate.css -->
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/animate", file: "animate.css")}">
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/jquery-confirm", file: "jquery-confirm.min.css")}">

<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/aalaa/css", file: "aalaa.css")}">
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/aalaa/css", file: "aalaa-drop-down-menu.css")}">
<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/aalaa/rnd", file: "custom-input.css")}">

<!-- AALAA Skins. We have chosen the skin-blue for this starter
      page. However, you can choose any other skin. Make sure you
      apply the skin class to the body tag so the changes take effect.
-->

%{--<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/", file: "")}">--}%