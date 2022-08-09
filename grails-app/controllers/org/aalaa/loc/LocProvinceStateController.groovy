/**
 * @Created_By : AALAA
 * @Date       : 2022.07.25 11:27:40 PM
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
class LocProvinceStateController {
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
        [locProvinceStateInstanceList: LocProvinceState.list(params)]
    }

    def create() {
        [locProvinceStateInstance : new LocProvinceState(params)]
    }

    @Transactional
    save(LocProvinceState locProvinceStateInstance) {
        if (locProvinceStateInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-LocProvinceState : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(locProvinceStateInstance, ['logCreatedBy'])
        locProvinceStateInstance.logCreatedBy = currentUser
        
        locProvinceStateInstance.validate()
        if (locProvinceStateInstance.hasErrors()) {
            flash.exception = "ER-S2-LocProvinceState:"
            trackerService.logError([errorMessage: locProvinceStateInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [locProvinceStateInstance: locProvinceStateInstance])
            return
        }
        try {
            locProvinceStateInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-LocProvinceState : " + e
            render(view: "create", model: [locProvinceStateInstance: locProvinceStateInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.locProvinceState.pageTitle", default: "LocProvinceState"), locProvinceStateInstance.id])
                redirect locProvinceStateInstance
            }
            '*' { respond locProvinceStateInstance, [status: CREATED] }
        }
    }

    def show(LocProvinceState locProvinceStateInstance) {
        [locProvinceStateInstance : locProvinceStateInstance]
    }

    def edit(LocProvinceState locProvinceStateInstance) {
        [locProvinceStateInstance : locProvinceStateInstance]
    }

    @Transactional
    update(LocProvinceState locProvinceStateInstance) {
        if (locProvinceStateInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-LocProvinceState : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (locProvinceStateInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [locProvinceStateInstance: locProvinceStateInstance])
                return
            }
        }
        
        locProvinceStateInstance.logModifiedBy   = currentUser
        locProvinceStateInstance.logModifiedDate = currentDate
        
        locProvinceStateInstance.validate()
        if (locProvinceStateInstance.hasErrors()) {
            flash.exception = "ER-U2-LocProvinceState:"
            trackerService.logError([errorMessage: locProvinceStateInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [locProvinceStateInstance: locProvinceStateInstance])
            return
        }
        try {
            locProvinceStateInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-LocProvinceState : " + e
            render(view: "edit", model: [locProvinceStateInstance: locProvinceStateInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.locProvinceState.pageTitle", default: "LocProvinceState"), locProvinceStateInstance.id])
                redirect locProvinceStateInstance
            }
            '*'{ respond locProvinceStateInstance, [status: OK] }
        }
    }

    @Transactional
    delete(LocProvinceState locProvinceStateInstance) {
        if (locProvinceStateInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-LocProvinceState : Record not found...!")
            redirect(action: "index")
        }
        try {
            locProvinceStateInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-LocProvinceState : " + e
            redirect(action: "index")
        }
    }
}
