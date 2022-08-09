package org.walton.hr

import grails.transaction.Transactional
import org.aalaa.com.ApprovalStage
import org.aalaa.prl.PrlPeriod

import java.text.SimpleDateFormat

@Transactional
class HrCrAttendanceService {

    List<HrCrAttendance> getAttendanceList(ApprovalStage approvalStage, Date timeFrom, Date timeTo){
        return HrCrAttendance.findAllByApprovalStageAndTimeInBetween(approvalStage, timeFrom, timeTo)
    }

    List<HrCrAttendance> getSubmittedAttendanceList(){
        Date timeFrom = new Date().clearTime()
        Date timeTo   = new Date().clearTime() + 1
        return getAttendanceList(ApprovalStage.SUBMITTED, timeFrom, timeTo)
    }

    Map getSubmittedAttendanceSummary(){
        Map m = new HashMap()
        List<HrCrAttendance> attendanceList     = getSubmittedAttendanceList()
        Date                 timeFrom           = new Date().clearTime()
        PrlPeriod            prlPeriod          = PrlPeriod.findByKeyword(new SimpleDateFormat("YYYY-MM").format(timeFrom))
        Integer              totalEmployee      = attendanceList.groupBy {it.hrEmployeeCode}?.size()
        Float                totalTimeBreak     = attendanceList?.timeBreak?.sum(),
                             totalEffectiveHour = attendanceList?.effectiveWorkingHour?.sum()

        m.put("prlPeriod"         , prlPeriod         )
        m.put("totalEmployee"     , totalEmployee     )
        m.put("totalTimeBreak"    , totalTimeBreak    )
        m.put("totalEffectiveHour", totalEffectiveHour)

        return m
    }
}
