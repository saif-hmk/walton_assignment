/**
 * @Created_By : AALAA
 * @Date       : 2022.08.06 08:03:17 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.walton.hr

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.aalaa.auth.AuthRole
import org.aalaa.auth.AuthUser
import org.aalaa.auth.AuthUserLkEmployee
import org.aalaa.auth.AuthUserService
import org.aalaa.com.ApprovalStage
import org.aalaa.com.CalendarService
import org.aalaa.com.DbService
import org.aalaa.prl.PrlPeriod
import org.aalaa.sys.TrackerService

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.OK

@Transactional(readOnly = true)
class HrCrAttendanceController {
    //static allowedMethods = [save: "POST", update: "PUT"]

    AuthUser              currentUser
    Date                  currentDate
    SimpleDateFormat      dateParseFormat,
                          dateTimeParseFormat
    TrackerService        trackerService
    SpringSecurityService springSecurityService
    CalendarService       calendarService
    DbService             dbService
    AuthUserService       authUserService
    AuthUserLkEmployee    authUserLkEmployee
    Set<AuthRole>         authUserRoles

    def beforeInterceptor = {
        currentDate         = new Date()
        currentUser         = springSecurityService.getCurrentUser()
        dateParseFormat     = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
        dateTimeParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.dateTime12)
        authUserLkEmployee  = authUserService.getAuthUserLkEmployee(currentUser)
        authUserRoles       = session.getAttribute("USER_ROLES")
    }

    def index(Integer max) {
        Integer defMin   = params.min ? Integer.parseInt(params.min) : grailsApplication.config.show.item.min,
                defMax   = params.max ? Integer.parseInt(params.max) : grailsApplication.config.show.item.max
        params.max       = Math.min(max ?: defMin, defMax)
        String orderBy   = params.sort  ?: 'id',
               direction = params.order ?: 'desc'   //asc
        List<HrCrAttendance> hrCrAttendanceInstanceList = HrCrAttendance.createCriteria().list(params) {
            if(authUserRoles.toString().contains("ROLE_USER")){
                eq('hrEmployee', authUserLkEmployee?.hrEmployee)
            }
            else{
                if(params.hrEmployee)
                    eq('hrEmployee', org.aalaa.hr.HrEmployee.get(params.hrEmployee))
            }

            if(params.hrEmployeeCode)
                ilike('hrEmployeeCode', '%' + params.hrEmployeeCode + '%')

            if(params.prlPeriod)
                eq('prlPeriod', org.aalaa.prl.PrlPeriod.get(params.prlPeriod))

            if(params.approvalStage)
                eq('approvalStage', ApprovalStage.valueOf(params.approvalStage))

            if(params.fromDate && params.toDate){
                ge('timeIn', dateParseFormat.parse(params.fromDate))
                lt('timeOut', dateParseFormat.parse(params.toDate) + 1)
            }
            else if(params.fromDate){
                ge('timeIn', dateParseFormat.parse(params.fromDate))
                lt('timeIn', dateParseFormat.parse(params.fromDate) +1)
            }
            else if(params.toDate){
                ge('timeOut', dateParseFormat.parse(params.toDate))
                lt('timeOut', dateParseFormat.parse(params.toDate) + 1)
            }
            order(orderBy, direction)
        }

        //[hrCrAttendanceInstanceList: HrCrAttendance.list(params)]
        [hrCrAttendanceInstanceList: hrCrAttendanceInstanceList, hrCrAttendanceInstanceTotal: hrCrAttendanceInstanceList.getTotalCount(), params: params]
    }

    def myDesk(Integer max) {
        Integer defMin   = params.min ? Integer.parseInt(params.min) : grailsApplication.config.show.item.min,
                defMax   = params.max ? Integer.parseInt(params.max) : grailsApplication.config.show.item.max
        params.max       = Math.min(max ?: defMin, defMax)
        String orderBy   = params.sort  ?: 'id',
               direction = params.order ?: 'desc'   //asc
        List<HrCrAttendance> hrCrAttendanceInstanceList = HrCrAttendance.createCriteria().list(params) {
            eq('approvalStage', ApprovalStage.SUBMITTED)

            if(params.hrEmployee)
                eq('hrEmployee', org.aalaa.hr.HrEmployee.get(params.hrEmployee))
            if(params.hrEmployeeCode)
                ilike('hrEmployeeCode', '%' + params.hrEmployeeCode + '%')

            if(params.fromDate && params.toDate){
                ge('timeIn', dateParseFormat.parse(params.fromDate))
                lt('timeOut', dateParseFormat.parse(params.toDate) + 1)
            }
            else if(params.fromDate){
                ge('timeIn', dateParseFormat.parse(params.fromDate))
                lt('timeIn', dateParseFormat.parse(params.fromDate) +1)
            }
            else if(params.toDate){
                ge('timeOut', dateParseFormat.parse(params.toDate))
                lt('timeOut', dateParseFormat.parse(params.toDate) + 1)
            }
            order(orderBy, direction)
        }

        //[hrCrAttendanceInstanceList: HrCrAttendance.list(params)]
        [hrCrAttendanceInstanceList: hrCrAttendanceInstanceList, hrCrAttendanceInstanceTotal: hrCrAttendanceInstanceList.getTotalCount()]
    }

    def myDeskEmployeeWise(Integer max) {
        Integer defMin   = params.min ? Integer.parseInt(params.min) : grailsApplication.config.show.item.min,
                defMax   = params.max ? Integer.parseInt(params.max) : grailsApplication.config.show.item.max
        params.max       = Math.min(max ?: defMin, defMax)
        String orderBy   = params.sort  ?: 'id',
               direction = params.order ?: 'desc'   //asc
        List<HrCrAttendance> hrCrAttendanceInstanceList = HrCrAttendance.createCriteria().list(params) {
            eq('approvalStage', ApprovalStage.SUBMITTED)

            if(params.hrEmployee)
                eq('hrEmployee', org.aalaa.hr.HrEmployee.get(params.hrEmployee))
            if(params.hrEmployeeCode)
                ilike('hrEmployeeCode', '%' + params.hrEmployeeCode + '%')

            if(params.fromDate && params.toDate){
                ge('timeIn', dateParseFormat.parse(params.fromDate))
                lt('timeOut', dateParseFormat.parse(params.toDate) + 1)
            }
            else if(params.fromDate){
                ge('timeIn', dateParseFormat.parse(params.fromDate))
                lt('timeIn', dateParseFormat.parse(params.fromDate) +1)
            }
            else if(params.toDate){
                ge('timeOut', dateParseFormat.parse(params.toDate))
                lt('timeOut', dateParseFormat.parse(params.toDate) + 1)
            }
            order(orderBy, direction)
        }

        //[hrCrAttendanceInstanceList: HrCrAttendance.list(params)]
        [hrCrAttendanceInstanceList: hrCrAttendanceInstanceList, hrCrAttendanceInstanceTotal: hrCrAttendanceInstanceList.getTotalCount()]
    }

    def approveMultipleAttendance(){
        println params
        int i = 0
        while (params["hrCrAttendance[" + i + "]"]) {
            HrCrAttendance hrCrAttendanceInstance
            Map hrCrAttendanceParams = params["hrCrAttendance[" + i + "]"]

            if (hrCrAttendanceParams?.id) {
                hrCrAttendanceInstance               = HrCrAttendance.get(hrCrAttendanceParams?.id)
                bindData(hrCrAttendanceInstance, ['approvalStage', 'logApprovedBy', 'logApprovedAt', 'isApproved'])
                hrCrAttendanceInstance.logApprovedBy = currentUser
                hrCrAttendanceInstance.logApprovedAt = currentDate
                hrCrAttendanceInstance.isApproved    = true
                hrCrAttendanceInstance.approvalStage = ApprovalStage.APPROVED
            }

            hrCrAttendanceInstance.validate()

            if (hrCrAttendanceInstance.hasErrors()) {
                flash.exception = "ER-S2-HrCrAttendance:"
                trackerService.logError([errorMessage: hrCrAttendanceInstance?.errors?.fieldErrors, request: request, params: hrCrAttendanceParams, currentUser: currentUser])
                render(view: "createWeekly", model: [hrCrAttendanceInstance: hrCrAttendanceInstance])
                return
            }
            try {
                hrCrAttendanceInstance.save(flush: true, failOnError: true)
            }
            catch (Exception e) {
                flash.exception = "EX-S1-HrCrAttendance : " + e
                render(view: "createWeekly", model: [hrCrAttendanceInstance: hrCrAttendanceInstance])
                return
            }

            i++
        }
        flash.message = "Attendance taken successfully!"
        redirect(action: "myDesk")
    }

    def create() {
        [hrCrAttendanceInstance : new HrCrAttendance(params)]
    }

    @Transactional
    save(HrCrAttendance hrCrAttendanceInstance) {
        if (hrCrAttendanceInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-HrCrAttendance : Record not found...!")
            redirect(action: "index")
        }

        bindData(hrCrAttendanceInstance, ['logCreatedBy', 'timeIn', 'timeOut', 'hrEmployeeCode', 'prlPeriod'])
        hrCrAttendanceInstance.logCreatedBy   = currentUser
        hrCrAttendanceInstance.hrEmployeeCode = hrCrAttendanceInstance.hrEmployee.code
        params.timeIn  ? hrCrAttendanceInstance.timeIn  = dateTimeParseFormat.parse(params.timeIn ) : null
        params.timeOut ? hrCrAttendanceInstance.timeOut = dateTimeParseFormat.parse(params.timeOut) : null
        try {
            hrCrAttendanceInstance.prlPeriod            = PrlPeriod.findByKeyword(new SimpleDateFormat("YYYY-MM").format(hrCrAttendanceInstance.timeIn))
        } catch (Exception e) {
            println e
        }

        hrCrAttendanceInstance.validate()
        if (hrCrAttendanceInstance.hasErrors()) {
            flash.exception = "ER-S2-HrCrAttendance:"
            trackerService.logError([errorMessage: hrCrAttendanceInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [hrCrAttendanceInstance: hrCrAttendanceInstance])
            return
        }
        try {
            hrCrAttendanceInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-HrCrAttendance : " + e
            render(view: "create", model: [hrCrAttendanceInstance: hrCrAttendanceInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.hrCrAttendance.pageTitle", default: "HrCrAttendance"), hrCrAttendanceInstance.id])
                redirect hrCrAttendanceInstance
            }
            '*' { respond hrCrAttendanceInstance, [status: CREATED] }
        }
    }

    def show(HrCrAttendance hrCrAttendanceInstance) {
        [hrCrAttendanceInstance : hrCrAttendanceInstance]
    }

    def edit(HrCrAttendance hrCrAttendanceInstance) {
        [hrCrAttendanceInstance : hrCrAttendanceInstance]
    }

    @Transactional
    update(HrCrAttendance hrCrAttendanceInstance) {
        if (hrCrAttendanceInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-HrCrAttendance : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (hrCrAttendanceInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [hrCrAttendanceInstance: hrCrAttendanceInstance])
                return
            }
        }

        bindData(hrCrAttendanceInstance, ['logModifiedBy', 'timeIn', 'timeOut', 'hrEmployeeCode', 'logModifiedDate', 'prlPeriod'])
        hrCrAttendanceInstance.logModifiedBy            = currentUser
        hrCrAttendanceInstance.logModifiedDate          = currentDate
        hrCrAttendanceInstance.hrEmployeeCode           = hrCrAttendanceInstance.hrEmployee.code
        params.timeIn  ? hrCrAttendanceInstance.timeIn  = dateTimeParseFormat.parse(params.timeIn ) : null
        params.timeOut ? hrCrAttendanceInstance.timeOut = dateTimeParseFormat.parse(params.timeOut) : null
        try {
            hrCrAttendanceInstance.prlPeriod            = PrlPeriod.findByKeyword(new SimpleDateFormat("YYYY-MM").format(hrCrAttendanceInstance.timeIn))
        } catch (Exception e) {
            println e
        }
        
        hrCrAttendanceInstance.validate()
        if (hrCrAttendanceInstance.hasErrors()) {
            flash.exception = "ER-U2-HrCrAttendance:"
            trackerService.logError([errorMessage: hrCrAttendanceInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [hrCrAttendanceInstance: hrCrAttendanceInstance])
            return
        }
        try {
            hrCrAttendanceInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-HrCrAttendance : " + e
            render(view: "edit", model: [hrCrAttendanceInstance: hrCrAttendanceInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.hrCrAttendance.pageTitle", default: "HrCrAttendance"), hrCrAttendanceInstance.id])
                redirect hrCrAttendanceInstance
            }
            '*'{ respond hrCrAttendanceInstance, [status: OK] }
        }
    }

    @Transactional
    delete(HrCrAttendance hrCrAttendanceInstance) {
        if (hrCrAttendanceInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-HrCrAttendance : Record not found...!")
            redirect(action: "index")
        }
        try {
            hrCrAttendanceInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-HrCrAttendance : " + e
            redirect(action: "index")
        }
    }

    @Transactional
    submit(HrCrAttendance hrCrAttendanceInstance) {
        if (hrCrAttendanceInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-HrCrAttendance : Record not found...!")
            redirect(action: "index")
        }
        try {
            bindData(hrCrAttendanceInstance, ['isSubmitted', 'logSubmittedBy', 'logSubmittedAt'])

            hrCrAttendanceInstance.isSubmitted    = true
            hrCrAttendanceInstance.logSubmittedBy = currentUser
            hrCrAttendanceInstance.logSubmittedAt = currentDate
            hrCrAttendanceInstance.approvalStage  = ApprovalStage.SUBMITTED

            hrCrAttendanceInstance.save(flush:true, failOnError: true)

            flash.success = 'Record submitted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-S2-HrCrAttendance : " + e
            redirect(action: "index")
        }
    }

    def createWeekly() {
        [hrCrAttendanceInstance : new HrCrAttendance(params), weeklyAttendanceList: getWeeklyAttendanceList(), hrEmployee: authUserLkEmployee?.hrEmployee]
    }

    List<HrCrAttendance> getWeeklyAttendanceList(){
        List<HrCrAttendance> weeklyAttendanceList = new ArrayList()
        for (String date in calendarService.getDaysOfCurrentWeek()){
            println date
            String query = "SELECT ID FROM HR_CR_ATTENDANCE A WHERE 1 = 1 AND HR_EMPLOYEE_ID = :HR_EMPLOYEE_ID AND TO_CHAR (TIME_IN, 'RRRR-MM-DD') = :TIME_IN"
            def existingAttendance
            try {
                existingAttendance = dbService.getResultSet(query, ["HR_EMPLOYEE_ID": authUserLkEmployee?.hrEmployee?.id, "TIME_IN": date])[0]["ID"]
            } catch (Exception e) {
                //println e
            }
            if(existingAttendance){
                weeklyAttendanceList.add(HrCrAttendance.get(existingAttendance))
            }
            else{
                weeklyAttendanceList.add(new HrCrAttendance([hrEmployee: authUserLkEmployee?.hrEmployee, hrEmployeeCode: authUserLkEmployee?.hrEmployee?.code, timeIn: new SimpleDateFormat("yyyy-MM-dd").parse(date)]))
            }
        }
        //println weeklyAttendanceList

        return weeklyAttendanceList
    }

    @Transactional
    saveWeeklyEntries() {
        int i = 0
        while (params["hrCrAttendance[" + i + "]"]) {
            HrCrAttendance hrCrAttendanceInstance
            Map hrCrAttendanceParams = params["hrCrAttendance[" + i + "]"]

            if (hrCrAttendanceParams?.id) {
                hrCrAttendanceInstance                 = HrCrAttendance.get(hrCrAttendanceParams?.id)
                hrCrAttendanceInstance.logModifiedBy   = currentUser
                hrCrAttendanceInstance.logModifiedDate = currentDate
            }
            else{
                hrCrAttendanceParams.logCreatedBy = currentUser
                hrCrAttendanceInstance            = new HrCrAttendance(hrCrAttendanceParams)
            }

            bindData(hrCrAttendanceInstance, ['remarks', 'timeBreak', 'effectiveWorkingHour', 'timeIn', 'timeOut', 'hrEmployeeCode', 'prlPeriod', 'approvalStage'])
            hrCrAttendanceInstance.hrEmployeeCode     = hrCrAttendanceInstance.hrEmployee.code
            hrCrAttendanceParams.remarks              ? hrCrAttendanceInstance.remarks              = hrCrAttendanceParams.remarks                                : null
            hrCrAttendanceParams.timeBreak            ? hrCrAttendanceInstance.timeBreak            = Float.parseFloat(hrCrAttendanceParams.timeBreak           ) : null
            hrCrAttendanceParams.effectiveWorkingHour ? hrCrAttendanceInstance.effectiveWorkingHour = Float.parseFloat(hrCrAttendanceParams.effectiveWorkingHour) : null
            hrCrAttendanceParams.timeIn               ? hrCrAttendanceInstance.timeIn               = dateTimeParseFormat.parse(hrCrAttendanceParams.timeIn     ) : null
            hrCrAttendanceParams.timeOut              ? hrCrAttendanceInstance.timeOut              = dateTimeParseFormat.parse(hrCrAttendanceParams.timeOut    ) : null
            hrCrAttendanceParams.approvalStage        ? hrCrAttendanceInstance.approvalStage        = ApprovalStage.valueOf(hrCrAttendanceParams.approvalStage  ) : null

            if (hrCrAttendanceInstance?.approvalStage.equals(ApprovalStage.SUBMITTED)) {
                hrCrAttendanceInstance.isSubmitted    = true
                hrCrAttendanceInstance.logSubmittedBy = currentUser
                hrCrAttendanceInstance.logSubmittedAt = currentDate
            }

            try {
                hrCrAttendanceInstance.prlPeriod = PrlPeriod.findByKeyword(new SimpleDateFormat("YYYY-MM").format(hrCrAttendanceInstance.timeIn))
            } catch (Exception e) {
                println e
            }

            hrCrAttendanceInstance.validate()

            if (hrCrAttendanceInstance.hasErrors()) {
                flash.exception = "ER-S2-HrCrAttendance:"
                trackerService.logError([errorMessage: hrCrAttendanceInstance?.errors?.fieldErrors, request: request, params: hrCrAttendanceParams, currentUser: currentUser])
                render(view: "createWeekly", model: [hrCrAttendanceInstance: hrCrAttendanceInstance])
                return
            }
            try {
                hrCrAttendanceInstance.save(flush: true, failOnError: true)
            }
            catch (Exception e) {
                flash.exception = "EX-S1-HrCrAttendance : " + e
                render(view: "createWeekly", model: [hrCrAttendanceInstance: hrCrAttendanceInstance])
                return
            }

            i++
        }
        flash.success = "Attendance taken successfully!"
        redirect(action: "createWeekly")
    }
}
