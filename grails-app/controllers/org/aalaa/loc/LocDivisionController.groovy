/**
 * @Created_By : AALAA
 * @Date       : 2022.07.25 11:28:38 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.aalaa.loc

import grails.plugin.springsecurity.SpringSecurityService
import org.aalaa.auth.AuthUser
import org.aalaa.sys.TrackerService
import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LocDivisionController {
    //static allowedMethods = [save: "POST", update: "PUT"]

    AuthUser              currentUser
    Date                  currentDate
    SimpleDateFormat      dateParseFormat
    TrackerService        trackerService
    SpringSecurityService springSecurityService

    def beforeInterceptor = {
        currentDate     = new Date()
        currentUser     = springSecurityService.getCurrentUser()
        dateParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
    }

    def index(Integer max) {
        [locDivisionInstanceList: LocDivision.list(params)]
    }

    def create() {
        [locDivisionInstance : new LocDivision(params)]
    }

    @Transactional
    save(LocDivision locDivisionInstance) {
        if (locDivisionInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-LocDivision : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(locDivisionInstance, ['logCreatedBy'])
        locDivisionInstance.logCreatedBy = currentUser
        
        locDivisionInstance.validate()
        if (locDivisionInstance.hasErrors()) {
            flash.exception = "ER-S2-LocDivision:"
            trackerService.logError([errorMessage: locDivisionInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [locDivisionInstance: locDivisionInstance])
            return
        }
        try {
            locDivisionInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-LocDivision : " + e
            render(view: "create", model: [locDivisionInstance: locDivisionInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.locDivision.pageTitle", default: "LocDivision"), locDivisionInstance.id])
                redirect locDivisionInstance
            }
            '*' { respond locDivisionInstance, [status: CREATED] }
        }
    }

    def show(LocDivision locDivisionInstance) {
        [locDivisionInstance : locDivisionInstance]
    }

    def edit(LocDivision locDivisionInstance) {
        [locDivisionInstance : locDivisionInstance]
    }

    @Transactional
    update(LocDivision locDivisionInstance) {
        if (locDivisionInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-LocDivision : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (locDivisionInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [locDivisionInstance: locDivisionInstance])
                return
            }
        }
        
        locDivisionInstance.logModifiedBy   = currentUser
        locDivisionInstance.logModifiedDate = currentDate
        
        locDivisionInstance.validate()
        if (locDivisionInstance.hasErrors()) {
            flash.exception = "ER-U2-LocDivision:"
            trackerService.logError([errorMessage: locDivisionInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [locDivisionInstance: locDivisionInstance])
            return
        }
        try {
            locDivisionInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-LocDivision : " + e
            render(view: "edit", model: [locDivisionInstance: locDivisionInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.locDivision.pageTitle", default: "LocDivision"), locDivisionInstance.id])
                redirect locDivisionInstance
            }
            '*'{ respond locDivisionInstance, [status: OK] }
        }
    }

    @Transactional
    delete(LocDivision locDivisionInstance) {
        if (locDivisionInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-LocDivision : Record not found...!")
            redirect(action: "index")
        }
        try {
            locDivisionInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-LocDivision : " + e
            redirect(action: "index")
        }
    }
}
