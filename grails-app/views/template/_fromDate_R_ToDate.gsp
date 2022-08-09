<div class="${mc_fromDate ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label class="required"><g:message code="default.label.fromDate" default="From Date"/></label>
        <g:textField id="fromDate_0" name="${np_fromDate ?: ""}fromDate" class="form-control dtp-date" value="${fromDate ?: params.fromDate}" required="required"/>
    </div>
</div>

<div class="${mc_toDate ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label><g:message code="default.label.toDate" default="To Date"/></label>
        <g:textField id="toDate_0" name="${np_toDate ?: ""}toDate" class="form-control dtp-date" value="${toDate ?: params.toDate}"/>
    </div>
</div>