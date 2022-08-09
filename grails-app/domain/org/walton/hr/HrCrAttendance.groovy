package org.walton.hr

import org.aalaa.auth.AuthUser
import org.aalaa.com.ApprovalStage
import org.aalaa.hr.HrEmployee
import org.aalaa.prl.PrlPeriod

class HrCrAttendance {

    AuthUser      logCreatedBy,
                  logModifiedBy,
                  logSubmittedBy,
                  logApprovedBy
    HrEmployee    hrEmployee
    PrlPeriod     prlPeriod
    ApprovalStage approvalStage = ApprovalStage.ENTRY

    String        hrEmployeeCode,
                  remarks
    Float         timeBreak            = 60.0F,
                  effectiveWorkingHour = 0.0F
    Boolean       isSubmitted          = false,
                  isApproved           = false
    Date          timeIn               = new Date(),
                  timeOut,
                  logSubmittedAt,
                  logApprovedAt,
                  logCreatedDate = new Date(),
                  logModifiedDate

    static mapping = {
        table  'HR_CR_ATTENDANCE'
    }

    static constraints = {
        hrEmployee           nullable: false
        prlPeriod            nullable: false
        approvalStage        nullable: false
        hrEmployeeCode       nullable: false
        timeBreak            nullable: false
        effectiveWorkingHour nullable: false
        isSubmitted          nullable: false
        isApproved           nullable: false
        timeIn               nullable: false
        timeOut              nullable: false
        logCreatedBy         nullable: false, display: false
        logCreatedDate       nullable: false, display: false

        logSubmittedBy       nullable: true
        logApprovedBy        nullable: true
        logSubmittedAt       nullable: true
        logApprovedAt        nullable: true
        remarks              nullable: true, size: 1..255
        logModifiedBy        nullable: true, display: false
        logModifiedDate      nullable: true, display: false
    }

    @Override
    String toString() {
        return effectiveWorkingHour
    }
}
