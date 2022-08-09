<div class="${mc_name ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_name ?: "name"}", 'has-error') : ""}">
        <label><g:message code="default.label.name" default="Name"/></label>
        <g:textField id="${i_name ?: "name"}" name="${n_name ?: "name"}" value="${name ?: params.name}" class="form-control ${c_name ?: "name"}"/>
        <g:renderErrors bean="${bean}" field="${f_name ?: "name"}"/>
    </div>
</div>