%{--
@Created_By : AALAA
@Date       : 2017.10.05 01:22:06 AM
@Author     : Md. Hoshen Mahmud Khan
@Email      : saif_hmk@live.com
@Phone      : +8801672036757
--}%

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: authRoleInstance, field: 'authority', 'has-error')} required'>
            <label class='required'><g:message code="label.authRole.authority" default="Authority"/></label>
            <g:textField name="authority" class="form-control" value="${authRoleInstance?.authority}" pattern="${authRoleInstance.constraints.authority.matches}" minlength="7" maxlength="30" required="required" placeholder="ROLE_SOMETHING" title="Must have to start with prefix 'ROLE_'. Use underscore (_) as word separator and Upper case letter."/>
            <g:renderErrors bean='authRoleInstance' field='authority'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: authRoleInstance, field: 'rank', 'has-error')} required'>
            <label class='required'><g:message code="label.authRole.rank" default="Rank"/></label>
            <g:field type="number" name="rank" class="form-control" value="${authRoleInstance?.rank}" required="required" min="100" max="999"/>
            <g:renderErrors bean='authRoleInstance' field='rank'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: authRoleInstance, field: 'isActive', 'has-error')}'>
            <label class="br"><g:message code="label.authRole.isActive" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${authRoleInstance?.isActive}" />
            <g:renderErrors bean='authRoleInstance' field='isActive'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: authRoleInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.authRole.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${authRoleInstance?.remarks}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='authRoleInstance' field='remarks'/>
        </div>
    </div>

</fieldset>
