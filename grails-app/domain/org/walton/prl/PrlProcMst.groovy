package org.walton.prl

import org.aalaa.adm.AdmBranch
import org.aalaa.adm.AdmDepartment
import org.aalaa.adm.AdmDesignation
import org.aalaa.adm.AdmOrganization
import org.aalaa.auth.AuthUser
import org.aalaa.com.Honorific
import org.aalaa.hr.HrEmployee
import org.aalaa.hr.HrEmployeeType
import org.aalaa.hr.HrEmploymentType
import org.aalaa.prl.PrlPeriod

class PrlProcMst {

    AuthUser         logCreatedBy,
                     logApprovedBy
    PrlPeriod        prlPeriod
    HrEmployee       hrEmployee
    Honorific        honorific
    AdmOrganization  admOrganization
    AdmBranch        admBranch
    AdmDepartment    admDepartment
    AdmDesignation   admDesignation
    HrEmployeeType   employeeType
    HrEmploymentType employmentType

    String           hrEmployeeCode,
                     fullName,
                     mobileNo,
                     email,
                     remarks
    Float            grossSalary,
                     ratePerHour           = 0.0F,
                     limitPerMonth         = 0.0F,
                     totalTimeBreak        = 0.0F,
                     totalEffectiveHour    = 0.0F,
                     totalCalculatedAmount = 0.0F,
                     totalEarnings         = 0.0F
    Boolean          isApproved            = false
    Date             logApprovedAt,
                     logCreatedDate        = new Date()

    static mapping = {
        table  'PRL_PROC_MST'
    }

    static constraints = {
        isApproved            nullable: false
        logCreatedBy          nullable: false, display: false
        logCreatedDate        nullable: false, display: false
        hrEmployee            nullable: false, unique: ["prlPeriod"]
        prlPeriod             nullable: false
        honorific             nullable: false
        admOrganization       nullable: false
        admBranch             nullable: true    //todo false
        admDepartment         nullable: false
        admDesignation        nullable: false
        employeeType          nullable: false
        employmentType        nullable: false
        totalCalculatedAmount nullable: false
        totalEarnings         nullable: false

        grossSalary           nullable: true
        ratePerHour           nullable: true
        limitPerMonth         nullable: true
        totalTimeBreak        nullable: true
        totalEffectiveHour    nullable: true
        hrEmployeeCode        nullable: true
        fullName              nullable: true
        mobileNo              nullable: true
        email                 nullable: true
        remarks               nullable: true
        logApprovedBy         nullable: true
        logApprovedAt         nullable: true
    }

    @Override
    String toString() {
        return totalEarnings
    }
}
