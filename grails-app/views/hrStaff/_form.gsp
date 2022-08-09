<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 08:48:15 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset>
    <legend>General Information</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'nameFull', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.nameFull" default="Name Full"/></label>
            <g:textField name="nameFull" class="form-control" value="${hrStaffInstance?.nameFull}" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='nameFull'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'nameFullNative', 'has-error')}'>
            <label><g:message code="label.hrStaff.nameFullNative" default="Name Full Native"/></label>
            <g:textField name="nameFullNative" class="form-control" value="${hrStaffInstance?.nameFullNative}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='nameFullNative'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Personal Information</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'nameFather', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.nameFather" default="Name Father"/></label>
            <g:textField name="nameFather" class="form-control" value="${hrStaffInstance?.nameFather}" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='nameFather'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'nameNativeFather', 'has-error')}'>
            <label><g:message code="label.hrStaff.nameNativeFather" default="Name Native Father"/></label>
            <g:textField name="nameNativeFather" class="form-control" value="${hrStaffInstance?.nameNativeFather}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='nameNativeFather'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'nameMother', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.nameMother" default="Name Mother"/></label>
            <g:textField name="nameMother" class="form-control" value="${hrStaffInstance?.nameMother}" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='nameMother'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'nameNativeMother', 'has-error')}'>
            <label><g:message code="label.hrStaff.nameNativeMother" default="Name Native Mother"/></label>
            <g:textField name="nameNativeMother" class="form-control" value="${hrStaffInstance?.nameNativeMother}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='nameNativeMother'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'honorific', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.honorific" default="Honorific"/></label>
            <g:select name="honorific" class="form-control" from="${org.aalaa.com.Honorific?.values()}" keys="${org.aalaa.com.Honorific.values()*.name()}" value="${hrStaffInstance?.honorific?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='honorific'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'gender', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.gender" default="Gender"/></label>
            <g:select name="gender" class="form-control" from="${org.aalaa.com.Gender?.values()}" keys="${org.aalaa.com.Gender.values()*.name()}" value="${hrStaffInstance?.gender?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='gender'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'religion', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.religion" default="Religion"/></label>
            <g:select name="religion" class="form-control" from="${org.aalaa.com.Religion?.values()}" keys="${org.aalaa.com.Religion.values()*.name()}" value="${hrStaffInstance?.religion?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='religion'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'bloodGroup', 'has-error')}'>
            <label><g:message code="label.hrStaff.bloodGroup" default="Blood Group"/></label>
            <g:select name="bloodGroup" class="form-control" from="${org.aalaa.com.BloodGroup?.values()}" keys="${org.aalaa.com.BloodGroup.values()*.name()}" value="${hrStaffInstance?.bloodGroup?.name()}"  noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrStaffInstance}' field='bloodGroup'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'maritalStatus', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.maritalStatus" default="Marital Status"/></label>
            <g:select name="maritalStatus" class="form-control" from="${org.aalaa.com.MaritalStatus?.values()}" keys="${org.aalaa.com.MaritalStatus.values()*.name()}" value="${hrStaffInstance?.maritalStatus?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='maritalStatus'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'dateOfBirth', 'has-error')}'>
            <label><g:message code="label.hrStaff.dateOfBirth" default="Date Of Birth"/></label>
            <g:textField name="dateOfBirth" class="form-control dtp-date" value="${hrStaffInstance?.dateOfBirth?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='dateOfBirth'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'dateOfDeath', 'has-error')}'>
            <label><g:message code="label.hrStaff.dateOfDeath" default="Date Of Death"/></label>
            <g:textField name="dateOfDeath" class="form-control dtp-date" value="${hrStaffInstance?.dateOfDeath?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='dateOfDeath'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Contact Details</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'mobileNoPrimary', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.mobileNoPrimary" default="Mobile No Primary"/></label>
            <g:textField name="mobileNoPrimary" class="form-control im-mobile-bd v-mobile" value="${hrStaffInstance?.mobileNoPrimary}" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='mobileNoPrimary'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'mobileNoSecondary', 'has-error')}'>
            <label><g:message code="label.hrStaff.mobileNoSecondary" default="Mobile No Secondary"/></label>
            <g:textField name="mobileNoSecondary" class="form-control im-mobile-bd v-mobile" value="${hrStaffInstance?.mobileNoSecondary}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='mobileNoSecondary'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'email', 'has-error')}'>
            <label><g:message code="label.hrStaff.email" default="Email"/></label>
            <g:textField name="email" class="form-control" value="${hrStaffInstance?.email}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='email'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'nid', 'has-error')}'>
            <label><g:message code="label.hrStaff.nid" default="Nid"/></label>
            <g:textField name="nid" class="form-control" value="${hrStaffInstance?.nid}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='nid'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'bid', 'has-error')}'>
            <label><g:message code="label.hrStaff.bid" default="Bid"/></label>
            <g:textField name="bid" class="form-control" value="${hrStaffInstance?.bid}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='bid'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Emergency Contact Information</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'emergencyContactNo', 'has-error')}'>
            <label><g:message code="label.hrStaff.emergencyContactNo" default="Emergency Contact No"/></label>
            <g:textField name="emergencyContactNo" class="form-control im-mobile-bd v-mobile" value="${hrStaffInstance?.emergencyContactNo}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='emergencyContactNo'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'emergencyContactPerson', 'has-error')}'>
            <label><g:message code="label.hrStaff.emergencyContactPerson" default="Emergency Contact Person"/></label>
            <g:textField name="emergencyContactPerson" class="form-control" value="${hrStaffInstance?.emergencyContactPerson}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='emergencyContactPerson'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'emergencyContactRelation', 'has-error')}'>
            <label><g:message code="label.hrStaff.emergencyContactRelation" default="Emergency Contact Relation"/></label>
            <g:select name="emergencyContactRelation" class="form-control" from="${org.aalaa.com.Relation?.values()}" keys="${org.aalaa.com.Relation.values()*.name()}" value="${hrStaffInstance?.emergencyContactRelation?.name()}"  noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrStaffInstance}' field='emergencyContactRelation'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Present Address</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'locPresentDivision', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.locPresentDivision" default="Loc Present Division"/></label>
            <g:select name="locPresentDivision" class="form-control many-to-one" from="${org.aalaa.loc.LocDivision.list().sort{it.id}}" value="${hrStaffInstance?.locPresentDivision?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='locPresentDivision'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'locPresentDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.locPresentDistrict" default="Loc Present District"/></label>
            <g:select name="locPresentDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocDistrict.list().sort{it.id}}" value="${hrStaffInstance?.locPresentDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='locPresentDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'locPresentSubDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.locPresentSubDistrict" default="Loc Present Sub District"/></label>
            <g:select name="locPresentSubDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocSubDistrict.list().sort{it.id}}" value="${hrStaffInstance?.locPresentSubDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='locPresentSubDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'locPresentUnionCouncil', 'has-error')}'>
            <label><g:message code="label.hrStaff.locPresentUnionCouncil" default="Loc Present Union Council"/></label>
            <g:select name="locPresentUnionCouncil" class="form-control many-to-one" from="${org.aalaa.loc.LocUnionCouncil.list().sort{it.id}}" value="${hrStaffInstance?.locPresentUnionCouncil?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrStaffInstance}' field='locPresentUnionCouncil'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'locPresentAddress', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.locPresentAddress" default="Loc Present Address"/></label>
            <g:textArea name="locPresentAddress" class="form-control" value="${hrStaffInstance?.locPresentAddress}" required="required" cols="40" rows="2"/>
            <g:renderErrors bean='${hrStaffInstance}' field='locPresentAddress'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Permanent Address</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'locPermanentDivision', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.locPermanentDivision" default="Loc Permanent Division"/></label>
            <g:select name="locPermanentDivision" class="form-control many-to-one" from="${org.aalaa.loc.LocDivision.list().sort{it.id}}" value="${hrStaffInstance?.locPermanentDivision?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='locPermanentDivision'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'locPermanentDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.locPermanentDistrict" default="Loc Permanent District"/></label>
            <g:select name="locPermanentDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocDistrict.list().sort{it.id}}" value="${hrStaffInstance?.locPermanentDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='locPermanentDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'locPermanentSubDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.locPermanentSubDistrict" default="Loc Permanent Sub District"/></label>
            <g:select name="locPermanentSubDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocSubDistrict.list().sort{it.id}}" value="${hrStaffInstance?.locPermanentSubDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='locPermanentSubDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'locPermanentUnionCouncil', 'has-error')}'>
            <label><g:message code="label.hrStaff.locPermanentUnionCouncil" default="Loc Permanent Union Council"/></label>
            <g:select name="locPermanentUnionCouncil" class="form-control many-to-one" from="${org.aalaa.loc.LocUnionCouncil.list().sort{it.id}}" value="${hrStaffInstance?.locPermanentUnionCouncil?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrStaffInstance}' field='locPermanentUnionCouncil'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'locPermanentAddress', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.locPermanentAddress" default="Loc Permanent Address"/></label>
            <g:textArea name="locPermanentAddress" class="form-control" value="${hrStaffInstance?.locPermanentAddress}" required="required" cols="40" rows="2"/>
            <g:renderErrors bean='${hrStaffInstance}' field='locPermanentAddress'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Employment Information</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'code', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${hrStaffInstance?.code}" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='code'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'admVendorOrganization', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.admVendorOrganization" default="Adm Organization"/></label>
            <g:select name="admVendorOrganization" id="admVendorOrganization" class="form-control many-to-one" from="${org.aalaa.adm.AdmOrganization.list().sort{it.id}}" value="${hrStaffInstance?.admVendorOrganization?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='admVendorOrganization'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'department', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.department" default="Department"/></label>
            <g:select name="department" id="department" class="form-control many-to-one" from="${org.aalaa.adm.AdmDepartment.list().sort{it.id}}" value="${hrStaffInstance?.department?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='department'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'designation', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.designation" default="Designation"/></label>
            <g:select name="designation" id="designation" class="form-control many-to-one" from="${org.aalaa.adm.AdmDesignation.list().sort{it.id}}" value="${hrStaffInstance?.designation?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='designation'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'employmentType', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.employmentType" default="Employment Type"/></label>
            <g:select name="employmentType" id="employmentType" class="form-control" from="${org.aalaa.hr.HrEmploymentType?.values()}" keys="${org.aalaa.hr.HrEmploymentType.values()*.name()}" value="${hrStaffInstance?.employmentType?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='employmentType'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'serviceStatus', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.serviceStatus" default="Service Status"/></label>
            <g:select name="serviceStatus" class="form-control" from="${org.aalaa.hr.HrServiceStatus?.values()}" keys="${org.aalaa.hr.HrServiceStatus.values()*.name()}" value="${hrStaffInstance?.serviceStatus?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='serviceStatus'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'dateOfServiceStart', 'has-error')} required'>
            <label class='required'><g:message code="label.hrStaff.dateOfServiceStart" default="Date Of Service Start"/></label>
            <g:textField name="dateOfServiceStart" class="form-control dtp-date" value="${hrStaffInstance?.dateOfServiceStart?.format(grailsApplication.config.format.dtp.date)}" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='dateOfServiceStart'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'dateOfServiceEnd', 'has-error')}'>
            <label><g:message code="label.hrStaff.dateOfServiceEnd" default="Date Of Service End"/></label>
            <g:textField name="dateOfServiceEnd" class="form-control dtp-date" value="${hrStaffInstance?.dateOfServiceEnd?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${hrStaffInstance}' field='dateOfServiceEnd'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'grossSalary', 'has-error')}'>
            <label class="required"><g:message code="label.hrStaff.grossSalary" default="Gross Salary"/></label>
            <g:field type="number" name="grossSalary" id="grossSalary" class="form-control" value="${hrStaffInstance?.grossSalary}" min="0" max="999999" step="1.00" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='grossSalary'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'ratePerHour', 'has-error')}'>
            <label class="required"><g:message code="label.hrStaff.ratePerHour" default="Rate Per Hour"/></label>
            <g:field type="number" name="ratePerHour" id="ratePerHour" class="form-control" value="${hrStaffInstance?.ratePerHour}" min="0" max="9999" step="1.00" required="required"/>
            <g:renderErrors bean='${hrStaffInstance}' field='ratePerHour'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'limitPerMonth', 'has-error')}'>
            <label><g:message code="label.hrStaff.limitPerMonth" default="Max Limit Per Month"/></label>
            <g:field type="number" name="limitPerMonth" id="limitPerMonth" class="form-control" value="${hrStaffInstance?.limitPerMonth}" min="0" max="999999" step="1.00"/>
            <g:renderErrors bean='${hrStaffInstance}' field='limitPerMonth'/>
        </div>
    </div>

    %{--
    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'departmentJoining', 'has-error')}'>
            <label><g:message code="label.hrStaff.departmentJoining" default="Department Joining"/></label>
            <g:select name="departmentJoining" class="form-control many-to-one" from="${org.aalaa.adm.AdmDepartment.list().sort{it.id}}" value="${hrStaffInstance?.departmentJoining?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrStaffInstance}' field='departmentJoining'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'designationJoining', 'has-error')}'>
            <label><g:message code="label.hrStaff.designationJoining" default="Designation Joining"/></label>
            <g:select name="designationJoining" class="form-control many-to-one" from="${org.aalaa.adm.AdmDesignation.list().sort{it.id}}" value="${hrStaffInstance?.designationJoining?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrStaffInstance}' field='designationJoining'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrStaffInstance, field: 'grossSalaryJoining', 'has-error')}'>
            <label><g:message code="label.hrStaff.grossSalaryJoining" default="Gross Salary Joining"/></label>
            <g:field type="number" name="grossSalaryJoining" class="form-control" value="${fieldValue(bean: hrStaffInstance, field: 'grossSalaryJoining')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${hrStaffInstance}' field='grossSalaryJoining'/>
        </div>
    </div>
    --}%

</fieldset>

<script type="text/javascript">
    const controller = "commonAjax";

    $(document).on("change", "#admVendorOrganization", function () {
        refreshDepartment($(this));
    });

    $(document).on("change", "#department", function () {
        refreshDesignation($("#admVendorOrganization").val(), $(this));
    });

    function refreshDepartment(d) {
        //department
        if(d.val()){
            $.ajax({
                type: "POST",
                async: false,
                url: contextPath + "/" + controller + "/getDepartments",
                data: {
                    admVendorOrganization: d.val()
                },
                success: function (r) {
                    $("#department").empty().append(r);
                }
            });
        }
        else{
            alert("Please select an Organization first!");
            $("#department").val("");
            $("#designation").val("");
        }
    }

    function refreshDesignation(admVendorOrganization, d) {
        //designation
        if(admVendorOrganization && d.val()){
            $.ajax({
                type: "POST",
                async: false,
                url: contextPath + "/" + controller + "/getDesignations",
                data: {
                    admVendorOrganization: admVendorOrganization,
                    department           : d.val()
                },
                success: function (r) {
                    $("#designation").empty().append(r);
                }
            });
        }
        else{
            alert("Please select an Organization & a Department first!");
            $("#designation").val("");
        }
    }

    $(document).ready(function () {
        validateEmploymentTypeDependencies($("#employmentType"));
    });

    $(document).on("change", "#employmentType", function () {
        validateEmploymentTypeDependencies($(this));
    });

    function validateEmploymentTypeDependencies(d) {
        let employmentType = d.val();
        if(employmentType && employmentType == "PART_TIME"){
            $("#grossSalary"  ).prop("disabled", true ).parent().parent().hide();
            $("#limitPerMonth").prop("disabled", false).parent().parent().show();
            $("#ratePerHour"  ).prop("disabled", false).parent().parent().show();
        }
        else{
            $("#grossSalary"  ).prop("disabled", false).parent().parent().show();
            $("#limitPerMonth").prop("disabled", true ).parent().parent().hide();
            $("#ratePerHour"  ).prop("disabled", true ).parent().parent().hide();
        }
    }
</script>
