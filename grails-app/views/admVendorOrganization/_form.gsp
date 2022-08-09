<!--
 @Created_By : AALAA
 @Date       : 2022.07.26 09:58:12 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'code', 'has-error')} required'>
            <label class='required'><g:message code="label.admVendorOrganization.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${admVendorOrganizationInstance?.code}" maxlength="20" required="required"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='code'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'title', 'has-error')} required'>
            <label class='required'><g:message code="label.admVendorOrganization.title" default="Title"/></label>
            <g:textField name="title" class="form-control" value="${admVendorOrganizationInstance?.title}" maxlength="100" required="required"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='title'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'titleNative', 'has-error')} required'>
            <label class='required'><g:message code="label.admVendorOrganization.titleNative" default="Title Native"/></label>
            <g:textField name="titleNative" class="form-control" value="${admVendorOrganizationInstance?.titleNative}" maxlength="200" required="required"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='titleNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'weight', 'has-error')} required'>
            <label class='required'><g:message code="label.admVendorOrganization.weight" default="Weight"/></label>
            <g:field type="number" name="weight" class="form-control" value="${admVendorOrganizationInstance?.weight}" min="1" max="999" step="1.00" required="required"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='weight'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'titleShort', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.titleShort" default="Title Short"/></label>
            <g:textField name="titleShort" class="form-control" value="${admVendorOrganizationInstance?.titleShort}" maxlength="30"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='titleShort'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'titleShortNative', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.titleShortNative" default="Title Short Native"/></label>
            <g:textField name="titleShortNative" class="form-control" value="${admVendorOrganizationInstance?.titleShortNative}" maxlength="60"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='titleShortNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'contactPersonName', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.contactPersonName" default="Contact Person Name"/></label>
            <g:textField name="contactPersonName" class="form-control" value="${admVendorOrganizationInstance?.contactPersonName}"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='contactPersonName'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'contactPersonPhone', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.contactPersonPhone" default="Contact Person Phone"/></label>
            <g:textField name="contactPersonPhone" class="form-control" value="${admVendorOrganizationInstance?.contactPersonPhone}"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='contactPersonPhone'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'logoPath', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.logoPath" default="Logo Path"/></label>
            <g:textField name="logoPath" class="form-control" value="${admVendorOrganizationInstance?.logoPath}"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='logoPath'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'slogan', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.slogan" default="Slogan"/></label>
            <g:textField name="slogan" class="form-control" value="${admVendorOrganizationInstance?.slogan}"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='slogan'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'establishmentDate', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.establishmentDate" default="Establishment Date"/></label>
            <g:textField name="establishmentDate" class="form-control dtp-date" value="${admVendorOrganizationInstance?.establishmentDate?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='establishmentDate'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'organizationPhone', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.organizationPhone" default="Organization Phone"/></label>
            <g:textField name="organizationPhone" class="form-control" value="${admVendorOrganizationInstance?.organizationPhone}"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='organizationPhone'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'originCountry', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.originCountry" default="Origin Country"/></label>
            <g:textField name="originCountry" class="form-control" value="${admVendorOrganizationInstance?.originCountry}"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='originCountry'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'organizationWebsite', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.organizationWebsite" default="Organization Website"/></label>
            <g:field type="url" name="organizationWebsite" class="form-control" value="${admVendorOrganizationInstance?.organizationWebsite}" pattern="http?://.+" title="Include http?://" placeholder="Include http?://"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='organizationWebsite'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'organizationEmail', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.organizationEmail" default="Organization Email"/></label>
            <g:field type="email" name="organizationEmail" class="form-control" value="${admVendorOrganizationInstance?.organizationEmail}" placeholder="someone@example.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}\$" title="someone@example.com"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='organizationEmail'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'contactPersonEmail', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.contactPersonEmail" default="Contact Person Email"/></label>
            <g:field type="email" name="contactPersonEmail" class="form-control" value="${admVendorOrganizationInstance?.contactPersonEmail}" placeholder="someone@example.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}\$" title="someone@example.com"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='contactPersonEmail'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'chairPersonName', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.chairPersonName" default="Chair Person Name"/></label>
            <g:textField name="chairPersonName" class="form-control" value="${admVendorOrganizationInstance?.chairPersonName}" maxlength="35"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='chairPersonName'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'sortOrder', 'has-error')} required'>
            <label class='required'><g:message code="label.admVendorOrganization.sortOrder" default="Sort Order"/></label>
            <g:field type="number" name="sortOrder" class="form-control" value="${admVendorOrganizationInstance?.sortOrder}" min="0" max="9999999" step="1.00" required="required"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='sortOrder'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'active', 'has-error')}'>
            <label class='br'><g:message code="label.admVendorOrganization.active" default="Active"/></label>
            <g:checkBox class="cb" name="active"  value="${admVendorOrganizationInstance?.active}" />
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='active'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.admVendorOrganization.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${admVendorOrganizationInstance?.remarks}" rows="2" cols="40" maxlength="500"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='remarks'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'address', 'has-error')} required'>
            <label class='required'><g:message code="label.admVendorOrganization.address" default="Address"/></label>
            <g:textArea name="address" class="form-control" value="${admVendorOrganizationInstance?.address}" rows="2" cols="40" maxlength="255" required="required"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='address'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-6 col-lg-6'>
        <div class='form-group ${hasErrors(bean: admVendorOrganizationInstance, field: 'addressNative', 'has-error')} required'>
            <label class='required'><g:message code="label.admVendorOrganization.addressNative" default="Address Native"/></label>
            <g:textArea name="addressNative" class="form-control" value="${admVendorOrganizationInstance?.addressNative}" rows="2" cols="40" maxlength="500" required="required"/>
            <g:renderErrors bean='${admVendorOrganizationInstance}' field='addressNative'/>
        </div>
    </div>

</fieldset>
