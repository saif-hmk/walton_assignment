/**
 * @Created_By : AALAA
 * @Date       : 2022.08.08 01:48:45 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.walton.prl

import grails.plugin.springsecurity.SpringSecurityService
import org.aalaa.adm.AdmDepartment
import org.aalaa.adm.AdmDesignation
import org.aalaa.adm.AdmOrganization
import org.aalaa.auth.AuthUser
import org.aalaa.com.DbService
import org.aalaa.com.Honorific
import org.aalaa.hr.HrEmployee
import org.aalaa.hr.HrEmployeeType
import org.aalaa.hr.HrEmploymentType
import org.aalaa.hr.HrStaff
import org.aalaa.prl.PrlPeriod
import org.aalaa.sys.TrackerService
import org.walton.hr.HrCrAttendance

import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PrlProcMstController {
    //static allowedMethods = [save: "POST", update: "PUT"]

    AuthUser              currentUser
    Date                  currentDate
    SimpleDateFormat      dateParseFormat
    TrackerService        trackerService
    SpringSecurityService springSecurityService
    DbService             dbService

    def beforeInterceptor = {
        currentDate     = new Date()
        currentUser     = springSecurityService.getCurrentUser()
        dateParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
    }

    def index(Integer max) {
        Integer defMin   = params.min ? Integer.parseInt(params.min) : grailsApplication.config.show.item.min,
                defMax   = params.max ? Integer.parseInt(params.max) : grailsApplication.config.show.item.max
        params.max       = Math.min(max ?: defMin, defMax)
        String orderBy   = params.sort  ?: 'id',
               direction = params.order ?: 'desc'   //asc
        List<PrlProcMst> prlProcMstInstanceList = PrlProcMst.createCriteria().list(params) {
            if(params.admDepartment)
                eq('admDepartment', org.aalaa.adm.AdmDepartment.get(params.admDepartment))
            if(params.admDesignation)
                eq('admDesignation', org.aalaa.adm.AdmDesignation.get(params.admDesignation))
            if(params.admOrganization)
                eq('admOrganization', org.aalaa.adm.AdmOrganization.get(params.admOrganization))
            if(params.email)
                ilike('email', '%' + params.email + '%')
            if(params.fullName)
                ilike('fullName', '%' + params.fullName + '%')
            if(params.grossSalary)
                eq('grossSalary', Float.parseFloat(params.grossSalary))
            if(params.hrEmployee)
                eq('hrEmployee', org.aalaa.hr.HrEmployee.get(params.hrEmployee))
            if(params.hrEmployeeCode)
                ilike('hrEmployeeCode', '%' + params.hrEmployeeCode + '%')
            if(params.isApproved)
                eq('isApproved', true)
            if(params.limitPerMonth)
                eq('limitPerMonth', Float.parseFloat(params.limitPerMonth))
            if(params.logApprovedAt){
                ge('logApprovedAt', dateParseFormat.parse(params.logApprovedAt))
                lt('logApprovedAt', dateParseFormat.parse(params.logApprovedAt) + 1)
            }
            if(params.logApprovedBy)
                eq('logApprovedBy', org.aalaa.auth.AuthUser.get(params.logApprovedBy))
            if(params.prlPeriod)
                eq('prlPeriod', org.aalaa.prl.PrlPeriod.get(params.prlPeriod))
            if(params.ratePerHour)
                eq('ratePerHour', Float.parseFloat(params.ratePerHour))
            if(params.remarks)
                ilike('remarks', '%' + params.remarks + '%')
            if(params.totalCalculatedAmount)
                eq('totalCalculatedAmount', Float.parseFloat(params.totalCalculatedAmount))
            if(params.totalEarnings)
                eq('totalEarnings', Float.parseFloat(params.totalEarnings))
            if(params.totalEffectiveHour)
                eq('totalEffectiveHour', Float.parseFloat(params.totalEffectiveHour))
            if(params.totalTimeBreak)
                eq('totalTimeBreak', Float.parseFloat(params.totalTimeBreak))
            order(orderBy, direction)
        }

        //[prlProcMstInstanceList: PrlProcMst.list(params)]
        [prlProcMstInstanceList: prlProcMstInstanceList, prlProcMstInstanceTotal: prlProcMstInstanceList.getTotalCount()]
    }

    @Transactional
    save(PrlProcMst prlProcMstInstance) {
        if (prlProcMstInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-PrlProcMst : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(prlProcMstInstance, ['logCreatedBy'])
        prlProcMstInstance.logCreatedBy = currentUser
        
        prlProcMstInstance.validate()
        if (prlProcMstInstance.hasErrors()) {
            flash.exception = "ER-S2-PrlProcMst:"
            trackerService.logError([errorMessage: prlProcMstInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [prlProcMstInstance: prlProcMstInstance])
            return
        }
        try {
            prlProcMstInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-PrlProcMst : " + e
            render(view: "create", model: [prlProcMstInstance: prlProcMstInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.prlProcMst.pageTitle", default: "PrlProcMst"), prlProcMstInstance.id])
                redirect prlProcMstInstance
            }
            '*' { respond prlProcMstInstance, [status: CREATED] }
        }
    }

    def show(PrlProcMst prlProcMstInstance) {
        [prlProcMstInstance : prlProcMstInstance]
    }

    def edit(PrlProcMst prlProcMstInstance) {
        [prlProcMstInstance : prlProcMstInstance]
    }

    @Transactional
    update(PrlProcMst prlProcMstInstance) {
        if (prlProcMstInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-PrlProcMst : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (prlProcMstInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [prlProcMstInstance: prlProcMstInstance])
                return
            }
        }
        
        
        prlProcMstInstance.validate()
        if (prlProcMstInstance.hasErrors()) {
            flash.exception = "ER-U2-PrlProcMst:"
            trackerService.logError([errorMessage: prlProcMstInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [prlProcMstInstance: prlProcMstInstance])
            return
        }
        try {
            prlProcMstInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-PrlProcMst : " + e
            render(view: "edit", model: [prlProcMstInstance: prlProcMstInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.prlProcMst.pageTitle", default: "PrlProcMst"), prlProcMstInstance.id])
                redirect prlProcMstInstance
            }
            '*'{ respond prlProcMstInstance, [status: OK] }
        }
    }

    @Transactional
    delete(PrlProcMst prlProcMstInstance) {
        if (prlProcMstInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-PrlProcMst : Record not found...!")
            redirect(action: "index")
        }
        try {
            prlProcMstInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-PrlProcMst : " + e
            redirect(action: "index")
        }
    }

    def process() {
        [prlProcMstInstance : new PrlProcMst(params)]
    }

    def rollback() {
        [prlProcMstInstance : new PrlProcMst(params)]
    }

    def result() {
        [prlProcMstInstanceList : PrlProcMst.findAllByPrlPeriod(PrlPeriod.get(params.prlPeriod)), params: params]
    }

    def takeAction() {
        println params
        if(params.processType == "PROCESS"){
            PrlPeriod        prlPeriod    = PrlPeriod.get(params.prlPeriod)
            if(PrlProcMst.findByPrlPeriod(prlPeriod)){
                flash.exception = "Sorry, Payroll is already processed for this period!"
                redirect(action: params.redirectTo, params: params)
                return
            }
            List<HrEmployee> employeeList = HrEmployee.list()

            println "Processing salaries for full time employee: "
            for (HrEmployee employee in employeeList.findAll{it.employmentType != HrEmploymentType.PART_TIME}){
                PrlProcMst prlProcMst      = new PrlProcMst(calculateSalaries(prlPeriod, employee))
                prlProcMst.logCreatedBy    = currentUser
                prlProcMst.prlPeriod       = prlPeriod
                prlProcMst.hrEmployee      = employee
                prlProcMst.honorific       = employee.honorific
                prlProcMst.admOrganization = employee.admVendorOrganization
                prlProcMst.admBranch       = employee?.admBranch
                prlProcMst.admDepartment   = employee.department
                prlProcMst.admDesignation  = employee.designation
                prlProcMst.employeeType    = employee.employeeType
                prlProcMst.employmentType  = employee.employmentType
                prlProcMst.hrEmployeeCode  = employee.code
                prlProcMst.fullName        = employee.nameFull
                prlProcMst.email           = employee.email
                prlProcMst.mobileNo        = employee.mobileNoPrimary

                prlProcMst.validate()
                prlProcMst.save(flush: true, failOnError: true)
            }

            println "Processing wages for part time employee: "
            for (HrStaff employee in employeeList.findAll{it.employmentType == HrEmploymentType.PART_TIME}){
                PrlProcMst prlProcMst      = new PrlProcMst(calculateWages(prlPeriod, employee))
                prlProcMst.logCreatedBy    = currentUser
                prlProcMst.prlPeriod       = prlPeriod
                prlProcMst.hrEmployee      = employee
                prlProcMst.honorific       = employee.honorific
                prlProcMst.admOrganization = employee.admVendorOrganization
                prlProcMst.admBranch       = employee?.admBranch
                prlProcMst.admDepartment   = employee.department
                prlProcMst.admDesignation  = employee.designation
                prlProcMst.employeeType    = employee.employeeType
                prlProcMst.employmentType  = employee.employmentType
                prlProcMst.hrEmployeeCode  = employee.code
                prlProcMst.fullName        = employee.nameFull
                prlProcMst.email           = employee.email
                prlProcMst.mobileNo        = employee.mobileNoPrimary

                prlProcMst.validate()
                prlProcMst.save(flush: true, failOnError: true)
            }
            flash.success = "Payroll processed successfully!"
            redirect(action: "result", params: [prlPeriod: prlPeriod?.id])
            return
        }
        else {
            //rollback content goes here...
            PrlPeriod        prlPeriod    = PrlPeriod.get(params.prlPeriod)
            if(!PrlProcMst.findByPrlPeriod(prlPeriod)){
                flash.exception = "Sorry, There is no payroll found for this period to rollback!"
                redirect(action: params.redirectTo, params: params)
                return
            }
            dbService.executeQuery("DELETE FROM PRL_PROC_MST WHERE PRL_PERIOD_ID = ${prlPeriod?.id}")
        }
        flash.success = "Action taken successfully!"
        redirect(action: params.redirectTo)
    }

    Map calculateSalaries(PrlPeriod prlPeriod, HrEmployee employee){
        Map m = new HashMap()
        List<HrCrAttendance> attendanceList = HrCrAttendance.findAllByPrlPeriodAndHrEmployee(prlPeriod, employee)
        Float grossSalary                   = employee.grossSalary,
              totalTimeBreak                = attendanceList?.timeBreak?.sum() ?: 0.0F,
              totalEffectiveHour            = attendanceList?.effectiveWorkingHour?.sum() ?: 0.0F,
              totalCalculatedAmount         = employee.grossSalary,
              totalEarnings                 = totalCalculatedAmount

        m.put("grossSalary"           , grossSalary          )
        m.put("totalTimeBreak"        , totalTimeBreak       )
        m.put("totalEffectiveHour"    , totalEffectiveHour   )
        m.put("totalCalculatedAmount" , totalCalculatedAmount)
        m.put("totalEarnings"         , totalEarnings        )

        return m
    }

    Map calculateWages(PrlPeriod prlPeriod, HrStaff employee){
        Map m = new HashMap()
        List<HrCrAttendance> attendanceList = HrCrAttendance.findAllByPrlPeriodAndHrEmployee(prlPeriod, employee)
        Float ratePerHour                   = employee.ratePerHour,
              limitPerMonth                 = employee.limitPerMonth,
              totalTimeBreak                = attendanceList?.timeBreak?.sum() ?: 0.0F,
              totalEffectiveHour            = attendanceList?.effectiveWorkingHour?.sum() ?: 0.0F,
              totalCalculatedAmount         = totalEffectiveHour * ratePerHour,
              totalEarnings                 = limitPerMonth ? (totalCalculatedAmount > limitPerMonth ? limitPerMonth : totalCalculatedAmount) : totalCalculatedAmount

        m.put("ratePerHour"          , ratePerHour          )
        m.put("limitPerMonth"        , limitPerMonth        )
        m.put("totalTimeBreak"       , totalTimeBreak       )
        m.put("totalEffectiveHour"   , totalEffectiveHour   )
        m.put("totalCalculatedAmount", totalCalculatedAmount)
        m.put("totalEarnings"        , totalEarnings        )

        return m
    }
}
