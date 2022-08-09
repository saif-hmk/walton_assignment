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
    <g:set var="entityName" value="${message(code: 'dashboard.support.pageTitle', default: 'Dashboard - Support')}"/>
    <title><g:message code="label.org.argsButton" args="[entityName]"/></title>
    <style>
    canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
    </style>
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
</body>
</html>
