<!--
 @Created_By : AALAA
 @Date       : 2022.07.25 11:28:11 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'parent', 'has-error')}'>
            <label class="required"><g:message code="label.locDivision.country" default="Country"/></label>
            <g:select name="parent" class="form-control many-to-one" from="${org.aalaa.loc.LocCountry.list().sort{it.id}}" value="${locDivisionInstance?.parent?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${locDivisionInstance}' field='parent'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'code', 'has-error')} required'>
            <label class='required'><g:message code="label.locDivision.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${locDivisionInstance?.code}" maxlength="30" required="required"/>
            <g:renderErrors bean='${locDivisionInstance}' field='code'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'name', 'has-error')}'>
            <label class="required"><g:message code="label.locDivision.name" default="Name"/></label>
            <g:textField name="name" class="form-control" value="${locDivisionInstance?.name}" maxlength="60" required="required"/>
            <g:renderErrors bean='${locDivisionInstance}' field='name'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'nameNative', 'has-error')} required'>
            <label class='required'><g:message code="label.locDivision.nameNative" default="Name Native"/></label>
            <g:textField name="nameNative" class="form-control" value="${locDivisionInstance?.nameNative}" maxlength="120" required="required"/>
            <g:renderErrors bean='${locDivisionInstance}' field='nameNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'areaLandSqMile', 'has-error')}'>
            <label><g:message code="label.locDivision.areaLandSqMile" default="Area Land Sq Mile"/></label>
            <g:field type="number" name="areaLandSqMile" class="form-control" value="${fieldValue(bean: locDivisionInstance, field: 'areaLandSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDivisionInstance}' field='areaLandSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'areaLandSqKm', 'has-error')}'>
            <label><g:message code="label.locDivision.areaLandSqKm" default="Area Land Sq Km"/></label>
            <g:field type="number" name="areaLandSqKm" class="form-control" value="${fieldValue(bean: locDivisionInstance, field: 'areaLandSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDivisionInstance}' field='areaLandSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'areaWaterSqMile', 'has-error')}'>
            <label><g:message code="label.locDivision.areaWaterSqMile" default="Area Water Sq Mile"/></label>
            <g:field type="number" name="areaWaterSqMile" class="form-control" value="${fieldValue(bean: locDivisionInstance, field: 'areaWaterSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDivisionInstance}' field='areaWaterSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'areaWaterSqKm', 'has-error')}'>
            <label><g:message code="label.locDivision.areaWaterSqKm" default="Area Water Sq Km"/></label>
            <g:field type="number" name="areaWaterSqKm" class="form-control" value="${fieldValue(bean: locDivisionInstance, field: 'areaWaterSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDivisionInstance}' field='areaWaterSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'areaTotalSqMile', 'has-error')}'>
            <label><g:message code="label.locDivision.areaTotalSqMile" default="Area Total Sq Mile"/></label>
            <g:field type="number" name="areaTotalSqMile" class="form-control" value="${fieldValue(bean: locDivisionInstance, field: 'areaTotalSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDivisionInstance}' field='areaTotalSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'areaTotalSqKm', 'has-error')}'>
            <label><g:message code="label.locDivision.areaTotalSqKm" default="Area Total Sq Km"/></label>
            <g:field type="number" name="areaTotalSqKm" class="form-control" value="${fieldValue(bean: locDivisionInstance, field: 'areaTotalSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDivisionInstance}' field='areaTotalSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'acquired', 'has-error')}'>
            <label><g:message code="label.locDivision.acquired" default="Acquired"/></label>
            <g:textField name="acquired" class="form-control" value="${locDivisionInstance?.acquired}" maxlength="100"/>
            <g:renderErrors bean='${locDivisionInstance}' field='acquired'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'establishmentDate', 'has-error')}'>
            <label><g:message code="label.locDivision.establishmentDate" default="Establishment Date"/></label>
            <g:textField name="establishmentDate" class="form-control" value="${locDivisionInstance?.establishmentDate}" maxlength="100"/>
            <g:renderErrors bean='${locDivisionInstance}' field='establishmentDate'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'population', 'has-error')}'>
            <label><g:message code="label.locDivision.population" default="Population"/></label>
            <g:field type="number" name="population" class="form-control" value="${locDivisionInstance?.population}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDivisionInstance}' field='population'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'populationDensitySqKm', 'has-error')}'>
            <label><g:message code="label.locDivision.populationDensitySqKm" default="Population Density Sq Km"/></label>
            <g:field type="number" name="populationDensitySqKm" class="form-control" value="${fieldValue(bean: locDivisionInstance, field: 'populationDensitySqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDivisionInstance}' field='populationDensitySqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'censusYear', 'has-error')}'>
            <label><g:message code="label.locDivision.censusYear" default="Census Year"/></label>
            <g:field type="number" name="censusYear" class="form-control" value="${locDivisionInstance?.censusYear}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locDivisionInstance}' field='censusYear'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'isActive', 'has-error')}'>
            <label class='br'><g:message code="label.locDivision.isActive" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${locDivisionInstance?.isActive}" />
            <g:renderErrors bean='${locDivisionInstance}' field='isActive'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: locDivisionInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.locDivision.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${locDivisionInstance?.remarks}" rows="2"/>
            <g:renderErrors bean='${locDivisionInstance}' field='remarks'/>
        </div>
    </div>

</fieldset>
