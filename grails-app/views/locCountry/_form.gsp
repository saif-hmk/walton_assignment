<!--
 @Created_By : AALAA
 @Date       : 2022.07.25 11:25:53 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>
    <fieldset>
        <legend>General Information</legend>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'code', 'has-error')} required'>
                <label class='required'><g:message code="label.locCountry.code" default="Code"/></label>
                <g:textField name="code" class="form-control" value="${locCountryInstance?.code}" maxlength="30" required="required"/>
                <g:renderErrors bean='${locCountryInstance}' field='code'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'codeIso', 'has-error')}'>
                <label><g:message code="label.locCountry.codeIso" default="Code Iso"/></label>
                <g:textField name="codeIso" class="form-control" value="${locCountryInstance?.codeIso}" maxlength="6"/>
                <g:renderErrors bean='${locCountryInstance}' field='codeIso'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'name', 'has-error')}'>
                <label><g:message code="label.locCountry.name" default="Name"/></label>
                <g:textField name="name" class="form-control" value="${locCountryInstance?.name}" maxlength="60"/>
                <g:renderErrors bean='${locCountryInstance}' field='name'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'nameNative', 'has-error')} required'>
                <label class='required'><g:message code="label.locCountry.nameNative" default="Name Native"/></label>
                <g:textField name="nameNative" class="form-control" value="${locCountryInstance?.nameNative}" maxlength="120" required="required"/>
                <g:renderErrors bean='${locCountryInstance}' field='nameNative'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'continent', 'has-error')}'>
                <label><g:message code="label.locCountry.continent" default="Continent"/></label>
                <g:textField name="continent" class="form-control" value="${locCountryInstance?.continent}" maxlength="50"/>
                <g:renderErrors bean='${locCountryInstance}' field='continent'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'cityCapital', 'has-error')}'>
                <label><g:message code="label.locCountry.cityCapital" default="City Capital"/></label>
                <g:textField name="cityCapital" class="form-control" value="${locCountryInstance?.cityCapital}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='cityCapital'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'cityCapitalNative', 'has-error')}'>
                <label><g:message code="label.locCountry.cityCapitalNative" default="City Capital Native"/></label>
                <g:textField name="cityCapitalNative" class="form-control" value="${locCountryInstance?.cityCapitalNative}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='cityCapitalNative'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'primaryCurrencyName', 'has-error')}'>
                <label><g:message code="label.locCountry.primaryCurrencyName" default="Primary Currency Name"/></label>
                <g:textField name="primaryCurrencyName" class="form-control" value="${locCountryInstance?.primaryCurrencyName}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='primaryCurrencyName'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'isActive', 'has-error')}'>
                <label class='br'><g:message code="label.locCountry.isActive" default="Is Active"/></label>
                <g:checkBox class="cb" name="isActive"  value="${locCountryInstance?.isActive}" />
                <g:renderErrors bean='${locCountryInstance}' field='isActive'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'remarks', 'has-error')}'>
                <label><g:message code="label.locCountry.remarks" default="Remarks"/></label>
                <g:textField name="remarks" class="form-control" value="${locCountryInstance?.remarks}"/>
                <g:renderErrors bean='${locCountryInstance}' field='remarks'/>
            </div>
        </div>

    </fieldset>

    <fieldset>
        <legend>Area Information</legend>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'areaTotalSqMile', 'has-error')}'>
                <label><g:message code="label.locCountry.areaTotalSqMile" default="Area Total Sq Mile"/></label>
                <g:field type="number" name="areaTotalSqMile" class="form-control" value="${fieldValue(bean: locCountryInstance, field: 'areaTotalSqMile')}" min="0" max="9999999" step="1.00"/>
                <g:renderErrors bean='${locCountryInstance}' field='areaTotalSqMile'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'areaTotalSqKm', 'has-error')}'>
                <label><g:message code="label.locCountry.areaTotalSqKm" default="Area Total Sq Km"/></label>
                <g:field type="number" name="areaTotalSqKm" class="form-control" value="${fieldValue(bean: locCountryInstance, field: 'areaTotalSqKm')}" min="0" max="9999999" step="1.00"/>
                <g:renderErrors bean='${locCountryInstance}' field='areaTotalSqKm'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'areaLandSqMile', 'has-error')}'>
                <label><g:message code="label.locCountry.areaLandSqMile" default="Area Land Sq Mile"/></label>
                <g:field type="number" name="areaLandSqMile" class="form-control" value="${fieldValue(bean: locCountryInstance, field: 'areaLandSqMile')}" min="0" max="9999999" step="1.00"/>
                <g:renderErrors bean='${locCountryInstance}' field='areaLandSqMile'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'areaLandSqKm', 'has-error')}'>
                <label><g:message code="label.locCountry.areaLandSqKm" default="Area Land Sq Km"/></label>
                <g:field type="number" name="areaLandSqKm" class="form-control" value="${fieldValue(bean: locCountryInstance, field: 'areaLandSqKm')}" min="0" max="9999999" step="1.00"/>
                <g:renderErrors bean='${locCountryInstance}' field='areaLandSqKm'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'areaWaterSqMile', 'has-error')}'>
                <label><g:message code="label.locCountry.areaWaterSqMile" default="Area Water Sq Mile"/></label>
                <g:field type="number" name="areaWaterSqMile" class="form-control" value="${fieldValue(bean: locCountryInstance, field: 'areaWaterSqMile')}" min="0" max="9999999" step="1.00"/>
                <g:renderErrors bean='${locCountryInstance}' field='areaWaterSqMile'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'areaWaterSqKm', 'has-error')}'>
                <label><g:message code="label.locCountry.areaWaterSqKm" default="Area Water Sq Km"/></label>
                <g:field type="number" name="areaWaterSqKm" class="form-control" value="${fieldValue(bean: locCountryInstance, field: 'areaWaterSqKm')}" min="0" max="9999999" step="1.00"/>
                <g:renderErrors bean='${locCountryInstance}' field='areaWaterSqKm'/>
            </div>
        </div>

    </fieldset>

    <fieldset>
        <legend>Population Information</legend>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'population', 'has-error')}'>
                <label><g:message code="label.locCountry.population" default="Population"/></label>
                <g:field type="number" name="population" class="form-control" value="${locCountryInstance?.population}" min="0" max="9999999" step="1.00"/>
                <g:renderErrors bean='${locCountryInstance}' field='population'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'censusYear', 'has-error')}'>
                <label><g:message code="label.locCountry.censusYear" default="Census Year"/></label>
                <g:field type="number" name="censusYear" class="form-control" value="${locCountryInstance?.censusYear}" min="0" max="9999999" step="1.00"/>
                <g:renderErrors bean='${locCountryInstance}' field='censusYear'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'populationDensitySqKm', 'has-error')}'>
                <label><g:message code="label.locCountry.populationDensitySqKm" default="Population Density Sq Km"/></label>
                <g:field type="number" name="populationDensitySqKm" class="form-control" value="${fieldValue(bean: locCountryInstance, field: 'populationDensitySqKm')}" min="0" max="9999999" step="1.00"/>
                <g:renderErrors bean='${locCountryInstance}' field='populationDensitySqKm'/>
            </div>
        </div>

    </fieldset>

    <fieldset>
        <legend>Analytical Information</legend>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'cityLargest', 'has-error')}'>
                <label><g:message code="label.locCountry.cityLargest" default="City Largest"/></label>
                <g:textField name="cityLargest" class="form-control" value="${locCountryInstance?.cityLargest}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='cityLargest'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'cityLargestNative', 'has-error')}'>
                <label><g:message code="label.locCountry.cityLargestNative" default="City Largest Native"/></label>
                <g:textField name="cityLargestNative" class="form-control" value="${locCountryInstance?.cityLargestNative}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='cityLargestNative'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'languageOfficial', 'has-error')}'>
                <label><g:message code="label.locCountry.languageOfficial" default="Language Official"/></label>
                <g:textField name="languageOfficial" class="form-control" value="${locCountryInstance?.languageOfficial}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='languageOfficial'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'languageOfficialNative', 'has-error')}'>
                <label><g:message code="label.locCountry.languageOfficialNative" default="Language Official Native"/></label>
                <g:textField name="languageOfficialNative" class="form-control" value="${locCountryInstance?.languageOfficialNative}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='languageOfficialNative'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'languageOfficialAddl', 'has-error')}'>
                <label><g:message code="label.locCountry.languageOfficialAddl" default="Language Official Addl"/></label>
                <g:textField name="languageOfficialAddl" class="form-control" value="${locCountryInstance?.languageOfficialAddl}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='languageOfficialAddl'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'languageOfficialAddlNative', 'has-error')}'>
                <label><g:message code="label.locCountry.languageOfficialAddlNative" default="Language Official Addl Native"/></label>
                <g:textField name="languageOfficialAddlNative" class="form-control" value="${locCountryInstance?.languageOfficialAddlNative}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='languageOfficialAddlNative'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'primaryCurrencyCode', 'has-error')}'>
                <label><g:message code="label.locCountry.primaryCurrencyCode" default="Primary Currency Code"/></label>
                <g:textField name="primaryCurrencyCode" class="form-control" value="${locCountryInstance?.primaryCurrencyCode}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='primaryCurrencyCode'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'whoRegion', 'has-error')}'>
                <label><g:message code="label.locCountry.whoRegion" default="Who Region"/></label>
                <g:textField name="whoRegion" class="form-control" value="${locCountryInstance?.whoRegion}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='whoRegion'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'wbIncomeGroup', 'has-error')}'>
                <label><g:message code="label.locCountry.wbIncomeGroup" default="Wb Income Group"/></label>
                <g:textField name="wbIncomeGroup" class="form-control" value="${locCountryInstance?.wbIncomeGroup}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='wbIncomeGroup'/>
            </div>
        </div>
    </fieldset>

    <fieldset>
        <legend>Historical Information</legend>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'acquired', 'has-error')}'>
                <label><g:message code="label.locCountry.acquired" default="Acquired"/></label>
                <g:textField name="acquired" class="form-control" value="${locCountryInstance?.acquired}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='acquired'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'establishmentDate', 'has-error')}'>
                <label><g:message code="label.locCountry.establishmentDate" default="Establishment Date"/></label>
                <g:textField name="establishmentDate" class="form-control" value="${locCountryInstance?.establishmentDate}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='establishmentDate'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'cityCapitalPrevious', 'has-error')}'>
                <label><g:message code="label.locCountry.cityCapitalPrevious" default="City Capital Previous"/></label>
                <g:textField name="cityCapitalPrevious" class="form-control" value="${locCountryInstance?.cityCapitalPrevious}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='cityCapitalPrevious'/>
            </div>
        </div>

        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
            <div class='form-group ${hasErrors(bean: locCountryInstance, field: 'cityCapitalPreviousNative', 'has-error')}'>
                <label><g:message code="label.locCountry.cityCapitalPreviousNative" default="City Capital Previous Native"/></label>
                <g:textField name="cityCapitalPreviousNative" class="form-control" value="${locCountryInstance?.cityCapitalPreviousNative}" maxlength="100"/>
                <g:renderErrors bean='${locCountryInstance}' field='cityCapitalPreviousNative'/>
            </div>
        </div>

    </fieldset>

</fieldset>
