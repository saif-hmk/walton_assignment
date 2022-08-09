<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 08:14:42 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admContentCategoryInstance, field: 'admVendorOrganization', 'has-error')} required'>
            <label class='required'><g:message code="label.admContentCategory.admVendorOrganization" default="Adm Organization"/></label>
            <g:select name="admVendorOrganization" class="form-control many-to-one" from="${org.aalaa.adm.AdmVendorOrganization.list().sort{it.id}}" value="${admContentCategoryInstance?.admVendorOrganization?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${admContentCategoryInstance}' field='admVendorOrganization'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admContentCategoryInstance, field: 'keyword', 'has-error')} required'>
            <label class='required'><g:message code="label.admContentCategory.keyword" default="Keyword"/></label>
            <g:textField name="keyword" class="form-control" value="${admContentCategoryInstance?.keyword}" pattern="${admContentCategoryInstance.constraints.keyword.matches}" maxlength="50" required="required"/>
            <g:renderErrors bean='${admContentCategoryInstance}' field='keyword'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admContentCategoryInstance, field: 'sortOrder', 'has-error')}'>
            <label><g:message code="label.admContentCategory.sortOrder" default="Sort Order"/></label>
            <g:field type="number" name="sortOrder" class="form-control" value="${admContentCategoryInstance?.sortOrder}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${admContentCategoryInstance}' field='sortOrder'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admContentCategoryInstance, field: 'active', 'has-error')}'>
            <label class='br'><g:message code="label.admContentCategory.active" default="Active"/></label>
            <g:checkBox class="cb" name="active"  value="${admContentCategoryInstance?.active}" />
            <g:renderErrors bean='${admContentCategoryInstance}' field='active'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admContentCategoryInstance, field: 'title', 'has-error')} required'>
            <label class='required'><g:message code="label.admContentCategory.title" default="Title"/></label>
            <g:textField name="title" class="form-control" value="${admContentCategoryInstance?.title}" maxlength="50" required="required"/>
            <g:renderErrors bean='${admContentCategoryInstance}' field='title'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admContentCategoryInstance, field: 'titleNative', 'has-error')}'>
            <label><g:message code="label.admContentCategory.titleNative" default="Title Native"/></label>
            <g:textField name="titleNative" class="form-control" value="${admContentCategoryInstance?.titleNative}" maxlength="100"/>
            <g:renderErrors bean='${admContentCategoryInstance}' field='titleNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admContentCategoryInstance, field: 'titleShort', 'has-error')}'>
            <label><g:message code="label.admContentCategory.titleShort" default="Title Short"/></label>
            <g:textField name="titleShort" class="form-control" value="${admContentCategoryInstance?.titleShort}" maxlength="50"/>
            <g:renderErrors bean='${admContentCategoryInstance}' field='titleShort'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: admContentCategoryInstance, field: 'titleShortNative', 'has-error')}'>
            <label><g:message code="label.admContentCategory.titleShortNative" default="Title Short Native"/></label>
            <g:textField name="titleShortNative" class="form-control" value="${admContentCategoryInstance?.titleShortNative}" maxlength="100"/>
            <g:renderErrors bean='${admContentCategoryInstance}' field='titleShortNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: admContentCategoryInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.admContentCategory.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${admContentCategoryInstance?.remarks}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${admContentCategoryInstance}' field='remarks'/>
        </div>
    </div>

</fieldset>
