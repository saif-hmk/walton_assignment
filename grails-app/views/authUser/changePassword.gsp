<%--
  Created by AALAA.
  User: saif_hmk@live.com
  Date: 2016.10.08
  Time: 11:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="aalaa">
    <title>Change Password</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/aalaa/css", file: "aalaa-reset-password.css")}">
</head>

<body>

<div class="content-wrapper">

    <section class="content-header">
        <h1>Change My Password</h1>
        <ul class="top-links">
            <sec:access url="/user/index">
                <li>
                    <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.list" default="List"/>
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
            <sec:access url="/user/show/${userInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-success" action="show" id="${userInstance?.id}">
                        <i class="fa fa-eye"></i> <g:message code="default.button.show" default="Show"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/user/profile/${userInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-info" action="profile" id="${userInstance?.id}">
                        <i class="fa fa-address-book-o"></i> <g:message code="default.button.profile" default="Profile"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/user/edit/${userInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${userInstance?.id}">
                        <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/user/delete/${userInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${userInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
            <g:form action="changePassword" method="POST" id="${userInstance?.id}" class="form-horizontal formValidation">
                <div class="box-body">
                    <div class="col-lg-8">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Full Name</label>

                            <div class="col-sm-8">
                                <g:textField name="fullName" id="fullName" disabled="disabled" value="${fullName}" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">Username</label>

                            <div class="col-sm-8">
                                <g:textField name="username" id="username" disabled="disabled" value="${userName}" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label required">New Password</label>

                            <div class="col-sm-8">
                                <g:passwordField name="newPassword" id="newPassword" class="form-control newPassword" autocomplete="off" required="required" pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#\$%^&])(?=\\S+\$).{8,}\$"/>
                                <label hidden class="p-t-10 blink c-red newPassword"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label required">Confirm Password</label>

                            <div class="col-sm-8">
                                <g:passwordField name="confirmPassword" id="confirmPassword" class="form-control confirmPassword" autocomplete="off" required="required" pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#\$%^&])(?=\\S+\$).{8,}\$"/>
                                <label hidden class="p-t-10 blink c-red confirmPassword"></label>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4" id="message">
                        <h4 class="bold text-red blink" style=""><u>Password must contain the following:</u></h4>
                        <span id="lc"  class="invalid">&nbsp;A <b>lowercase</b> letter</span><br>
                        <span id="uc"  class="invalid">&nbsp;A <b>capital (uppercase)</b> letter</span><br>
                        <span id="nc"  class="invalid">&nbsp;A <b>number</b></span><br>
                        <span id="sc"  class="invalid">&nbsp;A <b>special character from: <i class="text-blue">!@#$%^&</i></b></span><br>
                        <span id="cl"  class="invalid">&nbsp;Minimum <b>8 characters</b></span><br>
                    </div>
                </div>

                <div class="box-footer">
                    <g:render template="../template/btn_submit" model="${[btnType: "RESET_PASSWORD", c_btnReset: "btn_pw"]}"/>
                </div>
            </g:form>
        </div>
    </section>
</div>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js", file: "aalaa-reset-password.js")}"></script>
</body>
</html>