<div class="${mc_trackingNumber ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class="form-group ${bean ? hasErrors(bean: bean, field: "${field}", 'has-error') : ""}">
        <label class="required"><g:message code="default.trackingNumber.label" default="Tracking Number"/></label>
        <g:textField id="${i_trackingNumber ?: "trackingNumber"}" name="${n_trackingNumber ?: "trackingNumber"}" value="${trackingNumber ?: params.trackingNumber}" class="form-control ${c_trackingNumber ?: "trackingNumber"}" max="50" required="required"/>
    </div>
</div>