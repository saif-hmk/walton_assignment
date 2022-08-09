<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 08:56:08 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->
<fieldset>
    <legend>General Information</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameFull', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.nameFull" default="Name Full"/></label>
            <g:textField name="nameFull" class="form-control" value="${hrGeneralEmployeeInstance?.nameFull}" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameFull'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameFullNative', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nameFullNative" default="Name Full Native"/></label>
            <g:textField name="nameFullNative" class="form-control" value="${hrGeneralEmployeeInstance?.nameFullNative}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameFullNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameFirst', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nameFirst" default="Name First"/></label>
            <g:textField name="nameFirst" class="form-control" value="${hrGeneralEmployeeInstance?.nameFirst}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameFirst'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameFirstNative', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nameFirstNative" default="Name First Native"/></label>
            <g:textField name="nameFirstNative" class="form-control" value="${hrGeneralEmployeeInstance?.nameFirstNative}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameFirstNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameMiddle', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nameMiddle" default="Name Middle"/></label>
            <g:textField name="nameMiddle" class="form-control" value="${hrGeneralEmployeeInstance?.nameMiddle}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameMiddle'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameMiddleNative', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nameMiddleNative" default="Name Middle Native"/></label>
            <g:textField name="nameMiddleNative" class="form-control" value="${hrGeneralEmployeeInstance?.nameMiddleNative}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameMiddleNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameLastSur', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nameLastSur" default="Name Last Sur"/></label>
            <g:textField name="nameLastSur" class="form-control" value="${hrGeneralEmployeeInstance?.nameLastSur}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameLastSur'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameLastSurNative', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nameLastSurNative" default="Name Last Sur Native"/></label>
            <g:textField name="nameLastSurNative" class="form-control" value="${hrGeneralEmployeeInstance?.nameLastSurNative}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameLastSurNative'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Personal Information</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameFather', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.nameFather" default="Name Father"/></label>
            <g:textField name="nameFather" class="form-control" value="${hrGeneralEmployeeInstance?.nameFather}" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameFather'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameNativeFather', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nameNativeFather" default="Name Native Father"/></label>
            <g:textField name="nameNativeFather" class="form-control" value="${hrGeneralEmployeeInstance?.nameNativeFather}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameNativeFather'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameMother', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.nameMother" default="Name Mother"/></label>
            <g:textField name="nameMother" class="form-control" value="${hrGeneralEmployeeInstance?.nameMother}" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameMother'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameNativeMother', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nameNativeMother" default="Name Native Mother"/></label>
            <g:textField name="nameNativeMother" class="form-control" value="${hrGeneralEmployeeInstance?.nameNativeMother}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameNativeMother'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'honorific', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.honorific" default="Honorific"/></label>
            <g:select name="honorific" class="form-control" from="${org.aalaa.com.Honorific?.values()}" keys="${org.aalaa.com.Honorific.values()*.name()}" value="${hrGeneralEmployeeInstance?.honorific?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='honorific'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'gender', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.gender" default="Gender"/></label>
            <g:select name="gender" class="form-control" from="${org.aalaa.com.Gender?.values()}" keys="${org.aalaa.com.Gender.values()*.name()}" value="${hrGeneralEmployeeInstance?.gender?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='gender'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'religion', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.religion" default="Religion"/></label>
            <g:select name="religion" class="form-control" from="${org.aalaa.com.Religion?.values()}" keys="${org.aalaa.com.Religion.values()*.name()}" value="${hrGeneralEmployeeInstance?.religion?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='religion'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'bloodGroup', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.bloodGroup" default="Blood Group"/></label>
            <g:select name="bloodGroup" class="form-control" from="${org.aalaa.com.BloodGroup?.values()}" keys="${org.aalaa.com.BloodGroup.values()*.name()}" value="${hrGeneralEmployeeInstance?.bloodGroup?.name()}"  noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='bloodGroup'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'dateOfBirth', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.dateOfBirth" default="Date Of Birth"/></label>
            <g:textField name="dateOfBirth" class="form-control dtp-date" value="${hrGeneralEmployeeInstance?.dateOfBirth?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='dateOfBirth'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'dateOfDeath', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.dateOfDeath" default="Date Of Death"/></label>
            <g:textField name="dateOfDeath" class="form-control dtp-date" value="${hrGeneralEmployeeInstance?.dateOfDeath?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='dateOfDeath'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'maritalStatus', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.maritalStatus" default="Marital Status"/></label>
            <g:select name="maritalStatus" id="maritalStatus" class="form-control" from="${org.aalaa.com.MaritalStatus?.values()}" keys="${org.aalaa.com.MaritalStatus.values()*.name()}" value="${hrGeneralEmployeeInstance?.maritalStatus?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='maritalStatus'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameSpouse', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nameSpouse" default="Name Spouse"/></label>
            <g:textField name="nameSpouse" id="nameSpouse" class="form-control" value="${hrGeneralEmployeeInstance?.nameSpouse}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameSpouse'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nameSpouseNative', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nameSpouseNative" default="Name Spouse Native"/></label>
            <g:textField name="nameSpouseNative" id="nameSpouseNative" class="form-control" value="${hrGeneralEmployeeInstance?.nameSpouseNative}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nameSpouseNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'familyMemberTotal', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.familyMemberTotal" default="Family Member Total"/></label>
            <g:field type="number" name="familyMemberTotal" class="form-control" value="${hrGeneralEmployeeInstance?.familyMemberTotal}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='familyMemberTotal'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'familyMemberDependent', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.familyMemberDependent" default="Family Member Dependent"/></label>
            <g:field type="number" name="familyMemberDependent" class="form-control" value="${hrGeneralEmployeeInstance?.familyMemberDependent}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='familyMemberDependent'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Contact Details</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'mobileNoPrimary', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.mobileNoPrimary" default="Mobile No Primary"/></label>
            <g:textField name="mobileNoPrimary" class="form-control im-mobile-bd v-mobile" value="${hrGeneralEmployeeInstance?.mobileNoPrimary}" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='mobileNoPrimary'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'mobileNoSecondary', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.mobileNoSecondary" default="Mobile No Secondary"/></label>
            <g:textField name="mobileNoSecondary" class="form-control im-mobile-bd v-mobile" value="${hrGeneralEmployeeInstance?.mobileNoSecondary}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='mobileNoSecondary'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'email', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.email" default="Email"/></label>
            <g:textField name="email" class="form-control" value="${hrGeneralEmployeeInstance?.email}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='email'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'nid', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.nid" default="Nid"/></label>
            <g:textField name="nid" class="form-control" value="${hrGeneralEmployeeInstance?.nid}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='nid'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'bid', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.bid" default="Bid"/></label>
            <g:textField name="bid" class="form-control" value="${hrGeneralEmployeeInstance?.bid}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='bid'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'passportNo', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.passportNo" default="Passport No"/></label>
            <g:textField name="passportNo" class="form-control" value="${hrGeneralEmployeeInstance?.passportNo}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='passportNo'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'passportExpireDate', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.passportExpireDate" default="Passport Expire Date"/></label>
            <g:textField name="passportExpireDate" class="form-control dtp-date" value="${hrGeneralEmployeeInstance?.passportExpireDate?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='passportExpireDate'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Emergency Contact Information</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'emergencyContactNo', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.emergencyContactNo" default="Emergency Contact No"/></label>
            <g:textField name="emergencyContactNo" class="form-control im-mobile-bd v-mobile" value="${hrGeneralEmployeeInstance?.emergencyContactNo}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='emergencyContactNo'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'emergencyContactPerson', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.emergencyContactPerson" default="Emergency Contact Person"/></label>
            <g:textField name="emergencyContactPerson" class="form-control" value="${hrGeneralEmployeeInstance?.emergencyContactPerson}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='emergencyContactPerson'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'emergencyContactRelation', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.emergencyContactRelation" default="Emergency Contact Relation"/></label>
            <g:select name="emergencyContactRelation" class="form-control" from="${org.aalaa.com.Relation?.values()}" keys="${org.aalaa.com.Relation.values()*.name()}" value="${hrGeneralEmployeeInstance?.emergencyContactRelation?.name()}"  noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='emergencyContactRelation'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Present Address</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'locPresentDivision', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.locPresentDivision" default="Loc Present Division"/></label>
            <g:select name="locPresentDivision" class="form-control many-to-one" from="${org.aalaa.loc.LocDivision.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.locPresentDivision?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='locPresentDivision'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'locPresentDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.locPresentDistrict" default="Loc Present District"/></label>
            <g:select name="locPresentDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocDistrict.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.locPresentDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='locPresentDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'locPresentSubDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.locPresentSubDistrict" default="Loc Present Sub District"/></label>
            <g:select name="locPresentSubDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocSubDistrict.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.locPresentSubDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='locPresentSubDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'locPresentUnionCouncil', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.locPresentUnionCouncil" default="Loc Present Union Council"/></label>
            <g:select name="locPresentUnionCouncil" class="form-control many-to-one" from="${org.aalaa.loc.LocUnionCouncil.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.locPresentUnionCouncil?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='locPresentUnionCouncil'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'locPresentAddress', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.locPresentAddress" default="Loc Present Address"/></label>
            <g:textArea name="locPresentAddress" class="form-control" value="${hrGeneralEmployeeInstance?.locPresentAddress}" required="required" rows="2" cols="40"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='locPresentAddress'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Permanent Address</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'locPermanentDivision', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.locPermanentDivision" default="Loc Permanent Division"/></label>
            <g:select name="locPermanentDivision" class="form-control many-to-one" from="${org.aalaa.loc.LocDivision.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.locPermanentDivision?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='locPermanentDivision'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'locPermanentDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.locPermanentDistrict" default="Loc Permanent District"/></label>
            <g:select name="locPermanentDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocDistrict.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.locPermanentDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='locPermanentDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'locPermanentSubDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.locPermanentSubDistrict" default="Loc Permanent Sub District"/></label>
            <g:select name="locPermanentSubDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocSubDistrict.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.locPermanentSubDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='locPermanentSubDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'locPermanentUnionCouncil', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.locPermanentUnionCouncil" default="Loc Permanent Union Council"/></label>
            <g:select name="locPermanentUnionCouncil" class="form-control many-to-one" from="${org.aalaa.loc.LocUnionCouncil.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.locPermanentUnionCouncil?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='locPermanentUnionCouncil'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'locPermanentAddress', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.locPermanentAddress" default="Loc Permanent Address"/></label>
            <g:textArea name="locPermanentAddress" class="form-control" value="${hrGeneralEmployeeInstance?.locPermanentAddress}" required="required" cols="40" rows="2"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='locPermanentAddress'/>
        </div>
    </div>

</fieldset>

<fieldset>
    <legend>Employment Information</legend>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'code', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${hrGeneralEmployeeInstance?.code}" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='code'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'admVendorOrganization', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.admVendorOrganization" default="Adm Organization"/></label>
            <g:select name="admVendorOrganization" id="admVendorOrganization" class="form-control many-to-one" from="${org.aalaa.adm.AdmOrganization.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.admVendorOrganization?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='admVendorOrganization'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'department', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.department" default="Department"/></label>
            <g:select name="department" id="department" class="form-control many-to-one" from="${org.aalaa.adm.AdmDepartment.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.department?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='department'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'designation', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.designation" default="Designation"/></label>
            <g:select name="designation" id="designation" class="form-control many-to-one" from="${org.aalaa.adm.AdmDesignation.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.designation?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='designation'/>
        </div>
    </div>

    %{--
    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'employeeType', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.employeeType" default="Employee Type"/></label>
            <g:select name="employeeType" class="form-control" from="${org.aalaa.hr.HrEmployeeType?.values()}" keys="${org.aalaa.hr.HrEmployeeType.values()*.name()}" value="${hrGeneralEmployeeInstance?.employeeType?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='employeeType'/>
        </div>
    </div>
    --}%

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'employmentType', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.employmentType" default="Employment Type"/></label>
            <g:select name="employmentType" class="form-control" from="${org.aalaa.hr.HrEmploymentType?.values()}" keys="${org.aalaa.hr.HrEmploymentType.values()*.name()}" value="${hrGeneralEmployeeInstance?.employmentType?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='employmentType'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'serviceStatus', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.serviceStatus" default="Service Status"/></label>
            <g:select name="serviceStatus" class="form-control" from="${org.aalaa.hr.HrServiceStatus?.values()}" keys="${org.aalaa.hr.HrServiceStatus.values()*.name()}" value="${hrGeneralEmployeeInstance?.serviceStatus?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='serviceStatus'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'dateOfServiceStart', 'has-error')} required'>
            <label class='required'><g:message code="label.hrGeneralEmployee.dateOfServiceStart" default="Date Of Service Start"/></label>
            <g:textField name="dateOfServiceStart" class="form-control dtp-date" value="${hrGeneralEmployeeInstance?.dateOfServiceStart?.format(grailsApplication.config.format.dtp.date)}" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='dateOfServiceStart'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'dateOfServiceEnd', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.dateOfServiceEnd" default="Date Of Service End"/></label>
            <g:textField name="dateOfServiceEnd" class="form-control dtp-date" value="${hrGeneralEmployeeInstance?.dateOfServiceEnd?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='dateOfServiceEnd'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'grossSalary', 'has-error')}'>
            <label class="required"><g:message code="label.hrGeneralEmployee.grossSalary" default="Gross Salary"/></label>
            <g:field type="number" name="grossSalary" class="form-control" value="${hrGeneralEmployeeInstance?.grossSalary}" min="0" max="9999999" step="1.00" required="required"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='grossSalary'/>
        </div>
    </div>

    %{--
    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'departmentJoining', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.departmentJoining" default="Department Joining"/></label>
            <g:select name="departmentJoining" class="form-control many-to-one" from="${org.aalaa.adm.AdmDepartment.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.departmentJoining?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='departmentJoining'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'designationJoining', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.designationJoining" default="Designation Joining"/></label>
            <g:select name="designationJoining" class="form-control many-to-one" from="${org.aalaa.adm.AdmDesignation.list().sort{it.id}}" value="${hrGeneralEmployeeInstance?.designationJoining?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='designationJoining'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrGeneralEmployeeInstance, field: 'grossSalaryJoining', 'has-error')}'>
            <label><g:message code="label.hrGeneralEmployee.grossSalaryJoining" default="Gross Salary Joining"/></label>
            <g:field type="number" name="grossSalaryJoining" class="form-control" value="${fieldValue(bean: hrGeneralEmployeeInstance, field: 'grossSalaryJoining')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${hrGeneralEmployeeInstance}' field='grossSalaryJoining'/>
        </div>
    </div>
    --}%

</fieldset>

<script type="text/javascript">
    const controller = "commonAjax";

    $(document).on("change", "#maritalStatus", function () {
        validateMaritalStatus($(this));
    });

    $(document).on("change", "#admVendorOrganization", function () {
        refreshDepartment($(this));
    });

    $(document).on("change", "#department", function () {
        refreshDesignation($("#admVendorOrganization").val(), $(this));
    });

    $(document).ready(function () {
        validateMaritalStatus($("#maritalStatus"));
    });

    function validateMaritalStatus(d) {
        if(d.val() == "MARRIED" || d.val() == "WIDOWED"){
            $("#nameSpouse, #nameSpouseNative").parent().parent().show();
        }
        else{
            $("#nameSpouse, #nameSpouseNative").parent().parent().hide();
        }
    }

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
</script>
