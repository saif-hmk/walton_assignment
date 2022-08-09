<!--
 @Created_By : AALAA
 @Date       : 2022.08.06 08:02:46 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->
<style type="text/css">
.disabled-tr > td, .disabled-tr > td > input{
    background-color: #f4f4f4;
}
</style>

<fieldset class='form'>
    <div class="col-xs-12 no-padding">
        <div class='col-xs-12 col-sm-6 col-md-4 col-lg-6'>
            <div class='form-group'>
                <label><g:message code="label.hrCrAttendance.hrEmployee" default="Hr Employee"/></label>
                <g:textField name="hrEmployee" id="hrEmployee" class="form-control readonly" value="${hrEmployee}" disabled="disabled"/>
            </div>
        </div>
    </div>
</fieldset>

<fieldset>
    <div class="box-body">
        <legend>Attendance Details</legend>
        <table id="attendanceTable" class="table table-bordered table-striped table-hover table-condensed display nowrapX th-center th-colored">
            <thead>
            <tr>
                <th>${message(code: 'label.hrCrAttendance.dayOfWeek'           , default: 'Day of Week'           )}</th>
                <th>${message(code: 'label.hrCrAttendance.timeIn'              , default: 'In Time'               )}</th>
                <th>${message(code: 'label.hrCrAttendance.timeOut'             , default: 'Out Time'              )}</th>
                <th>${message(code: 'label.hrCrAttendance.timeBreak'           , default: 'Time Break'            )}</th>
                <th>${message(code: 'label.hrCrAttendance.effectiveWorkingHour', default: 'Effective Working Hour')}</th>
                <th>${message(code: 'label.hrCrAttendance.remarks'             , default: 'Remarks'               )}</th>
                <th>${message(code: 'label.hrCrAttendance.isSubmitted'         , default: 'Submitted...?'         )}</th>
                <th>${message(code: 'label.hrCrAttendance.isApproved'          , default: 'Approved...?'          )}</th>
            </tr>
            </thead>
            <tbody>
            <g:if test="${weeklyAttendanceList}">
                <g:each in="${weeklyAttendanceList}" var="hrCrAttendanceInstance" status="i">
                    <g:set var="isDisabled" value="${hrCrAttendanceInstance?.timeIn.clearTime() > new Date().clearTime() ? "disabled-tr" : ""}"/>
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'} ${isDisabled}">
                        <td class="cente">
                            ${hrCrAttendanceInstance?.timeIn?.format("EEEE")}
                            <g:hiddenField name="hrCrAttendance[${i}].hrEmployee" value="${hrEmployee?.id}"/>
                            <g:hiddenField name="hrCrAttendance[${i}].id" value="${hrCrAttendanceInstance?.id}"/>
                            <g:renderErrors bean='${hrCrAttendanceInstance}' field='hrEmployee'/>

                            <g:if test="${weeklyAttendanceList.last().timeIn.clearTime() == new Date().clearTime()}">
%{--                            <g:if test="${weeklyAttendanceList.get(1).timeIn.clearTime() == new Date().clearTime()}">--}%
                                <g:hiddenField name="hrCrAttendance[${i}].approvalStage" value="${org.aalaa.com.ApprovalStage.SUBMITTED.key}"/>
                            </g:if>
                        </td>
                        <td class="center">
                            <g:textField name="hrCrAttendance[${i}].timeIn" class="form-control dtp-date-time timeIn" value="${hrCrAttendanceInstance?.timeIn?.format(grailsApplication.config.format.dtp.dateTime12)}" required="required"/>
                            <g:renderErrors bean='${hrCrAttendanceInstance}' field='timeIn'/>
                        </td>
                        <td class="center">
                            <g:textField name="hrCrAttendance[${i}].timeOut" class="form-control dtp-date-time timeOut" value="${hrCrAttendanceInstance?.timeOut?.format(grailsApplication.config.format.dtp.dateTime12)}" required="required"/>
                            <g:renderErrors bean='${hrCrAttendanceInstance}' field='timeOut'/>
                        </td>
                        <td class="right">
                            <g:field type="number" name="hrCrAttendance[${i}].timeBreak" class="form-control timeBreak" placeHolder="e.g. 60 (min)" value="${hrCrAttendanceInstance?.timeBreak}" min="0" max="9999999" step="1.00" required="required"/>
                            <g:renderErrors bean='${hrCrAttendanceInstance}' field='timeBreak'/>
                        </td>
                        <td class="right">
                            <g:field type="number" name="hrCrAttendance[${i}].effectiveWorkingHour" class="form-control effectiveWorkingHour" value="${hrCrAttendanceInstance?.effectiveWorkingHour}" min="0" max="9999999" step="0.01" required="required"/>
                            <g:renderErrors bean='${hrCrAttendanceInstance}' field='effectiveWorkingHour'/>
                        </td>
                        <td class="center">
                            <g:textField name="hrCrAttendance[${i}].remarks" class="form-control" value="${hrCrAttendanceInstance?.remarks}" maxlength="255"/>
                            <g:renderErrors bean='${hrCrAttendanceInstance}' field='remarks'/>
                        </td>
                        <td class="center ${hrCrAttendanceInstance?.isSubmitted ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${hrCrAttendanceInstance?.isSubmitted}" true="&#10004;" false="&#10008;"/></td>
                        <td class="center ${hrCrAttendanceInstance?.isApproved ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${hrCrAttendanceInstance?.isApproved}" true="&#10004;" false="&#10008;"/></td>
                    </tr>
                </g:each>
            </g:if>
            </tbody>
        </table>
    </div><!-- /.box-body table-responsive no-padding -->
</fieldset>

<script type="text/javascript">
    $(document).on("blur", ".timeIn, .timeOut, .timeBreak", function () {
        validateEffectiveWorkingHour($(this));
    });

    function validateEffectiveWorkingHour(d) {
        let timeIn    = d.closest("tr").find(".timeIn"   ).val();
        let timeOut   = d.closest("tr").find(".timeOut"  ).val();
        let timeBreak = d.closest("tr").find(".timeBreak").val();

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
                d.closest("tr").find(".effectiveWorkingHour").val(null)
            }
            else{
                d.closest("tr").find(".effectiveWorkingHour").val(effectiveWorkingHour);
            }
        }
    }

    $("#attendanceTable tr.disabled-tr").each(function () {
        let d = $(this);
        d.removeClass("odd").removeClass("even");
        d.find("input").each(function(){
            $(this).prop("disabled", true);
        })
    });
</script>
