<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 12:12:58 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admDepartmentInstance, field: 'admVendorOrganization', 'has-error')} required'>
            <label class='required'><g:message code="label.admDepartment.admVendorOrganization" default="Adm Organization"/></label>
            <g:select name="admVendorOrganization" class="form-control many-to-one" from="${org.aalaa.adm.AdmOrganization.list().sort{it.id}}" value="${admDepartmentInstance?.admVendorOrganization?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${admDepartmentInstance}' field='admVendorOrganization'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admDepartmentInstance, field: 'keyword', 'has-error')} required'>
            <label class='required'><g:message code="label.admDepartment.keyword" default="Keyword"/></label>
            <g:textField name="keyword" class="form-control" value="${admDepartmentInstance?.keyword}" maxlength="50" required="required"/>
            <g:renderErrors bean='${admDepartmentInstance}' field='keyword'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admDepartmentInstance, field: 'title', 'has-error')} required'>
            <label class='required'><g:message code="label.admDepartment.title" default="Title"/></label>
            <g:textField name="title" class="form-control" value="${admDepartmentInstance?.title}" maxlength="50" required="required"/>
            <g:renderErrors bean='${admDepartmentInstance}' field='title'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admDepartmentInstance, field: 'titleNative', 'has-error')}'>
            <label><g:message code="label.admDepartment.titleNative" default="Title Native"/></label>
            <g:textField name="titleNative" class="form-control" value="${admDepartmentInstance?.titleNative}" maxlength="100"/>
            <g:renderErrors bean='${admDepartmentInstance}' field='titleNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admDepartmentInstance, field: 'titleShort', 'has-error')}'>
            <label><g:message code="label.admDepartment.titleShort" default="Title Short"/></label>
            <g:textField name="titleShort" class="form-control" value="${admDepartmentInstance?.titleShort}" maxlength="50"/>
            <g:renderErrors bean='${admDepartmentInstance}' field='titleShort'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admDepartmentInstance, field: 'titleShortNative', 'has-error')}'>
            <label><g:message code="label.admDepartment.titleShortNative" default="Title Short Native"/></label>
            <g:textField name="titleShortNative" class="form-control" value="${admDepartmentInstance?.titleShortNative}" maxlength="100"/>
            <g:renderErrors bean='${admDepartmentInstance}' field='titleShortNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admDepartmentInstance, field: 'sortOrder', 'has-error')}'>
            <label><g:message code="label.admDepartment.sortOrder" default="Sort Order"/></label>
            <g:field type="number" name="sortOrder" class="form-control" value="${admDepartmentInstance?.sortOrder}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${admDepartmentInstance}' field='sortOrder'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admDepartmentInstance, field: 'active', 'has-error')}'>
            <label class='br'><g:message code="label.admDepartment.active" default="Active"/></label>
            <g:checkBox class="cb" name="active"  value="${admDepartmentInstance?.active}" />
            <g:renderErrors bean='${admDepartmentInstance}' field='active'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: admDepartmentInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.admDepartment.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${admDepartmentInstance?.remarks}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${admDepartmentInstance}' field='remarks'/>
        </div>
    </div>

</fieldset>
