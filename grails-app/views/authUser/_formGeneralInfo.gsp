<!--
 @Created_By : AALAA
 @Date       : 2019.10.12 02:17:12 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/aalaa/css", file: "aalaa-reset-password.css")}">

<fieldset class='form'>
    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6 no-padding' >
        <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
            <div class='form-group ${hasErrors(bean: authUserInstance, field: 'fullName', 'has-error')} required'>
                <label class='required'><g:message code="label.authUser.fullName" default="Full Name"/></label>
                <g:textField name="fullName" class="form-control" value="${authUserInstance?.fullName}" minlength="3" maxlength="35" pattern="${authUserInstance.constraints.fullName.matches}" placeholder="Mr. Admin" title="This field can except only Letter, Space, Dot And Dash" required="required"/>
                <g:renderErrors bean='authUserInstance' field='fullName'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-12 col-md-6 col-lg-6'>
            <div class='form-group ${hasErrors(bean: authUserInstance, field: 'displayName', 'has-error')} required'>
                <label class='required'><g:message code="label.authUser.displayName" default="Display Name"/></label>
                <g:textField name="displayName" class="form-control" value="${authUserInstance?.displayName}" minlength="3" maxlength="25" pattern="${authUserInstance.constraints.displayName.matches}" placeholder="Branch Admin - DHK01" title="This field can except only Letter, Number, Space, Dot And Dash" required="required"/>
                <g:renderErrors bean='authUserInstance' field='displayName'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-12 col-md-6 col-lg-6'>
            <div class='form-group ${hasErrors(bean: authUserInstance, field: 'username', 'has-error')} required'>
                <label class='required'><g:message code="label.authUser.username" default="Username"/></label>
                <label id="lblErrMsg" class="label label-danger"></label>
                <g:textField id="username" name="username" class="form-control" onblur="checkUserName(this.value)" value="${authUserInstance?.username}" pattern="${authUserInstance.constraints.username.matches}" minlength="3" maxlength="25" required="required" placeholder="ho_admin" title="Must have to start with prefix 'Branch Code'. Use underscore (_) as word separator and lower case letter."/>
                <g:renderErrors bean='authUserInstance' field='username'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-12 col-md-6 col-lg-6'>
            <div class='form-group ${hasErrors(bean: authUserInstance, field: 'phone', 'has-error')}'>
                <label><g:message code="label.authUser.phone" default="Phone"/></label>
                <g:textField name="phone" class="form-control ph-mobile im-mobile-bd v-mobile-bd" value="${authUserInstance?.phone}" minlength="14" maxlength="14" pattern="${authUserInstance.constraints.phone.matches}" title="Must be 14 characters long, start with '+8801' and operator allowed only [3-9]!"/>
                <g:renderErrors bean='authUserInstance' field='phone'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-12 col-md-6 col-lg-6'>
            <div class='form-group ${hasErrors(bean: authUserInstance, field: 'email', 'has-error')}'>
                <label><g:message code="label.authUser.email" default="Email"/></label>
                <g:field type="email" name="email" class="form-control" value="${authUserInstance?.email}" placeholder="someone@example.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}\$" title="Please enter a valid email"/>
                <g:renderErrors bean='authUserInstance' field='email'/>
            </div>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6 no-padding password-block'>
        <div class='col-xs-12 col-sm-12 col-md-6 col-lg-6'>
            <div class='form-group ${hasErrors(bean: authUserInstance, field: 'password', 'has-error')} required'>
                <label class='required'><g:message code="label.authUser.password" default="Password"/></label>
                %{--<g:field type="password" title="password" id="newPassword" class="form-control pw newPassword" pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#\$%^&])(?=\\S+\$).{8,}\$" value="" required="required"/>--}%
                <g:field type="password" name="password" id="newPassword" class="form-control pw newPassword"/>
                <label hidden class="p-t-10 c-red newPassword"></label>
                <g:renderErrors bean='authUserInstance' field='password'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-12 col-md-6 col-lg-6'>
            <div class='form-group ${hasErrors(bean: authUserInstance, field: 'password', 'has-error')} required'>
                <label class='required'><g:message code="label.authUser.confirmPassword" default="Confirm Password"/></label>
                %{--<g:field type="password" title="confirmPassword" id="confirmPassword" class="form-control pw confirmPassword" pattern="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#\$%^&])(?=\\S+\$).{8,}\$" value="" required="required"/>--}%
                <g:field type="password" name="confirmPassword" id="confirmPassword" class="form-control pw confirmPassword"/>
                <label hidden class="p-t-10 c-red confirmPassword"></label>
                <g:renderErrors bean='authUserInstance' field='password'/>
            </div>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="message">
            <h4 class="bold text-red blink" style=""><u>Password must contain the following:</u></h4>
            <span id="lc" class="invalid">&nbsp;A <b>lowercase</b> letter</span><br>
            <span id="uc" class="invalid">&nbsp;A <b>capital (uppercase)</b> letter</span><br>
            <span id="nc" class="invalid">&nbsp;A <b>number</b></span><br>
            <span id="sc" class="invalid">&nbsp;A <b>special character from: <i class="text-blue">!@#$%^&</i></b></span><br>
            <span id="cl" class="invalid">&nbsp;Minimum <b>8 characters</b></span><br>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: authUserInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.authUser.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${authUserInstance?.remarks}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='authUserInstance' field='remarks'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Account Status</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserInstance, field: 'enabled', 'has-error')}'>
            <label><g:message code="label.authUser.enabled" default="Enabled"/></label><br>
            <g:checkBox class="cb" name="enabled" value="${authUserInstance?.enabled}"/>
            <g:renderErrors bean='authUserInstance' field='enabled'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserInstance, field: 'passwordExpired', 'has-error')}'>
            <label><g:message code="label.authUser.passwordExpired" default="Password Expired"/></label><br>
            <g:checkBox class="cb" name="passwordExpired" value="${authUserInstance?.passwordExpired}"/>
            <g:renderErrors bean='authUserInstance' field='passwordExpired'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserInstance, field: 'accountLocked', 'has-error')}'>
            <label><g:message code="label.authUser.accountLocked" default="Account Locked"/></label><br>
            <g:checkBox class="cb" name="accountLocked" value="${authUserInstance?.accountLocked}"/>
            <g:renderErrors bean='authUserInstance' field='accountLocked'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserInstance, field: 'accountExpired', 'has-error')}'>
            <label><g:message code="label.authUser.accountExpired" default="Account Expired"/></label><br>
            <g:checkBox class="cb" name="accountExpired" value="${authUserInstance?.accountExpired}"/>
            <g:renderErrors bean='authUserInstance' field='accountExpired'/>
        </div>
    </div>
</fieldset>
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js", file: "aalaa-reset-password.js")}"></script>
%{--<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js", file: "aalaa-reset-password2.js")}"></script>--}%
