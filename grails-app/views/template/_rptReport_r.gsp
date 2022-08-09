<div class="${mc_rptReport ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_rptReport ?: "rptReport"}", 'has-error') : ""}">
        <label class="required"><g:message code="rptReport.pageTitle.label" default="Report"/></label>
        <g:select id="${i_rptReport ?: "rptReport"}" name="${n_rptReport ?: "rptReport"}" class="form-control many-to-one ${c_rptReport ?: "rptReport"}" from="${reportList}" value="${rptReport ?: params.rptReport}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
        <g:renderErrors bean="${bean}" field="${f_rptReport ?: "rptReport"}"/>
    </div>
</div>
