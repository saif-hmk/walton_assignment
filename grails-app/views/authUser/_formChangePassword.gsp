<!--
 @Created_By : AALAA
 @Date       : 2016.10.14 01:45:44 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<div class="box box-danger">
    <g:form url="[resource: authUserInstance, action: 'profile']" method="POST">
        <div class="box-header with-border">
            <h3 class="box-title"><g:message code="label.authUser.changePassword" default="Change Password"/></h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                %{--                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>--}%
            </div>
        </div>

        <div class="box-body no-padding">
            <g:hiddenField name="version" value="${authUserInstance?.version}"/>
            <div class="row p-l-15">
                <div class='col-xs-12 col-sm-6'>
                    <div class='form-group ${hasErrors(bean: authUserInstance, field: 'password', 'has-error')} required'>
                        <label><g:message code="label.authUser.oldPassword" default="Old Password"/></label>
                        %{--<g:field type="password" title="password" class="form-control ac-off" value="${authUserInstance?.password}" pattern="(?=.*\\d)(?=.*[a-z])(?=\\.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" maxlength="100" required="required"/>--}%
                        <g:field type="password" name="oldPassword" id="oldPassword" class="form-control ac-off" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" maxlength="100"/>
                        <g:renderErrors bean='authUserInstance' field='oldPassword'/>
                    </div>
                </div>
            </div>

            <div class='col-xs-12 col-sm-6'>
                <div class='form-group ${hasErrors(bean: authUserInstance, field: 'password', 'has-error')} required'>
                    <label><g:message code="label.authUser.newPassword" default="New Password"/></label>
                    %{--<g:field type="password" title="password" class="form-control ac-off" value="${authUserInstance?.password}" pattern="(?=.*\\d)(?=.*[a-z])(?=\\.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" maxlength="100" required="required"/>--}%
                    <g:field type="password" name="newPassword" id="newPassword" class="form-control ac-off" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" maxlength="100"/>
                    <g:renderErrors bean='authUserInstance' field='newPassword'/>
                </div>
            </div>

            <div class='col-xs-12 col-sm-6'>
                <div class='form-group ${hasErrors(bean: authUserInstance, field: 'password', 'has-error')} required'>
                    <label><g:message code="label.authUser.confirmPassword" default="Confirm Password"/></label>
                    %{--<g:field type="password" title="password" class="form-control ac-off" value="${authUserInstance?.password}" pattern="(?=.*\\d)(?=.*[a-z])(?=\\.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" maxlength="100" required="required"/>--}%
                    <g:field type="password" name="confirmPassword" id="confirmPassword" class="form-control ac-off" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" maxlength="100"/>
                    <g:renderErrors bean='authUserInstance' field='confirmPassword'/>
                </div>
            </div>
        </div>

        <div class="box-footer">
            <fieldset class="buttons">
                <sec:access url="/authUser/profile/${authUserInstance?.id}">
                    <button type="submit" class="btn btn-success"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> ${message(code: "default.button.update", default: "Update")}</button>
                </sec:access>
            </fieldset>
        </div>
    </g:form>
</div>
