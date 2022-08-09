<!--
 @Created_By : AALAA
 @Date       : 2022.07.25 11:30:00 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group'>
            <label class="required"><g:message code="label.locDistrict.country" default="Country"/></label>
            <g:select name="country" class="form-control many-to-one" from="${org.aalaa.loc.LocCountry.list().sort{it.id}}" value="${locDistrictInstance?.parent?.parent?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'parent', 'has-error')}'>
            <label class="required"><g:message code="label.locDistrict.division" default="Division"/></label>
            <g:select name="parent" class="form-control many-to-one" from="${org.aalaa.loc.LocDivision.list().sort{it.id}}" value="${locDistrictInstance?.parent?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${locDistrictInstance}' field='parent'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'code', 'has-error')} required'>
            <label class='required'><g:message code="label.locDistrict.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${locDistrictInstance?.code}" maxlength="30" required="required"/>
            <g:renderErrors bean='${locDistrictInstance}' field='code'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'name', 'has-error')}'>
            <label class="required"><g:message code="label.locDistrict.name" default="Name"/></label>
            <g:textField name="name" class="form-control" value="${locDistrictInstance?.name}" maxlength="60" required="required"/>
            <g:renderErrors bean='${locDistrictInstance}' field='name'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'nameNative', 'has-error')} required'>
            <label class='required'><g:message code="label.locDistrict.nameNative" default="Name Native"/></label>
            <g:textField name="nameNative" class="form-control" value="${locDistrictInstance?.nameNative}" maxlength="120" required="required"/>
            <g:renderErrors bean='${locDistrictInstance}' field='nameNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'population', 'has-error')}'>
            <label><g:message code="label.locDistrict.population" default="Population"/></label>
            <g:field type="number" name="population" class="form-control" value="${locDistrictInstance?.population}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDistrictInstance}' field='population'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'censusYear', 'has-error')}'>
            <label><g:message code="label.locDistrict.censusYear" default="Census Year"/></label>
            <g:field type="number" name="censusYear" class="form-control" value="${locDistrictInstance?.censusYear}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDistrictInstance}' field='censusYear'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'areaTotalSqMile', 'has-error')}'>
            <label><g:message code="label.locDistrict.areaTotalSqMile" default="Area Total Sq Mile"/></label>
            <g:field type="number" name="areaTotalSqMile" class="form-control" value="${fieldValue(bean: locDistrictInstance, field: 'areaTotalSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDistrictInstance}' field='areaTotalSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'areaTotalSqKm', 'has-error')}'>
            <label><g:message code="label.locDistrict.areaTotalSqKm" default="Area Total Sq Km"/></label>
            <g:field type="number" name="areaTotalSqKm" class="form-control" value="${fieldValue(bean: locDistrictInstance, field: 'areaTotalSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDistrictInstance}' field='areaTotalSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'areaLandSqMile', 'has-error')}'>
            <label><g:message code="label.locDistrict.areaLandSqMile" default="Area Land Sq Mile"/></label>
            <g:field type="number" name="areaLandSqMile" class="form-control" value="${fieldValue(bean: locDistrictInstance, field: 'areaLandSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDistrictInstance}' field='areaLandSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'areaLandSqKm', 'has-error')}'>
            <label><g:message code="label.locDistrict.areaLandSqKm" default="Area Land Sq Km"/></label>
            <g:field type="number" name="areaLandSqKm" class="form-control" value="${fieldValue(bean: locDistrictInstance, field: 'areaLandSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDistrictInstance}' field='areaLandSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'areaWaterSqMile', 'has-error')}'>
            <label><g:message code="label.locDistrict.areaWaterSqMile" default="Area Water Sq Mile"/></label>
            <g:field type="number" name="areaWaterSqMile" class="form-control" value="${fieldValue(bean: locDistrictInstance, field: 'areaWaterSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDistrictInstance}' field='areaWaterSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'areaWaterSqKm', 'has-error')}'>
            <label><g:message code="label.locDistrict.areaWaterSqKm" default="Area Water Sq Km"/></label>
            <g:field type="number" name="areaWaterSqKm" class="form-control" value="${fieldValue(bean: locDistrictInstance, field: 'areaWaterSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDistrictInstance}' field='areaWaterSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.locDistrict.remarks" default="Remarks"/></label>
            <g:textField name="remarks" class="form-control" value="${locDistrictInstance?.remarks}"/>
            <g:renderErrors bean='${locDistrictInstance}' field='remarks'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'populationDensitySqKm', 'has-error')}'>
            <label><g:message code="label.locDistrict.populationDensitySqKm" default="Population Density Sq Km"/></label>
            <g:field type="number" name="populationDensitySqKm" class="form-control" value="${fieldValue(bean: locDistrictInstance, field: 'populationDensitySqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDistrictInstance}' field='populationDensitySqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'acquired', 'has-error')}'>
            <label><g:message code="label.locDistrict.acquired" default="Acquired"/></label>
            <g:textField name="acquired" class="form-control" value="${locDistrictInstance?.acquired}" maxlength="100"/>
            <g:renderErrors bean='${locDistrictInstance}' field='acquired'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'establishmentDate', 'has-error')}'>
            <label><g:message code="label.locDistrict.establishmentDate" default="Establishment Date"/></label>
            <g:textField name="establishmentDate" class="form-control" value="${locDistrictInstance?.establishmentDate}" maxlength="100"/>
            <g:renderErrors bean='${locDistrictInstance}' field='establishmentDate'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDistrictInstance, field: 'isActive', 'has-error')}'>
            <label class='br'><g:message code="label.locDistrict.isActive" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${locDistrictInstance?.isActive}" />
            <g:renderErrors bean='${locDistrictInstance}' field='isActive'/>
        </div>
    </div>

</fieldset>
