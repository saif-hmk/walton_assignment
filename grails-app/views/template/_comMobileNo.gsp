<div class="${mc_mobileNo ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_mobileNo ?: "mobileNo"}", 'has-error') : ""}">
        <label><g:message code="default.label.mobileNo" default="Mobile No"/></label>
        <g:textField id="${i_mobileNo ?: "mobileNo"}" name="${n_mobileNo ?: "mobileNo"}" value="${mobileNo ?: params.mobileNo}" class="form-control ${c_mobileNo ?: "mobileNo"}" max="14"/>
        <g:renderErrors bean="${bean}" field="${f_mobileNo ?: "mobileNo"}"/>
    </div>
</div>