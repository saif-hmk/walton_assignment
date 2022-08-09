<div class="${mc_email ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_email ?: "email"}", 'has-error') : ""}">
        <label><g:message code="default.label.email" default="Email"/></label>
        <g:textField id="${i_email ?: "email"}" name="${n_email ?: "email"}" value="${email ?: params.email}" class="form-control ${c_email ?: "email"}"/>
        <g:renderErrors bean="${bean}" field="${f_email ?: "email"}"/>
    </div>
</div>