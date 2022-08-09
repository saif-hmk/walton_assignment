<g:if test="${lah && lah != "" && lah.contains("COUNTRY")}">
    <div class="lah ${mc_country ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
        <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_country ?: "locCountry"}", 'has-error') : ""}">
            <label class="required"><g:message code="label.locCountry.pageTitle" default="Country"/></label>
            <g:if test="${v_country && locCountry}">
                <g:select referenceType="locCountry" name="${n_country ?: "locCountry"}" class="form-control transparent many-to-one locLocation ${c_country ?: "locCountry"}" from="${locCountryList}" value="${locCountry ?: params.locCountry}" optionKey="id" optionValue="name" noSelection="['': 'Select One']" disabled="disabled" required="required"/>
                <g:hiddenField id="${i_country ?: "locCountry"}" name="${n_country ?: "locCountry"}" class="locationFixed ${c_country ?: "locCountry"}" value="${locCountry ?: params.locCountry}" required="required"/>
            </g:if>
            <g:else>
                <g:select referenceType="locCountry" id="${i_country ?: "country_0"}" name="${n_country ?: "locCountry"}" class="form-control many-to-one locLocation ${c_country ?: "locCountry"}" from="${locCountryList}" value="${locCountry ?: params.locCountry}" optionKey="id" optionValue="name" noSelection="['': 'Select One']" required="required"/>
            </g:else>
            <g:renderErrors bean="${instance}" field="${f_country ?: "locCountry"}"/>
        </div>
    </div>
</g:if>

<g:if test="${lah && lah != "" && lah.contains("DIVISION")}">
    <div class="lah ${mc_division ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
        <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_division ?: "locDivision"}", 'has-error') : ""}">
            <label class="required"><g:message code="label.locDivision.pageTitle" default="Division"/></label>
            <g:if test="${v_division && locDivision}">
                <g:select referenceType="locDivision"  name="${n_division ?: "locDivision"}" class="form-control transparent many-to-one locLocation ${c_division ?: "locDivision"}" from="${locDivisionList}" value="${locDivision ?: params.locDivision}" optionKey="id" optionValue="name" noSelection="['': 'Select One']" disabled="disabled" required="required"/>
                <g:hiddenField id="${i_division ?: "locDivision"}" name="${n_division ?: "locDivision"}" class="locationFixed ${c_division ?: "locDivision"}" value="${locDivision ?: params.locDivision}" required="required"/>
            </g:if>
            <g:else>
                <g:select referenceType="locDivision" id="${i_division ?: "division_0"}" name="${n_division ?: "locDivision"}" class="form-control many-to-one locLocation ${c_division ?: "locDivision"}" from="${locDivisionList}" value="${locDivision ?: params.locDivision}" optionKey="id" optionValue="name" noSelection="['': 'Select One']" required="required"/>
            </g:else>
            <g:renderErrors bean="${instance}" field="${f_division ?: "locDivision"}"/>
        </div>
    </div>
</g:if>

<g:if test="${lah && lah != "" && lah.contains("DISTRICT")}">
    <div class="lah ${mc_district ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
        <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_district ?: "locDistrict"}", 'has-error') : ""}">
            <label class="required"><g:message code="label.locDistrict.pageTitle" default="District"/></label>
            <g:if test="${v_district && locDistrict}">
                <g:select referenceType="locDistrict" name="${n_district ?: "locDistrict"}" class="form-control transparent many-to-one locLocation ${c_district ?: "locDistrict"}" from="${locDistrictList}" value="${locDistrict ?: params.locDistrict}" optionKey="id" optionValue="name" noSelection="['': 'Select One']" disabled="disabled" required="required"/>
                <g:hiddenField id="${i_district ?: "locDistrict"}" name="${n_district ?: "locDistrict"}" class="locationFixed ${c_district ?: "locDistrict"}" value="${locDistrict ?: params.locDistrict}" required="required"/>
            </g:if>
            <g:else>
                <g:select referenceType="locDistrict" id="${i_district ?: "district_0"}" name="${n_district ?: "locDistrict"}" class="form-control many-to-one locLocation ${c_district ?: "locDistrict"}" from="${locDistrictList}" value="${locDistrict ?: params.locDistrict}" optionKey="id" optionValue="name" noSelection="['': 'Select One']" required="required"/>
            </g:else>
            <g:renderErrors bean="${instance}" field="${f_district ?: "locDistrict"}"/>
        </div>
    </div>
</g:if>

<g:if test="${lah && lah != "" && lah.contains("SUB_DISTRICT")}">
    <div class="lah ${mc_upazila ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
        <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_upazila ?: "locSubDistrict"}", 'has-error') : ""}">
            <label><g:message code="label.locSubDistrict.pageTitle" default="Upazila"/></label>
            <g:if test="${v_upazila && locSubDistrict}">
                <g:select referenceType="locSubDistrict" name="${n_upazila ?: "locSubDistrict"}" class="form-control transparent many-to-one locLocation ${c_upazila ?: "locSubDistrict"}" from="${locSubDistrictList}" value="${locSubDistrict ?: params.locSubDistrict}" optionKey="id" optionValue="name" noSelection="['': 'Select One']" disabled="disabled"/>
                <g:hiddenField id="${i_upazila ?: "locSubDistrict"}" name="${n_upazila ?: "locSubDistrict"}" class="locationFixed ${c_upazila ?: "locSubDistrict"}" value="${locSubDistrict ?: params.locSubDistrict}" required="required"/>
            </g:if>
            <g:else>
                <g:select referenceType="locSubDistrict" id="${i_upazila ?: "upazila_0"}" name="${n_upazila ?: "locSubDistrict"}" class="form-control many-to-one locLocation ${c_upazila ?: "locSubDistrict"}" from="${locSubDistrictList}" value="${locSubDistrict ?: params.locSubDistrict}" optionKey="id" optionValue="name" noSelection="['': 'Select One']"/>
            </g:else>
            <g:renderErrors bean="${instance}" field="${f_upazila ?: "locSubDistrict"}"/>
        </div>
    </div>
</g:if>
