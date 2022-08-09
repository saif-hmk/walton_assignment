<div class="${mc_nId ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_nId ?: "nId"}", 'has-error') : ""}">
        <label class="required"><g:message code="default.label.nId" default="National ID"/></label>
        <g:field type="number" id="${i_nId ?: "nId"}" name="${n_nId ?: "nId"}" value="${nId ?: params.nId}" class="form-control ${n_nId ?: "nId"}" minLength="11" maxLength="17" steps="1" required="required"/>
        <g:renderErrors bean="${bean}" field="${f_nId ?: "nId"}"/>
    </div>
</div>