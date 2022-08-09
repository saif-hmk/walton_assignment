<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 12:13:31 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: admDesignationInstance, field: 'admVendorOrganization', 'has-error')} required'>
            <label class='required'><g:message code="label.admDesignation.admVendorOrganization" default="Adm Organization"/></label>
            <g:select name="admVendorOrganization" class="form-control many-to-one" from="${org.aalaa.adm.AdmOrganization.list().sort{it.id}}" value="${admDesignationInstance?.admVendorOrganization?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${admDesignationInstance}' field='admVendorOrganization'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: admDesignationInstance, field: 'admDepartment', 'has-error')} required'>
            <label class='required'><g:message code="label.admDesignation.admDepartment" default="Adm Department"/></label>
            <g:select name="admDepartment" class="form-control many-to-one" from="${org.aalaa.adm.AdmDepartment.list().sort{it.id}}" value="${admDesignationInstance?.admDepartment?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${admDesignationInstance}' field='admDepartment'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: admDesignationInstance, field: 'keyword', 'has-error')} required'>
            <label class='required'><g:message code="label.admDesignation.keyword" default="Keyword"/></label>
            <g:textField name="keyword" class="form-control" value="${admDesignationInstance?.keyword}" maxlength="50" required="required"/>
            <g:renderErrors bean='${admDesignationInstance}' field='keyword'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: admDesignationInstance, field: 'sortOrder', 'has-error')}'>
            <label><g:message code="label.admDesignation.sortOrder" default="Sort Order"/></label>
            <g:field type="number" name="sortOrder" class="form-control" value="${admDesignationInstance?.sortOrder}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${admDesignationInstance}' field='sortOrder'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: admDesignationInstance, field: 'title', 'has-error')} required'>
            <label class='required'><g:message code="label.admDesignation.title" default="Title"/></label>
            <g:textField name="title" class="form-control" value="${admDesignationInstance?.title}" maxlength="50" required="required"/>
            <g:renderErrors bean='${admDesignationInstance}' field='title'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: admDesignationInstance, field: 'titleNative', 'has-error')}'>
            <label><g:message code="label.admDesignation.titleNative" default="Title Native"/></label>
            <g:textField name="titleNative" class="form-control" value="${admDesignationInstance?.titleNative}" maxlength="100"/>
            <g:renderErrors bean='${admDesignationInstance}' field='titleNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: admDesignationInstance, field: 'titleShort', 'has-error')}'>
            <label><g:message code="label.admDesignation.titleShort" default="Title Short"/></label>
            <g:textField name="titleShort" class="form-control" value="${admDesignationInstance?.titleShort}" maxlength="50"/>
            <g:renderErrors bean='${admDesignationInstance}' field='titleShort'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: admDesignationInstance, field: 'titleShortNative', 'has-error')}'>
            <label><g:message code="label.admDesignation.titleShortNative" default="Title Short Native"/></label>
            <g:textField name="titleShortNative" class="form-control" value="${admDesignationInstance?.titleShortNative}" maxlength="100"/>
            <g:renderErrors bean='${admDesignationInstance}' field='titleShortNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: admDesignationInstance, field: 'active', 'has-error')}'>
            <label class='br'><g:message code="label.admDesignation.active" default="Active"/></label>
            <g:checkBox class="cb" name="active"  value="${admDesignationInstance?.active}" />
            <g:renderErrors bean='${admDesignationInstance}' field='active'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: admDesignationInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.admDesignation.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${admDesignationInstance?.remarks}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${admDesignationInstance}' field='remarks'/>
        </div>
    </div>

</fieldset>
