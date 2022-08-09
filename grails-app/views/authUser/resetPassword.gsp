    <%--
  Created by @Created_By  : AALAA.
  User: saif_hmk@live.com
  Date: 2016.10.08
  Time: 11:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="aalaa">
    <title>Reset Password</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/aalaa/css", file: "aalaa-reset-password.css")}">
</head>

<body>

<div class="content-wrapper">

    <section class="content-header">
        <h1>Reset Password</h1>
    </section>

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section>

    <section class="content">
        <div class="box box-primary">
            <g:form action="resetPassword" method="POST" id="${userInstance?.id}" class="form-horizontal formValidation">
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

                        <div class="form-group">
                            <label class="col-sm-4 control-label">Reset Password At Next Logon?</label>

                            <div class="col-sm-8">
                                <g:checkBox class="cbX" name="resetAtNextLogin"/>
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