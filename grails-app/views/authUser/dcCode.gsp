<%--
  Created by AALAA.
  User: saif_hmk@live.com
  Date: 2017.10.18
  Time: 12:35 PM
--%>

<%@ page import="java.text.SimpleDateFormat" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="aalaa">
    <title>DC Code</title>
</head>

<body>

<div class="content-wrapper">

    <section class="content-header">
        <h1>DCC Explorer</h1>
        <ul class="top-links">
            <sec:access url="/user/index">
                <li>
                    <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="List"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/user/create">
                <li>
                    <g:link class="btn btn-xs btn-block btn-primary" action="create">
                        <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/user/show/${authUserInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-success" action="show" id="${authUserInstance?.id}">
                        <i class="fa fa-eye"></i> <g:message code="default.button.show" default="Show"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/user/profile/${authUserInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-info" action="profile" id="${authUserInstance?.id}">
                        <i class="fa fa-address-book-o"></i> <g:message code="default.button.profile" default="Profile"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/user/edit/${authUserInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${authUserInstance?.id}">
                        <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/user/delete/${authUserInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${authUserInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                        <i class="fa fa-trash"></i> <g:message code="default.button.delete" default="Delete"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section>

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section>

    <section class="content">
        <div class="box box-primary">
            <div class="box-body">
                <div class="col-xs-12 col-sm-6">
                    <div class="form-group">
                        <label>HD Code</label>
                        <g:textField name="hdCode" id="hdCode" disabled="disabled" value="${authUserInstance?.hdCode}" class="form-control"/>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6">
                    <div class="form-group">
                        <label>DC Code</label>
                        <g:textField name="dcCode" id="dcCode" disabled="disabled" value="@W#${new java.text.SimpleDateFormat("yyyyMMddhhmm").format(new Date()) + "-" + applicationContext.trackerService.getDcCode(authUserInstance)}%${(Integer.parseInt(new java.text.SimpleDateFormat("mm").format(new Date()).toString()) + 78)}:Q" class="form-control"/>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>