<%@ page import="org.aalaa.com.ComUnitOfMeasurement" %>
<!--
 @Created_By : AALAA
 @Date       : 2022.07.22 08:42:26 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementCategoryInstance, field: 'keyword', 'has-error')} required'>
            <label class='required'><g:message code="label.comUnitOfMeasurementCategory.keyword" default="Keyword"/></label>
            <g:textField name="keyword" class="form-control" value="${comUnitOfMeasurementCategoryInstance?.keyword}" maxlength="50" required="required"/>
            <g:renderErrors bean='${comUnitOfMeasurementCategoryInstance}' field='keyword'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementCategoryInstance, field: 'title', 'has-error')} required'>
            <label class='required'><g:message code="label.comUnitOfMeasurementCategory.title" default="Title"/></label>
            <g:textField name="title" class="form-control" value="${comUnitOfMeasurementCategoryInstance?.title}" maxlength="50" required="required"/>
            <g:renderErrors bean='${comUnitOfMeasurementCategoryInstance}' field='title'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementCategoryInstance, field: 'titleNative', 'has-error')}'>
            <label><g:message code="label.comUnitOfMeasurementCategory.titleNative" default="Title Native"/></label>
            <g:textField name="titleNative" class="form-control" value="${comUnitOfMeasurementCategoryInstance?.titleNative}" maxlength="100"/>
            <g:renderErrors bean='${comUnitOfMeasurementCategoryInstance}' field='titleNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementCategoryInstance, field: 'titleShort', 'has-error')}'>
            <label><g:message code="label.comUnitOfMeasurementCategory.titleShort" default="Title Short"/></label>
            <g:textField name="titleShort" class="form-control" value="${comUnitOfMeasurementCategoryInstance?.titleShort}" maxlength="50"/>
            <g:renderErrors bean='${comUnitOfMeasurementCategoryInstance}' field='titleShort'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementCategoryInstance, field: 'titleShortNative', 'has-error')}'>
            <label><g:message code="label.comUnitOfMeasurementCategory.titleShortNative" default="Title Short Native"/></label>
            <g:textField name="titleShortNative" class="form-control" value="${comUnitOfMeasurementCategoryInstance?.titleShortNative}" maxlength="100"/>
            <g:renderErrors bean='${comUnitOfMeasurementCategoryInstance}' field='titleShortNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementCategoryInstance, field: 'sortOrder', 'has-error')}'>
            <label><g:message code="label.comUnitOfMeasurementCategory.sortOrder" default="Sort Order"/></label>
            <g:field type="number" name="sortOrder" class="form-control" value="${comUnitOfMeasurementCategoryInstance?.sortOrder}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${comUnitOfMeasurementCategoryInstance}' field='sortOrder'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementCategoryInstance, field: 'active', 'has-error')}'>
            <label class='br'><g:message code="label.comUnitOfMeasurementCategory.active" default="Active"/></label>
            <g:checkBox class="cb" name="active"  value="${comUnitOfMeasurementCategoryInstance?.active}" />
            <g:renderErrors bean='${comUnitOfMeasurementCategoryInstance}' field='active'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementCategoryInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.comUnitOfMeasurementCategory.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${comUnitOfMeasurementCategoryInstance?.remarks}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${comUnitOfMeasurementCategoryInstance}' field='remarks'/>
        </div>
    </div>

</fieldset>
