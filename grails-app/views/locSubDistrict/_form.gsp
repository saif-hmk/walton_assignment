<!--
 @Created_By : AALAA
 @Date       : 2022.08.06 02:16:30 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group'>
            <label class="required"><g:message code="label.locDistrict.country" default="Country"/></label>
            <g:select name="country" class="form-control many-to-one" from="${org.aalaa.loc.LocCountry.list().sort{it.id}}" value="${locDistrictInstance?.parent?.parent?.parent?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'parent', 'has-error')}'>
            <label class="required"><g:message code="label.locDistrict.division" default="Division"/></label>
            <g:select name="parent" class="form-control many-to-one" from="${org.aalaa.loc.LocDivision.list().sort{it.id}}" value="${locDistrictInstance?.parent?.parent?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'parent', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.district" default="District"/></label>
            <g:select name="parent" class="form-control many-to-one" from="${org.aalaa.loc.LocDistrict.list().sort{it.id}}" value="${locSubDistrictInstance?.parent?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='parent'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'code', 'has-error')} required'>
            <label class='required'><g:message code="label.locSubDistrict.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${locSubDistrictInstance?.code}" maxlength="30" required="required"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='code'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'name', 'has-error')} required'>
            <label class='required'><g:message code="label.locSubDistrict.name" default="Name"/></label>
            <g:textField name="name" class="form-control" value="${locSubDistrictInstance?.name}" maxlength="60" required="required"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='name'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'nameNative', 'has-error')} required'>
            <label class='required'><g:message code="label.locSubDistrict.nameNative" default="Name Native"/></label>
            <g:textField name="nameNative" class="form-control" value="${locSubDistrictInstance?.nameNative}" maxlength="120" required="required"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='nameNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'population', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.population" default="Population"/></label>
            <g:field type="number" name="population" class="form-control" value="${locSubDistrictInstance?.population}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='population'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'censusYear', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.censusYear" default="Census Year"/></label>
            <g:field type="number" name="censusYear" class="form-control" value="${locSubDistrictInstance?.censusYear}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='censusYear'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'areaTotalSqMile', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.areaTotalSqMile" default="Area Total Sq Mile"/></label>
            <g:field type="number" name="areaTotalSqMile" class="form-control" value="${fieldValue(bean: locSubDistrictInstance, field: 'areaTotalSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='areaTotalSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'areaTotalSqKm', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.areaTotalSqKm" default="Area Total Sq Km"/></label>
            <g:field type="number" name="areaTotalSqKm" class="form-control" value="${fieldValue(bean: locSubDistrictInstance, field: 'areaTotalSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='areaTotalSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'areaLandSqMile', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.areaLandSqMile" default="Area Land Sq Mile"/></label>
            <g:field type="number" name="areaLandSqMile" class="form-control" value="${fieldValue(bean: locSubDistrictInstance, field: 'areaLandSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='areaLandSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'areaLandSqKm', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.areaLandSqKm" default="Area Land Sq Km"/></label>
            <g:field type="number" name="areaLandSqKm" class="form-control" value="${fieldValue(bean: locSubDistrictInstance, field: 'areaLandSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='areaLandSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'areaWaterSqMile', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.areaWaterSqMile" default="Area Water Sq Mile"/></label>
            <g:field type="number" name="areaWaterSqMile" class="form-control" value="${fieldValue(bean: locSubDistrictInstance, field: 'areaWaterSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='areaWaterSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'areaWaterSqKm', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.areaWaterSqKm" default="Area Water Sq Km"/></label>
            <g:field type="number" name="areaWaterSqKm" class="form-control" value="${fieldValue(bean: locSubDistrictInstance, field: 'areaWaterSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='areaWaterSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.remarks" default="Remarks"/></label>
            <g:textField name="remarks" class="form-control" value="${locSubDistrictInstance?.remarks}"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='remarks'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'populationDensitySqKm', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.populationDensitySqKm" default="Population Density Sq Km"/></label>
            <g:field type="number" name="populationDensitySqKm" class="form-control" value="${fieldValue(bean: locSubDistrictInstance, field: 'populationDensitySqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='populationDensitySqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'acquired', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.acquired" default="Acquired"/></label>
            <g:textField name="acquired" class="form-control" value="${locSubDistrictInstance?.acquired}" maxlength="100"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='acquired'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'establishmentDate', 'has-error')}'>
            <label><g:message code="label.locSubDistrict.establishmentDate" default="Establishment Date"/></label>
            <g:textField name="establishmentDate" class="form-control" value="${locSubDistrictInstance?.establishmentDate}" maxlength="100"/>
            <g:renderErrors bean='${locSubDistrictInstance}' field='establishmentDate'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locSubDistrictInstance, field: 'isActive', 'has-error')}'>
            <label class='br'><g:message code="label.locSubDistrict.isActive" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${locSubDistrictInstance?.isActive}" />
            <g:renderErrors bean='${locSubDistrictInstance}' field='isActive'/>
        </div>
    </div>

</fieldset>
