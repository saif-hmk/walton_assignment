<div class="${mc_fromDate ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label><g:message code="default.label.fromDate" default="From Date"/></label>
        <g:textField id="${i_fromDate ?: "fromDate"}" name="${n_fromDate ?: "fromDate"}" class="form-control dtp-date im-date ${c_fromDate ?: "fromDate"}" value="${fromDate ?: params.fromDate}"/>
    </div>
</div>

<div class="${mc_toDate ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label><g:message code="default.label.toDate" default="To Date"/></label>
        <g:textField id="${i_toDate ?: "toDate"}" name="${n_toDate ?: "toDate"}" class="form-control dtp-date im-date ${c_toDate ?: "toDate"}" value="${toDate ?: params.toDate}"/>
    </div>
</div>