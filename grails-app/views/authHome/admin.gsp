<!--
 @Created_By : AALAA
 @Date       : 2017.05.17 02:13:58 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'dashboard.admin.pageTitle', default: 'Dashboard - Admin')}"/>
    <title><g:message code="label.org.argsButton" args="[entityName]"/></title>
</head>

<body>

<div class="content-wrapper">
    <section class="content-header">
        <h1><g:message code="label.org.argsButton" args="[entityName]" default="Walton - Dashboard"/></h1>
        <ul class="top-links">
            <g:render template="../template/topLinkPermittedBranches"/>
        </ul>
    </section>

    <section class="content">
        <div class="box box-info">
            <g:if test="${!raw(componentTabularCt).equals("<fieldset></fieldset>")}">
                <div class="box-body">
                    <div class="block-tabular-ct">${raw(componentTabularCt)}</div>
                </div>
            </g:if>
        </div>
    </section>
</div>

<script type="text/javascript" src="${resource(dir: "resources/plugins/chartJs/2.3.0", file: "Chart.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/daterangepicker", file: "moment.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/daterangepicker", file: "daterangepicker.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js", file: "aalaa-color.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js", file: "aalaa-dashboard.js")}"></script>
</body>
</html>
