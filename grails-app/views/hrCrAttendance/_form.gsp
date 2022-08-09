<!--
 @Created_By : AALAA
 @Date       : 2022.08.06 08:02:46 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>
    <div class="col-xs-12 no-padding">
        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-6'>
            <div class='form-group ${hasErrors(bean: hrCrAttendanceInstance, field: 'hrEmployee', 'has-error')} required'>
                <label class='required'><g:message code="label.hrCrAttendance.hrEmployee" default="Hr Employee"/></label>
                <g:if test="${session.getAttribute("USER_ROLES").toString().contains("ROLE_USER")}">
                    <g:textField name="hrEmployee" class="form-control" value="${session.getAttribute("USER_EMPLOYEE")?.hrEmployee}" disabled="disabled"/>
                    <g:hiddenField name="hrEmployee" value="${session.getAttribute("USER_EMPLOYEE")?.hrEmployee?.id}"/>
                </g:if>
                <g:else>
                    <g:select name="hrEmployee" class="form-control many-to-one select-with-search create-only" from="${org.aalaa.hr.HrEmployee.list().sort { it.id }}" value="${hrCrAttendanceInstance?.hrEmployee?.id}" optionKey="id" optionValue="${{ it.code + " | " + it.nameFull }}" noSelection="['': 'Select One']" required="required"/>
                </g:else>

                <g:renderErrors bean='${hrCrAttendanceInstance}' field='hrEmployee'/>
            </div>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrCrAttendanceInstance, field: 'timeIn', 'has-error')} required'>
            <label class='required'><g:message code="label.hrCrAttendance.timeIn" default="Time In"/></label>
            <g:textField name="timeIn" id="timeIn" class="form-control dtp-date-time" value="${hrCrAttendanceInstance?.timeIn?.format(grailsApplication.config.format.dtp.date)}" required="required"/>
            <g:renderErrors bean='${hrCrAttendanceInstance}' field='timeIn'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrCrAttendanceInstance, field: 'timeOut', 'has-error')} required'>
            <label class='required'><g:message code="label.hrCrAttendance.timeOut" default="Time Out"/></label>
            <g:textField name="timeOut" id="timeOut" class="form-control dtp-date-time" value="${hrCrAttendanceInstance?.timeOut?.format(grailsApplication.config.format.dtp.date)}" required="required"/>
            <g:renderErrors bean='${hrCrAttendanceInstance}' field='timeOut'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrCrAttendanceInstance, field: 'timeBreak', 'has-error')} required'>
            <label class='required'><g:message code="label.hrCrAttendance.timeBreak" default="Time Break"/></label>
            <g:field type="number" name="timeBreak" id="timeBreak" class="form-control" placeHolder="e.g. 60 (min)" value="${hrCrAttendanceInstance?.timeBreak}" min="0" max="9999999" step="1.00" required="required"/>
            <g:renderErrors bean='${hrCrAttendanceInstance}' field='timeBreak'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: hrCrAttendanceInstance, field: 'effectiveWorkingHour', 'has-error')} required'>
            <label class='required'><g:message code="label.hrCrAttendance.effectiveWorkingHour" default="Effective Working Hour"/></label>
            <g:field type="number" name="effectiveWorkingHour" id="effectiveWorkingHour" class="form-control" value="${hrCrAttendanceInstance?.effectiveWorkingHour}" min="0" max="9999999" step="0.01" required="required"/>
            <g:renderErrors bean='${hrCrAttendanceInstance}' field='effectiveWorkingHour'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: hrCrAttendanceInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.hrCrAttendance.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${hrCrAttendanceInstance?.remarks}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${hrCrAttendanceInstance}' field='remarks'/>
        </div>
    </div>

</fieldset>
<script type="text/javascript">
    $(document).on("blur", "#timeIn, #timeOut, #timeBreak", function () {
        validateEffectiveWorkingHour();
    });

    function validateEffectiveWorkingHour() {
        let timeIn    = $("#timeIn"   ).val();
        let timeOut   = $("#timeOut"  ).val();
        let timeBreak = $("#timeBreak").val();

        if(timeIn && timeOut && timeBreak){
            timeIn   = moment(timeIn , 'YYYY-MM-DD HH:mm TT');
            timeOut  = moment(timeOut, 'YYYY-MM-DD HH:mm TT');
            let dutyTime = (timeOut - timeIn) / 60000;  // 1 min = 60000 ms
            let effectiveWorkingHour = (dutyTime - timeBreak) / 60; //hour

            console.log("TimeIn              : " + new Date(timeIn));
            console.log("TimeOut             : " + new Date(timeOut));
            console.log("Duty Time           : " + dutyTime + " min");
            console.log("TimeBreak           : " + timeBreak + " min");
            console.log("EffectiveWorkingHour: " + effectiveWorkingHour + " hour");

            if(effectiveWorkingHour < (timeBreak / 60) || effectiveWorkingHour > 24){
                alert("Please enter valid time!");
                $("#effectiveWorkingHour").val(null);
            }
            else{
                //$("#effectiveWorkingHour").val(Math.floor(effectiveWorkingHour / 60, .5));
                $("#effectiveWorkingHour").val(effectiveWorkingHour);
            }
        }
    }
</script>
