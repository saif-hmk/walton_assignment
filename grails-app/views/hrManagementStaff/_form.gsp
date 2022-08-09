<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 08:46:26 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'locPermanentDivision', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.locPermanentDivision" default="Loc Permanent Division"/></label>
            <g:select name="locPermanentDivision" class="form-control many-to-one" from="${org.aalaa.loc.LocDivision.list().sort{it.id}}" value="${hrManagementStaffInstance?.locPermanentDivision?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='locPermanentDivision'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'locPresentDivision', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.locPresentDivision" default="Loc Present Division"/></label>
            <g:select name="locPresentDivision" class="form-control many-to-one" from="${org.aalaa.loc.LocDivision.list().sort{it.id}}" value="${hrManagementStaffInstance?.locPresentDivision?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='locPresentDivision'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'locPermanentDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.locPermanentDistrict" default="Loc Permanent District"/></label>
            <g:select name="locPermanentDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocDistrict.list().sort{it.id}}" value="${hrManagementStaffInstance?.locPermanentDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='locPermanentDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'locPresentDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.locPresentDistrict" default="Loc Present District"/></label>
            <g:select name="locPresentDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocDistrict.list().sort{it.id}}" value="${hrManagementStaffInstance?.locPresentDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='locPresentDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'locPermanentSubDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.locPermanentSubDistrict" default="Loc Permanent Sub District"/></label>
            <g:select name="locPermanentSubDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocSubDistrict.list().sort{it.id}}" value="${hrManagementStaffInstance?.locPermanentSubDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='locPermanentSubDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'locPresentSubDistrict', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.locPresentSubDistrict" default="Loc Present Sub District"/></label>
            <g:select name="locPresentSubDistrict" class="form-control many-to-one" from="${org.aalaa.loc.LocSubDistrict.list().sort{it.id}}" value="${hrManagementStaffInstance?.locPresentSubDistrict?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='locPresentSubDistrict'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'department', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.department" default="Department"/></label>
            <g:select name="department" class="form-control many-to-one" from="${org.aalaa.adm.AdmDepartment.list().sort{it.id}}" value="${hrManagementStaffInstance?.department?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='department'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'designation', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.designation" default="Designation"/></label>
            <g:select name="designation" class="form-control many-to-one" from="${org.aalaa.adm.AdmDesignation.list().sort{it.id}}" value="${hrManagementStaffInstance?.designation?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='designation'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'gender', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.gender" default="Gender"/></label>
            <g:select name="gender" class="form-control" from="${org.aalaa.com.Gender?.values()}" keys="${org.aalaa.com.Gender.values()*.name()}" value="${hrManagementStaffInstance?.gender?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='gender'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'honorific', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.honorific" default="Honorific"/></label>
            <g:select name="honorific" class="form-control" from="${org.aalaa.com.Honorific?.values()}" keys="${org.aalaa.com.Honorific.values()*.name()}" value="${hrManagementStaffInstance?.honorific?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='honorific'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'maritalStatus', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.maritalStatus" default="Marital Status"/></label>
            <g:select name="maritalStatus" class="form-control" from="${org.aalaa.com.MaritalStatus?.values()}" keys="${org.aalaa.com.MaritalStatus.values()*.name()}" value="${hrManagementStaffInstance?.maritalStatus?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='maritalStatus'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'religion', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.religion" default="Religion"/></label>
            <g:select name="religion" class="form-control" from="${org.aalaa.com.Religion?.values()}" keys="${org.aalaa.com.Religion.values()*.name()}" value="${hrManagementStaffInstance?.religion?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='religion'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'employeeType', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.employeeType" default="Employee Type"/></label>
            <g:select name="employeeType" class="form-control" from="${org.aalaa.hr.HrEmployeeType?.values()}" keys="${org.aalaa.hr.HrEmployeeType.values()*.name()}" value="${hrManagementStaffInstance?.employeeType?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='employeeType'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'employmentType', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.employmentType" default="Employment Type"/></label>
            <g:select name="employmentType" class="form-control" from="${org.aalaa.hr.HrEmploymentType?.values()}" keys="${org.aalaa.hr.HrEmploymentType.values()*.name()}" value="${hrManagementStaffInstance?.employmentType?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='employmentType'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'serviceStatus', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.serviceStatus" default="Service Status"/></label>
            <g:select name="serviceStatus" class="form-control" from="${org.aalaa.hr.HrServiceStatus?.values()}" keys="${org.aalaa.hr.HrServiceStatus.values()*.name()}" value="${hrManagementStaffInstance?.serviceStatus?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='serviceStatus'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'code', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${hrManagementStaffInstance?.code}" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='code'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameFull', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.nameFull" default="Name Full"/></label>
            <g:textField name="nameFull" class="form-control" value="${hrManagementStaffInstance?.nameFull}" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameFull'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameFullNative', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nameFullNative" default="Name Full Native"/></label>
            <g:textField name="nameFullNative" class="form-control" value="${hrManagementStaffInstance?.nameFullNative}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameFullNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'mobileNoPrimary', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.mobileNoPrimary" default="Mobile No Primary"/></label>
            <g:textField name="mobileNoPrimary" class="form-control" value="${hrManagementStaffInstance?.mobileNoPrimary}" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='mobileNoPrimary'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameFather', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.nameFather" default="Name Father"/></label>
            <g:textField name="nameFather" class="form-control" value="${hrManagementStaffInstance?.nameFather}" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameFather'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameMother', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.nameMother" default="Name Mother"/></label>
            <g:textField name="nameMother" class="form-control" value="${hrManagementStaffInstance?.nameMother}" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameMother'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameNativeFather', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nameNativeFather" default="Name Native Father"/></label>
            <g:textField name="nameNativeFather" class="form-control" value="${hrManagementStaffInstance?.nameNativeFather}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameNativeFather'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameNativeMother', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nameNativeMother" default="Name Native Mother"/></label>
            <g:textField name="nameNativeMother" class="form-control" value="${hrManagementStaffInstance?.nameNativeMother}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameNativeMother'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'locPermanentAddress', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.locPermanentAddress" default="Loc Permanent Address"/></label>
            <g:textField name="locPermanentAddress" class="form-control" value="${hrManagementStaffInstance?.locPermanentAddress}" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='locPermanentAddress'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'locPresentAddress', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.locPresentAddress" default="Loc Present Address"/></label>
            <g:textField name="locPresentAddress" class="form-control" value="${hrManagementStaffInstance?.locPresentAddress}" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='locPresentAddress'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'dateOfBirth', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.dateOfBirth" default="Date Of Birth"/></label>
            <g:textField name="dateOfBirth" class="form-control dtp-date" value="${hrManagementStaffInstance?.dateOfBirth?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='dateOfBirth'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'dateOfServiceStart', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.dateOfServiceStart" default="Date Of Service Start"/></label>
            <g:textField name="dateOfServiceStart" class="form-control dtp-date" value="${hrManagementStaffInstance?.dateOfServiceStart?.format(grailsApplication.config.format.dtp.date)}" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='dateOfServiceStart'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'locPermanentUnionCouncil', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.locPermanentUnionCouncil" default="Loc Permanent Union Council"/></label>
            <g:select name="locPermanentUnionCouncil" class="form-control many-to-one" from="${org.aalaa.loc.LocUnionCouncil.list().sort{it.id}}" value="${hrManagementStaffInstance?.locPermanentUnionCouncil?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='locPermanentUnionCouncil'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'locPresentUnionCouncil', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.locPresentUnionCouncil" default="Loc Present Union Council"/></label>
            <g:select name="locPresentUnionCouncil" class="form-control many-to-one" from="${org.aalaa.loc.LocUnionCouncil.list().sort{it.id}}" value="${hrManagementStaffInstance?.locPresentUnionCouncil?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='locPresentUnionCouncil'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'departmentJoining', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.departmentJoining" default="Department Joining"/></label>
            <g:select name="departmentJoining" class="form-control many-to-one" from="${org.aalaa.adm.AdmDepartment.list().sort{it.id}}" value="${hrManagementStaffInstance?.departmentJoining?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='departmentJoining'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'designationJoining', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.designationJoining" default="Designation Joining"/></label>
            <g:select name="designationJoining" class="form-control many-to-one" from="${org.aalaa.adm.AdmDesignation.list().sort{it.id}}" value="${hrManagementStaffInstance?.designationJoining?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='designationJoining'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'bloodGroup', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.bloodGroup" default="Blood Group"/></label>
            <g:select name="bloodGroup" class="form-control" from="${org.aalaa.com.BloodGroup?.values()}" keys="${org.aalaa.com.BloodGroup.values()*.name()}" value="${hrManagementStaffInstance?.bloodGroup?.name()}"  noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='bloodGroup'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'mobileNoSecondary', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.mobileNoSecondary" default="Mobile No Secondary"/></label>
            <g:textField name="mobileNoSecondary" class="form-control" value="${hrManagementStaffInstance?.mobileNoSecondary}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='mobileNoSecondary'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'email', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.email" default="Email"/></label>
            <g:textField name="email" class="form-control" value="${hrManagementStaffInstance?.email}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='email'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nid', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nid" default="Nid"/></label>
            <g:textField name="nid" class="form-control" value="${hrManagementStaffInstance?.nid}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nid'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'bid', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.bid" default="Bid"/></label>
            <g:textField name="bid" class="form-control" value="${hrManagementStaffInstance?.bid}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='bid'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'grossSalary', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.grossSalary" default="Gross Salary"/></label>
            <g:field type="number" name="grossSalary" class="form-control" value="${fieldValue(bean: hrManagementStaffInstance, field: 'grossSalary')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='grossSalary'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'grossSalaryJoining', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.grossSalaryJoining" default="Gross Salary Joining"/></label>
            <g:field type="number" name="grossSalaryJoining" class="form-control" value="${fieldValue(bean: hrManagementStaffInstance, field: 'grossSalaryJoining')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='grossSalaryJoining'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'dateOfDeath', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.dateOfDeath" default="Date Of Death"/></label>
            <g:textField name="dateOfDeath" class="form-control dtp-date" value="${hrManagementStaffInstance?.dateOfDeath?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='dateOfDeath'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'dateOfServiceEnd', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.dateOfServiceEnd" default="Date Of Service End"/></label>
            <g:textField name="dateOfServiceEnd" class="form-control dtp-date" value="${hrManagementStaffInstance?.dateOfServiceEnd?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='dateOfServiceEnd'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'emergencyContactNo', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.emergencyContactNo" default="Emergency Contact No"/></label>
            <g:textField name="emergencyContactNo" class="form-control" value="${hrManagementStaffInstance?.emergencyContactNo}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='emergencyContactNo'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'emergencyContactPerson', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.emergencyContactPerson" default="Emergency Contact Person"/></label>
            <g:textField name="emergencyContactPerson" class="form-control" value="${hrManagementStaffInstance?.emergencyContactPerson}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='emergencyContactPerson'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'emergencyContactRelation', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.emergencyContactRelation" default="Emergency Contact Relation"/></label>
            <g:select name="emergencyContactRelation" class="form-control" from="${org.aalaa.com.Relation?.values()}" keys="${org.aalaa.com.Relation.values()*.name()}" value="${hrManagementStaffInstance?.emergencyContactRelation?.name()}"  noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='emergencyContactRelation'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameFirst', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nameFirst" default="Name First"/></label>
            <g:textField name="nameFirst" class="form-control" value="${hrManagementStaffInstance?.nameFirst}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameFirst'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameFirstNative', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nameFirstNative" default="Name First Native"/></label>
            <g:textField name="nameFirstNative" class="form-control" value="${hrManagementStaffInstance?.nameFirstNative}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameFirstNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameMiddle', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nameMiddle" default="Name Middle"/></label>
            <g:textField name="nameMiddle" class="form-control" value="${hrManagementStaffInstance?.nameMiddle}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameMiddle'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameLastSur', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nameLastSur" default="Name Last Sur"/></label>
            <g:textField name="nameLastSur" class="form-control" value="${hrManagementStaffInstance?.nameLastSur}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameLastSur'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameMiddleNative', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nameMiddleNative" default="Name Middle Native"/></label>
            <g:textField name="nameMiddleNative" class="form-control" value="${hrManagementStaffInstance?.nameMiddleNative}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameMiddleNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameLastSurNative', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nameLastSurNative" default="Name Last Sur Native"/></label>
            <g:textField name="nameLastSurNative" class="form-control" value="${hrManagementStaffInstance?.nameLastSurNative}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameLastSurNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'passportNo', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.passportNo" default="Passport No"/></label>
            <g:textField name="passportNo" class="form-control" value="${hrManagementStaffInstance?.passportNo}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='passportNo'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'passportExpireDate', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.passportExpireDate" default="Passport Expire Date"/></label>
            <g:textField name="passportExpireDate" class="form-control dtp-date" value="${hrManagementStaffInstance?.passportExpireDate?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='passportExpireDate'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameSpouse', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nameSpouse" default="Name Spouse"/></label>
            <g:textField name="nameSpouse" class="form-control" value="${hrManagementStaffInstance?.nameSpouse}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameSpouse'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'nameSpouseNative', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.nameSpouseNative" default="Name Spouse Native"/></label>
            <g:textField name="nameSpouseNative" class="form-control" value="${hrManagementStaffInstance?.nameSpouseNative}"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='nameSpouseNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'familyMemberTotal', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.familyMemberTotal" default="Family Member Total"/></label>
            <g:field type="number" name="familyMemberTotal" class="form-control" value="${hrManagementStaffInstance?.familyMemberTotal}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='familyMemberTotal'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'familyMemberDependent', 'has-error')}'>
            <label><g:message code="label.hrManagementStaff.familyMemberDependent" default="Family Member Dependent"/></label>
            <g:field type="number" name="familyMemberDependent" class="form-control" value="${hrManagementStaffInstance?.familyMemberDependent}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='familyMemberDependent'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrManagementStaffInstance, field: 'admVendorOrganization', 'has-error')} required'>
            <label class='required'><g:message code="label.hrManagementStaff.admVendorOrganization" default="Adm Organization"/></label>
            <g:select name="admVendorOrganization" class="form-control many-to-one" from="${org.aalaa.adm.AdmOrganization.list().sort{it.id}}" value="${hrManagementStaffInstance?.admVendorOrganization?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${hrManagementStaffInstance}' field='admVendorOrganization'/>
        </div>
    </div>

</fieldset>
