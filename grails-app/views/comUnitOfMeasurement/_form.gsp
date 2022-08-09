<!--
 @Created_By : AALAA
 @Date       : 2022.07.22 10:47:48 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementInstance, field: 'measurementCategory', 'has-error')} required'>
            <label class='required'><g:message code="label.comUnitOfMeasurement.measurementCategory" default="Measurement Category"/></label>
            <g:select name="measurementCategory" class="form-control many-to-one" from="${org.aalaa.com.ComUnitOfMeasurementCategory.list().sort{it.id}}" value="${comUnitOfMeasurementInstance?.measurementCategory?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${comUnitOfMeasurementInstance}' field='measurementCategory'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementInstance, field: 'keyword', 'has-error')} required'>
            <label class='required'><g:message code="label.comUnitOfMeasurement.keyword" default="Keyword"/></label>
            <g:textField name="keyword" class="form-control" value="${comUnitOfMeasurementInstance?.keyword}" maxlength="50" required="required"/>
            <g:renderErrors bean='${comUnitOfMeasurementInstance}' field='keyword'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementInstance, field: 'symbol', 'has-error')}'>
            <label><g:message code="label.comUnitOfMeasurement.symbol" default="Symbol"/></label>
            <g:textField name="symbol" class="form-control" value="${comUnitOfMeasurementInstance?.symbol}" maxlength="50"/>
            <g:renderErrors bean='${comUnitOfMeasurementInstance}' field='symbol'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementInstance, field: 'distance', 'has-error')}'>
            <label><g:message code="label.comUnitOfMeasurement.distance" default="Distance"/></label>
            <g:textField name="distance" class="form-control" value="${comUnitOfMeasurementInstance?.distance}" maxlength="100"/>
            <g:renderErrors bean='${comUnitOfMeasurementInstance}' field='distance'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementInstance, field: 'title', 'has-error')} required'>
            <label class='required'><g:message code="label.comUnitOfMeasurement.title" default="Title"/></label>
            <g:textField name="title" class="form-control" value="${comUnitOfMeasurementInstance?.title}" maxlength="50" required="required"/>
            <g:renderErrors bean='${comUnitOfMeasurementInstance}' field='title'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementInstance, field: 'titleNative', 'has-error')}'>
            <label><g:message code="label.comUnitOfMeasurement.titleNative" default="Title (BN)"/></label>
            <g:textField name="titleNative" class="form-control" value="${comUnitOfMeasurementInstance?.titleNative}" maxlength="100"/>
            <g:renderErrors bean='${comUnitOfMeasurementInstance}' field='titleNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementInstance, field: 'titleShort', 'has-error')} required'>
            <label><g:message code="label.comUnitOfMeasurement.titleShort" default="Title Short"/></label>
            <g:textField name="titleShort" class="form-control" value="${comUnitOfMeasurementInstance?.titleShort}" maxlength="50"/>
            <g:renderErrors bean='${comUnitOfMeasurementInstance}' field='titleShort'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementInstance, field: 'titleShortNative', 'has-error')}'>
            <label><g:message code="label.comUnitOfMeasurement.titleShortNative" default="Title Short (BN)"/></label>
            <g:textField name="titleShortNative" class="form-control" value="${comUnitOfMeasurementInstance?.titleShortNative}" maxlength="100"/>
            <g:renderErrors bean='${comUnitOfMeasurementInstance}' field='titleShortNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementInstance, field: 'sortOrder', 'has-error')}'>
            <label><g:message code="label.comUnitOfMeasurement.sortOrder" default="Sort Order"/></label>
            <g:field type="number" name="sortOrder" class="form-control" value="${comUnitOfMeasurementInstance?.sortOrder}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${comUnitOfMeasurementInstance}' field='sortOrder'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementInstance, field: 'active', 'has-error')}'>
            <label class='br'><g:message code="label.comUnitOfMeasurement.active" default="Active"/></label>
            <g:checkBox class="cb" name="active"  value="${comUnitOfMeasurementInstance?.active}" />
            <g:renderErrors bean='${comUnitOfMeasurementInstance}' field='active'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: comUnitOfMeasurementInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.comUnitOfMeasurement.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${comUnitOfMeasurementInstance?.remarks}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${comUnitOfMeasurementInstance}' field='remarks'/>
        </div>
    </div>

</fieldset>
