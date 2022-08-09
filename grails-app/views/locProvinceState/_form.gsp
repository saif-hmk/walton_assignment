<!--
 @Created_By : AALAA
 @Date       : 2022.07.25 11:27:13 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'locCountry', 'has-error')} required'>
            <label class='required'><g:message code="label.locProvinceState.locCountry" default="Loc Country"/></label>
            <g:select name="locCountry" class="form-control many-to-one" from="${org.aalaa.loc.LocCountry.list().sort{it.id}}" value="${locProvinceStateInstance?.locCountry?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='locCountry'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'code', 'has-error')} required'>
            <label class='required'><g:message code="label.locProvinceState.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${locProvinceStateInstance?.code}" maxlength="30" required="required"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='code'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'codeIso', 'has-error')}'>
            <label><g:message code="label.locProvinceState.codeIso" default="Code Iso"/></label>
            <g:textField name="codeIso" class="form-control" value="${locProvinceStateInstance?.codeIso}" maxlength="6"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='codeIso'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'name', 'has-error')}'>
            <label><g:message code="label.locProvinceState.name" default="Name"/></label>
            <g:textField name="name" class="form-control" value="${locProvinceStateInstance?.name}" maxlength="60"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='name'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'nameNative', 'has-error')} required'>
            <label class='required'><g:message code="label.locProvinceState.nameNative" default="Name Native"/></label>
            <g:textField name="nameNative" class="form-control" value="${locProvinceStateInstance?.nameNative}" maxlength="120" required="required"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='nameNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'areaTotalSqMile', 'has-error')}'>
            <label><g:message code="label.locProvinceState.areaTotalSqMile" default="Area Total Sq Mile"/></label>
            <g:field type="number" name="areaTotalSqMile" class="form-control" value="${fieldValue(bean: locProvinceStateInstance, field: 'areaTotalSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='areaTotalSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'areaTotalSqKm', 'has-error')}'>
            <label><g:message code="label.locProvinceState.areaTotalSqKm" default="Area Total Sq Km"/></label>
            <g:field type="number" name="areaTotalSqKm" class="form-control" value="${fieldValue(bean: locProvinceStateInstance, field: 'areaTotalSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='areaTotalSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'areaLandSqMile', 'has-error')}'>
            <label><g:message code="label.locProvinceState.areaLandSqMile" default="Area Land Sq Mile"/></label>
            <g:field type="number" name="areaLandSqMile" class="form-control" value="${fieldValue(bean: locProvinceStateInstance, field: 'areaLandSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='areaLandSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'areaLandSqKm', 'has-error')}'>
            <label><g:message code="label.locProvinceState.areaLandSqKm" default="Area Land Sq Km"/></label>
            <g:field type="number" name="areaLandSqKm" class="form-control" value="${fieldValue(bean: locProvinceStateInstance, field: 'areaLandSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='areaLandSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'areaWaterSqMile', 'has-error')}'>
            <label><g:message code="label.locProvinceState.areaWaterSqMile" default="Area Water Sq Mile"/></label>
            <g:field type="number" name="areaWaterSqMile" class="form-control" value="${fieldValue(bean: locProvinceStateInstance, field: 'areaWaterSqMile')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='areaWaterSqMile'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'areaWaterSqKm', 'has-error')}'>
            <label><g:message code="label.locProvinceState.areaWaterSqKm" default="Area Water Sq Km"/></label>
            <g:field type="number" name="areaWaterSqKm" class="form-control" value="${fieldValue(bean: locProvinceStateInstance, field: 'areaWaterSqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='areaWaterSqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'populationDensitySqKm', 'has-error')}'>
            <label><g:message code="label.locProvinceState.populationDensitySqKm" default="Population Density Sq Km"/></label>
            <g:field type="number" name="populationDensitySqKm" class="form-control" value="${fieldValue(bean: locProvinceStateInstance, field: 'populationDensitySqKm')}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='populationDensitySqKm'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'population', 'has-error')}'>
            <label><g:message code="label.locProvinceState.population" default="Population"/></label>
            <g:field type="number" name="population" class="form-control" value="${locProvinceStateInstance?.population}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='population'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'censusYear', 'has-error')}'>
            <label><g:message code="label.locProvinceState.censusYear" default="Census Year"/></label>
            <g:field type="number" name="censusYear" class="form-control" value="${locProvinceStateInstance?.censusYear}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='censusYear'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'acquired', 'has-error')}'>
            <label><g:message code="label.locProvinceState.acquired" default="Acquired"/></label>
            <g:textField name="acquired" class="form-control" value="${locProvinceStateInstance?.acquired}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='acquired'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'establishmentDate', 'has-error')}'>
            <label><g:message code="label.locProvinceState.establishmentDate" default="Establishment Date"/></label>
            <g:textField name="establishmentDate" class="form-control" value="${locProvinceStateInstance?.establishmentDate}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='establishmentDate'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'cityCapital', 'has-error')}'>
            <label><g:message code="label.locProvinceState.cityCapital" default="City Capital"/></label>
            <g:textField name="cityCapital" class="form-control" value="${locProvinceStateInstance?.cityCapital}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='cityCapital'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'cityCapitalNative', 'has-error')}'>
            <label><g:message code="label.locProvinceState.cityCapitalNative" default="City Capital Native"/></label>
            <g:textField name="cityCapitalNative" class="form-control" value="${locProvinceStateInstance?.cityCapitalNative}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='cityCapitalNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'cityCapitalPrevious', 'has-error')}'>
            <label><g:message code="label.locProvinceState.cityCapitalPrevious" default="City Capital Previous"/></label>
            <g:textField name="cityCapitalPrevious" class="form-control" value="${locProvinceStateInstance?.cityCapitalPrevious}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='cityCapitalPrevious'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'cityCapitalPreviousNative', 'has-error')}'>
            <label><g:message code="label.locProvinceState.cityCapitalPreviousNative" default="City Capital Previous Native"/></label>
            <g:textField name="cityCapitalPreviousNative" class="form-control" value="${locProvinceStateInstance?.cityCapitalPreviousNative}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='cityCapitalPreviousNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'cityLargest', 'has-error')}'>
            <label><g:message code="label.locProvinceState.cityLargest" default="City Largest"/></label>
            <g:textField name="cityLargest" class="form-control" value="${locProvinceStateInstance?.cityLargest}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='cityLargest'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'cityLargestNative', 'has-error')}'>
            <label><g:message code="label.locProvinceState.cityLargestNative" default="City Largest Native"/></label>
            <g:textField name="cityLargestNative" class="form-control" value="${locProvinceStateInstance?.cityLargestNative}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='cityLargestNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'languageOfficial', 'has-error')}'>
            <label><g:message code="label.locProvinceState.languageOfficial" default="Language Official"/></label>
            <g:textField name="languageOfficial" class="form-control" value="${locProvinceStateInstance?.languageOfficial}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='languageOfficial'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'languageOfficialNative', 'has-error')}'>
            <label><g:message code="label.locProvinceState.languageOfficialNative" default="Language Official Native"/></label>
            <g:textField name="languageOfficialNative" class="form-control" value="${locProvinceStateInstance?.languageOfficialNative}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='languageOfficialNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'languageOfficialAddl', 'has-error')}'>
            <label><g:message code="label.locProvinceState.languageOfficialAddl" default="Language Official Addl"/></label>
            <g:textField name="languageOfficialAddl" class="form-control" value="${locProvinceStateInstance?.languageOfficialAddl}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='languageOfficialAddl'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'languageOfficialAddlNative', 'has-error')}'>
            <label><g:message code="label.locProvinceState.languageOfficialAddlNative" default="Language Official Addl Native"/></label>
            <g:textField name="languageOfficialAddlNative" class="form-control" value="${locProvinceStateInstance?.languageOfficialAddlNative}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='languageOfficialAddlNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'primaryCurrencyName', 'has-error')}'>
            <label><g:message code="label.locProvinceState.primaryCurrencyName" default="Primary Currency Name"/></label>
            <g:textField name="primaryCurrencyName" class="form-control" value="${locProvinceStateInstance?.primaryCurrencyName}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='primaryCurrencyName'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'primaryCurrencyCode', 'has-error')}'>
            <label><g:message code="label.locProvinceState.primaryCurrencyCode" default="Primary Currency Code"/></label>
            <g:textField name="primaryCurrencyCode" class="form-control" value="${locProvinceStateInstance?.primaryCurrencyCode}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='primaryCurrencyCode'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'codeVehicle', 'has-error')}'>
            <label><g:message code="label.locProvinceState.codeVehicle" default="Code Vehicle"/></label>
            <g:textField name="codeVehicle" class="form-control" value="${locProvinceStateInstance?.codeVehicle}" maxlength="10"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='codeVehicle'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'codePostalAbbreviation', 'has-error')}'>
            <label><g:message code="label.locProvinceState.codePostalAbbreviation" default="Code Postal Abbreviation"/></label>
            <g:textField name="codePostalAbbreviation" class="form-control" value="${locProvinceStateInstance?.codePostalAbbreviation}" maxlength="10"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='codePostalAbbreviation'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'zone', 'has-error')}'>
            <label><g:message code="label.locProvinceState.zone" default="Zone"/></label>
            <g:textField name="zone" class="form-control" value="${locProvinceStateInstance?.zone}" maxlength="100"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='zone'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'isActive', 'has-error')}'>
            <label class='br'><g:message code="label.locProvinceState.isActive" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${locProvinceStateInstance?.isActive}" />
            <g:renderErrors bean='${locProvinceStateInstance}' field='isActive'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: locProvinceStateInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.locProvinceState.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${locProvinceStateInstance?.remarks}" rows="2"/>
            <g:renderErrors bean='${locProvinceStateInstance}' field='remarks'/>
        </div>
    </div>

</fieldset>
