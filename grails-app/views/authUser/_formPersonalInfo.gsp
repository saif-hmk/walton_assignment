<!--
 @Created_By : AALAA
 @Date       : 2016.10.14 01:45:44 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<div class="box-body no-padding">
    <g:hiddenField name="version" value="${authUserInstance?.version}"/>
    <g:hiddenField name="authUserProfile.id" value="${authUserProfileInstance?.id}"/>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'honorific', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProfile.honorific" default="Honorific"/></label>
            <g:select name="authUserProfile.honorific" class="form-control" from="${org.aalaa.com.Honorific?.values()}" keys="${org.aalaa.com.Honorific.values()*.name()}" value="${authUserProfileInstance?.honorific?.name()}" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='honorific'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'religion', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProfile.religion" default="Religion"/></label>
            <g:select name="authUserProfile.religion" class="form-control" from="${org.aalaa.com.Religion?.values()}" keys="${org.aalaa.com.Religion.values()*.name()}" value="${authUserProfileInstance?.religion?.name()}" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='religion'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'gender', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProfile.gender" default="Gender"/></label>
            <g:select name="authUserProfile.gender" class="form-control" from="${org.aalaa.com.Gender?.values()}" keys="${org.aalaa.com.Gender.values()*.name()}" value="${authUserProfileInstance?.gender?.name()}" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='gender'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'maritalStatus', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProfile.maritalStatus" default="Marital Status"/></label>
            <g:select name="authUserProfile.maritalStatus" class="form-control" from="${org.aalaa.com.MaritalStatus?.values()}" keys="${org.aalaa.com.MaritalStatus.values()*.name()}" value="${authUserProfileInstance?.maritalStatus?.name()}" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='maritalStatus'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'dateOfBirth', 'has-error')} required'>
            <label><g:message code="label.authUserProfile.dateOfBirth" default="Date Of Birth"/></label>
            <g:textField name="authUserProfile.dateOfBirth" class="form-control dtp-date" value="${authUserProfileInstance?.dateOfBirth?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='dateOfBirth'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'fathersName', 'has-error')} required'>
            <label><g:message code="label.authUserProfile.fathersName" default="Fathers Name"/></label>
            <g:textField name="authUserProfile.fathersName" class="form-control" value="${authUserProfileInstance?.fathersName}"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='fathersName'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'mothersName', 'has-error')} required'>
            <label><g:message code="label.authUserProfile.mothersName" default="Mothers Name"/></label>
            <g:textField name="authUserProfile.mothersName" class="form-control" value="${authUserProfileInstance?.mothersName}"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='mothersName'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'nationalId', 'has-error')}'>
            <label><g:message code="label.authUserProfile.nationalId" default="National Id"/></label>
            <g:textField name="authUserProfile.nationalId" class="form-control v-nid" value="${authUserProfileInstance?.nationalId}"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='nationalId'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'bloodGroup', 'has-error')}'>
            <label><g:message code="label.authUserProfile.bloodGroup" default="Blood Group"/></label>
            <g:select name="authUserProfile.bloodGroup" class="form-control" from="${org.aalaa.com.BloodGroup?.values()}" keys="${org.aalaa.com.BloodGroup.values()*.name()}" value="${authUserProfileInstance?.bloodGroup?.name()}" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${authUserProfileInstance}' field='bloodGroup'/>
        </div>
    </div>

</div>
