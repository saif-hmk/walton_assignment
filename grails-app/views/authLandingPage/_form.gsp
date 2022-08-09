%{--<%@ page import="org.aalaa.auth.AuthLandingPage" %>--}%

%{--
@Created_By : AALAA
@Date       : 2017.10.05 01:21:28 AM
@Author     : Md. Hoshen Mahmud Khan
@Email      : saif_hmk@live.com
@Phone      : +8801672036757
--}%

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authLandingPageInstance, field: 'active', 'has-error')}'>
            <label><g:message code="authLandingPage.isActive.label" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${authLandingPageInstance?.active}" />
            <g:renderErrors bean='authLandingPageInstance' field='isActive'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authLandingPageInstance, field: 'authRole', 'has-error')} required'>
            <label class='required'><g:message code="authLandingPage.authRole.label" default="Auth Role"/></label>
            <g:select name="authRole" class="form-control many-to-one" from="${org.aalaa.auth.AuthRole.list().sort{it.id}}" value="${authLandingPageInstance?.authRole?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='authLandingPageInstance' field='authRole'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: authLandingPageInstance, field: 'uri', 'has-error')} required'>
            <label class='required'><g:message code="authLandingPage.uri.label" default="Uri"/></label>
            <g:textArea name="uri" class="form-control" value="${authLandingPageInstance?.uri}" rows="2" cols="40" maxlength="2000" required="required"/>
            <g:renderErrors bean='authLandingPageInstance' field='uri'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authLandingPageInstance, field: 'priority', 'has-error')} required'>
            <label class='required'><g:message code="authLandingPage.priority.label" default="Priority"/></label>
            <g:field type="number" name="priority" class="form-control" value="${authLandingPageInstance?.priority}" min="0" max="99" step="1.00" required="required"/>
            <g:renderErrors bean='authLandingPageInstance' field='priority'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: authLandingPageInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="authLandingPage.remarks.label" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${authLandingPageInstance?.remarks}" rows="2" cols="40" maxlength="500"/>
            <g:renderErrors bean='authLandingPageInstance' field='remarks'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authLandingPageInstance, field: 'authUser', 'has-error')}'>
            <label><g:message code="authLandingPage.authUser.label" default="Auth User"/></label>
            <g:select name="authUser" class="form-control many-to-one" from="${org.aalaa.auth.AuthUser.list().sort{it.id}}" value="${authLandingPageInstance?.authUser?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='authLandingPageInstance' field='authUser'/>
        </div>
    </div>

</fieldset>
