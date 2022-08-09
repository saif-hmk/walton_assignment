<div class="${mc_reference ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label><g:message code="corAttendance.reference.label" default="Reference"/></label>
        <g:textField id="${i_reference ?: "reference_0"}" name="${np_reference ?: ""}reference" class="form-control ${c_reference ?: "reference"}" value="${reference ?: params?.reference}" maxlength="15"/>
    </div>
</div>