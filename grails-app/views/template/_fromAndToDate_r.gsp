%{--
<div class="${mc_fromDate ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label class="required"><g:message code="default.label.fromDate" default="From Date"/></label>
        <g:textField id="fromDate_0" name="${np_fromDate ?: ""}fromDate" class="form-control dtp-date" value="${fromDate ?: params.fromDate}" required="required"/>
    </div>
</div>

<div class="${mc_toDate ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label class="required"><g:message code="default.label.toDate" default="To Date"/></label>
        <g:textField id="toDate_0" name="${np_toDate ?: ""}toDate" class="form-control dtp-date" value="${toDate ?: params.toDate}" required="required"/>
    </div>
</div>
--}%

<div class="${mc_fromDate ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_fromDate ?: "fromDate"}", 'has-error') : ""}">
        <label class="required"><g:message code="default.label.fromDate" default="From Date"/></label>
        <g:textField id="${i_fromDate ?: "fromDate"}" name="${n_fromDate ?: "fromDate"}" value="${fromDate ?: params.fromDate}" class="form-control dtp-date ${c_fromDate ?: "fromDate"}" required="required"/>
        <g:renderErrors bean="${bean}" field="${f_fromDate ?: "fromDate"}"/>
    </div>
</div>

<div class="${mc_toDate ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class="form-group ${bean ? hasErrors(bean: bean, field: "${f_toDate ?: "toDate"}", 'has-error') : ""}">
        <label class="required"><g:message code="default.label.toDate" default="To Date"/></label>
        <g:textField id="${i_toDate ?: "toDate"}" name="${n_toDate ?: "toDate"}" value="${toDate ?: params.toDate}" class="form-control dtp-date ${c_toDate ?: "toDate"}" required="required"/>
        <g:renderErrors bean="${bean}" field="${f_toDate ?: "toDate"}"/>
    </div>
</div>