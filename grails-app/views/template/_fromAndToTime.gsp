<div class="${mc_fromTime ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label><g:message code="default.label.fromTime" default="From Time"/></label>
        <g:textField id="fromTime_0" name="${np_fromTime ?: ""}fromTime" class="form-control dtp-date" value="${fromTime ?: params.fromTime}"/>
    </div>
</div>

<div class="${mc_toTime ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label><g:message code="default.label.toTime" default="To Time"/></label>
        <g:textField id="toTime_0" name="${np_toTime ?: ""}toTime" class="form-control dtp-date" value="${toTime ?: params.toTime}"/>
    </div>
</div>