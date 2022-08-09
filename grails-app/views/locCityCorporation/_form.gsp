<!--
 @Created_By : AALAA
 @Date       : 2022.07.25 11:29:07 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'isActive', 'has-error')}'>
            <label class='br'><g:message code="label.locCityCorporation.isActive" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${locCityCorporationInstance?.isActive}" />
            <g:renderErrors bean='${locCityCorporationInstance}' field='isActive'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'locAdmAreaType', 'has-error')} required'>
            <label class='required'><g:message code="label.locCityCorporation.locAdmAreaType" default="Loc Adm Area Type"/></label>
            <g:select name="locAdmAreaType" class="form-control" from="${org.aalaa.loc.LocAdmAreaType?.values()}" keys="${org.aalaa.loc.LocAdmAreaType.values()*.name()}" value="${locCityCorporationInstance?.locAdmAreaType?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='locAdmAreaType'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'code', 'has-error')} required'>
            <label class='required'><g:message code="label.locCityCorporation.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${locCityCorporationInstance?.code}" maxlength="30" required="required"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='code'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'name', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.name" default="Name"/></label>
            <g:textField name="name" class="form-control" value="${locCityCorporationInstance?.name}" maxlength="60"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='name'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'nameNative', 'has-error')} required'>
            <label class='required'><g:message code="label.locCityCorporation.nameNative" default="Name Native"/></label>
            <g:textField name="nameNative" class="form-control" value="${locCityCorporationInstance?.nameNative}" maxlength="120" required="required"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='nameNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'parent', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.parent" default="Parent"/></label>
            <g:select name="parent" class="form-control many-to-one" from="${org.aalaa.loc.LocLocation.list().sort{it.id}}" value="${locCityCorporationInstance?.parent?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='parent'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'population', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.population" default="Population"/></label>
            <g:field type="number" name="population" class="form-control" value="${locCityCorporationInstance?.population}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='population'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'censusYear', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.censusYear" default="Census Year"/></label>
            <g:field type="number" name="censusYear" class="form-control" value="${locCityCorporationInstance?.censusYear}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='censusYear'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'areaTotalSqMile', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.areaTotalSqMile" default="Area Total Sq Mile"/></label>
            <g:field type="number" name="areaTotalSqMile" class="form-control" value="${fieldValue(bean: locCityCorporationInstance, field: 'areaTotalSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='areaTotalSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'areaTotalSqKm', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.areaTotalSqKm" default="Area Total Sq Km"/></label>
            <g:field type="number" name="areaTotalSqKm" class="form-control" value="${fieldValue(bean: locCityCorporationInstance, field: 'areaTotalSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='areaTotalSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'areaLandSqMile', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.areaLandSqMile" default="Area Land Sq Mile"/></label>
            <g:field type="number" name="areaLandSqMile" class="form-control" value="${fieldValue(bean: locCityCorporationInstance, field: 'areaLandSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='areaLandSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'areaLandSqKm', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.areaLandSqKm" default="Area Land Sq Km"/></label>
            <g:field type="number" name="areaLandSqKm" class="form-control" value="${fieldValue(bean: locCityCorporationInstance, field: 'areaLandSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='areaLandSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'areaWaterSqMile', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.areaWaterSqMile" default="Area Water Sq Mile"/></label>
            <g:field type="number" name="areaWaterSqMile" class="form-control" value="${fieldValue(bean: locCityCorporationInstance, field: 'areaWaterSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='areaWaterSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'areaWaterSqKm', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.areaWaterSqKm" default="Area Water Sq Km"/></label>
            <g:field type="number" name="areaWaterSqKm" class="form-control" value="${fieldValue(bean: locCityCorporationInstance, field: 'areaWaterSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='areaWaterSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.remarks" default="Remarks"/></label>
            <g:textField name="remarks" class="form-control" value="${locCityCorporationInstance?.remarks}"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='remarks'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'populationDensitySqKm', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.populationDensitySqKm" default="Population Density Sq Km"/></label>
            <g:field type="number" name="populationDensitySqKm" class="form-control" value="${fieldValue(bean: locCityCorporationInstance, field: 'populationDensitySqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='populationDensitySqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'acquired', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.acquired" default="Acquired"/></label>
            <g:textField name="acquired" class="form-control" value="${locCityCorporationInstance?.acquired}" maxlength="100"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='acquired'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locCityCorporationInstance, field: 'establishmentDate', 'has-error')}'>
            <label><g:message code="label.locCityCorporation.establishmentDate" default="Establishment Date"/></label>
            <g:textField name="establishmentDate" class="form-control" value="${locCityCorporationInstance?.establishmentDate}" maxlength="100"/>
            <g:renderErrors bean='${locCityCorporationInstance}' field='establishmentDate'/>
        </div>
    </div>

</fieldset>
