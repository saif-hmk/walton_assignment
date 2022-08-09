<!--
 @Created_By : AALAA
 @Date       : 2021.12.08 03:17:30 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>
    <legend>Personal Information</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'fathersName', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProfile.fathersName" default="Fathers Name"/></label>
            <g:textField name="fathersName" class="form-control" value="${authUserProfileInstance?.fathersName}" required="required"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='fathersName'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'mothersName', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProfile.mothersName" default="Mothers Name"/></label>
            <g:textField name="mothersName" class="form-control" value="${authUserProfileInstance?.mothersName}" required="required"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='mothersName'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'dateOfBirth', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProfile.dateOfBirth" default="Date Of Birth"/></label>
            <g:textField name="dateOfBirth" class="form-control dtp-date" value="${authUserProfileInstance?.dateOfBirth?.format(grailsApplication.config.format.dtp.date)}" required="required"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='dateOfBirth'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'gender', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProfile.gender" default="Gender"/></label>
            <g:select name="gender" class="form-control" from="${org.aalaa.com.Gender?.values()}" keys="${org.aalaa.com.Gender.values()*.name()}" value="${authUserProfileInstance?.gender?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='gender'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'maritalStatus', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProfile.maritalStatus" default="Marital Status"/></label>
            <g:select name="maritalStatus" class="form-control" from="${org.aalaa.com.MaritalStatus?.values()}" keys="${org.aalaa.com.MaritalStatus.values()*.name()}" value="${authUserProfileInstance?.maritalStatus?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='maritalStatus'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'religion', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProfile.religion" default="Religion"/></label>
            <g:select name="religion" class="form-control" from="${org.aalaa.com.Religion?.values()}" keys="${org.aalaa.com.Religion.values()*.name()}" value="${authUserProfileInstance?.religion?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='religion'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'nationalId', 'has-error')}'>
            <label><g:message code="label.authUserProfile.nationalId" default="National Id"/></label>
            <g:textField name="nationalId" class="form-control" value="${authUserProfileInstance?.nationalId}"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='nationalId'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'bloodGroup', 'has-error')}'>
            <label><g:message code="label.authUserProfile.bloodGroup" default="Blood Group"/></label>
            <g:select name="bloodGroup" class="form-control" from="${org.aalaa.com.BloodGroup?.values()}" keys="${org.aalaa.com.BloodGroup.values()*.name()}" value="${authUserProfileInstance?.bloodGroup?.name()}"  noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='bloodGroup'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'honorific', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProfile.honorific" default="Honorific"/></label>
            <g:select name="honorific" class="form-control" from="${org.aalaa.com.Honorific?.values()}" keys="${org.aalaa.com.Honorific.values()*.name()}" value="${authUserProfileInstance?.honorific?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='honorific'/>
        </div>
    </div>

    %{--
    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'signature', 'has-error')}'>
            <label><g:message code="label.authUserProfile.signature" default="Signature"/></label>
            <g:textArea title="signature" class="form-control" value="${authUserProfileInstance?.signature}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='signature'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'image', 'has-error')}'>
            <label><g:message code="label.authUserProfile.image" default="Image"/></label>
            <g:textArea title="image" class="form-control" value="${authUserProfileInstance?.image}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='image'/>
        </div>
    </div>
    --}%

</fieldset>
