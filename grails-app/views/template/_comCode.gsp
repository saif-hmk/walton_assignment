<div class="${mc_code ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_code ?: "code"}", 'has-error') : ""}">
        <label><g:message code="default.label.code" default="Code"/></label>
        <g:textField id="${i_code ?: "code"}" name="${n_code ?: "code"}" value="${code ?: params.code}" class="form-control ${c_code ?: "code"}"/>
        <g:renderErrors bean="${bean}" field="${f_code ?: "code"}"/>
    </div>
</div>