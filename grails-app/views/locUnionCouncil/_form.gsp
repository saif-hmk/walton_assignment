<!--
 @Created_By : AALAA
 @Date       : 2022.08.06 02:21:44 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group'>
            <label class="required"><g:message code="label.locDistrict.country" default="Country"/></label>
            <g:select name="country" class="form-control many-to-one" from="${org.aalaa.loc.LocCountry.list().sort{it.id}}" value="${locUnionCouncilInstance?.parent?.parent?.parent?.parent?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group'>
            <label class="required"><g:message code="label.locDistrict.division" default="Division"/></label>
            <g:select name="parent" class="form-control many-to-one" from="${org.aalaa.loc.LocDivision.list().sort{it.id}}" value="${locUnionCouncilInstance?.parent?.parent?.parent?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group'>
            <label class="required"><g:message code="label.locSubDistrict.district" default="District"/></label>
            <g:select name="parent" class="form-control many-to-one" from="${org.aalaa.loc.LocDistrict.list().sort{it.id}}" value="${locUnionCouncilInstance?.parent?.parent?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'parent', 'has-error')}'>
            <label class="required"><g:message code="label.locUnionCouncil.parent" default="Parent"/></label>
            <g:select name="parent" class="form-control many-to-one" from="${org.aalaa.loc.LocSubDistrict.list().sort{it.id}}" value="${locUnionCouncilInstance?.parent?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='parent'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'code', 'has-error')} required'>
            <label class='required'><g:message code="label.locUnionCouncil.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${locUnionCouncilInstance?.code}" maxlength="30" required="required"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='code'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'name', 'has-error')} required'>
            <label class='required'><g:message code="label.locUnionCouncil.name" default="Name"/></label>
            <g:textField name="name" class="form-control" value="${locUnionCouncilInstance?.name}" maxlength="60" required="required"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='name'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'nameNative', 'has-error')} required'>
            <label class='required'><g:message code="label.locUnionCouncil.nameNative" default="Name Native"/></label>
            <g:textField name="nameNative" class="form-control" value="${locUnionCouncilInstance?.nameNative}" maxlength="120" required="required"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='nameNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'population', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.population" default="Population"/></label>
            <g:field type="number" name="population" class="form-control" value="${locUnionCouncilInstance?.population}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='population'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'censusYear', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.censusYear" default="Census Year"/></label>
            <g:field type="number" name="censusYear" class="form-control" value="${locUnionCouncilInstance?.censusYear}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='censusYear'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'areaTotalSqMile', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.areaTotalSqMile" default="Area Total Sq Mile"/></label>
            <g:field type="number" name="areaTotalSqMile" class="form-control" value="${fieldValue(bean: locUnionCouncilInstance, field: 'areaTotalSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='areaTotalSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'areaTotalSqKm', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.areaTotalSqKm" default="Area Total Sq Km"/></label>
            <g:field type="number" name="areaTotalSqKm" class="form-control" value="${fieldValue(bean: locUnionCouncilInstance, field: 'areaTotalSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='areaTotalSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'areaLandSqMile', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.areaLandSqMile" default="Area Land Sq Mile"/></label>
            <g:field type="number" name="areaLandSqMile" class="form-control" value="${fieldValue(bean: locUnionCouncilInstance, field: 'areaLandSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='areaLandSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'areaLandSqKm', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.areaLandSqKm" default="Area Land Sq Km"/></label>
            <g:field type="number" name="areaLandSqKm" class="form-control" value="${fieldValue(bean: locUnionCouncilInstance, field: 'areaLandSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='areaLandSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'areaWaterSqMile', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.areaWaterSqMile" default="Area Water Sq Mile"/></label>
            <g:field type="number" name="areaWaterSqMile" class="form-control" value="${fieldValue(bean: locUnionCouncilInstance, field: 'areaWaterSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='areaWaterSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'areaWaterSqKm', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.areaWaterSqKm" default="Area Water Sq Km"/></label>
            <g:field type="number" name="areaWaterSqKm" class="form-control" value="${fieldValue(bean: locUnionCouncilInstance, field: 'areaWaterSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='areaWaterSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'populationDensitySqKm', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.populationDensitySqKm" default="Population Density Sq Km"/></label>
            <g:field type="number" name="populationDensitySqKm" class="form-control" value="${fieldValue(bean: locUnionCouncilInstance, field: 'populationDensitySqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='populationDensitySqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'acquired', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.acquired" default="Acquired"/></label>
            <g:textField name="acquired" class="form-control" value="${locUnionCouncilInstance?.acquired}" maxlength="100"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='acquired'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'establishmentDate', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.establishmentDate" default="Establishment Date"/></label>
            <g:textField name="establishmentDate" class="form-control" value="${locUnionCouncilInstance?.establishmentDate}" maxlength="100"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='establishmentDate'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'isActive', 'has-error')}'>
            <label class='br'><g:message code="label.locUnionCouncil.isActive" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${locUnionCouncilInstance?.isActive}" />
            <g:renderErrors bean='${locUnionCouncilInstance}' field='isActive'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locUnionCouncilInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.locUnionCouncil.remarks" default="Remarks"/></label>
            <g:textField name="remarks" class="form-control" value="${locUnionCouncilInstance?.remarks}"/>
            <g:renderErrors bean='${locUnionCouncilInstance}' field='remarks'/>
        </div>
    </div>

</fieldset>
