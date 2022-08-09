<div class='${mc_isActive ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}'>
    <div class='form-group'>
        <label class='br'><g:message code="default.label.isActive" default="Is Active"/></label>
        <g:select name="${n_isActive ?: "isActive"}" id="${i_isActive ?: "isActive_0"}" class="${c_reference ?: "form-control isActive"}" from="${["true": "Yes", "false": "No"]}" value="${v_isActive ?: params?.isActive}" optionKey="key" optionValue="value" noSelection="['': 'Select One']"/>
    </div>
</div>
