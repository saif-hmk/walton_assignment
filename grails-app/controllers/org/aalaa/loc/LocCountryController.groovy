/**
 * @Created_By : AALAA
 * @Date       : 2022.07.25 11:26:41 PM
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
class LocCountryController {
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
        /*
        String orderBy   = params.sort  ?: 'name',
               direction = params.order ?: 'asc'   //asc
        List<LocCountry> locCountryInstanceList = LocCountry.createCriteria().list(params) {
            if(params.locAdmAreaType)
                eq('locAdmAreaType', LocAdmAreaType.COUNTRY)
            order(orderBy, direction)
        }

        [locCountryInstanceList: locCountryInstanceList]
        */
        [locCountryInstanceList: LocCountry.list(params)]
    }

    def create() {
        [locCountryInstance : new LocCountry(params)]
    }

    @Transactional
    save(LocCountry locCountryInstance) {
        if (locCountryInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-LocCountry : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(locCountryInstance, ['logCreatedBy'])
        locCountryInstance.logCreatedBy = currentUser
        
        locCountryInstance.validate()
        if (locCountryInstance.hasErrors()) {
            flash.exception = "ER-S2-LocCountry:"
            trackerService.logError([errorMessage: locCountryInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [locCountryInstance: locCountryInstance])
            return
        }
        try {
            locCountryInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-LocCountry : " + e
            render(view: "create", model: [locCountryInstance: locCountryInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.locCountry.pageTitle", default: "LocCountry"), locCountryInstance.id])
                redirect locCountryInstance
            }
            '*' { respond locCountryInstance, [status: CREATED] }
        }
    }

    def show(LocCountry locCountryInstance) {
        [locCountryInstance : locCountryInstance]
    }

    def edit(LocCountry locCountryInstance) {
        [locCountryInstance : locCountryInstance]
    }

    @Transactional
    update(LocCountry locCountryInstance) {
        if (locCountryInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-LocCountry : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (locCountryInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [locCountryInstance: locCountryInstance])
                return
            }
        }
        
        locCountryInstance.logModifiedBy   = currentUser
        locCountryInstance.logModifiedDate = currentDate
        
        locCountryInstance.validate()
        if (locCountryInstance.hasErrors()) {
            flash.exception = "ER-U2-LocCountry:"
            trackerService.logError([errorMessage: locCountryInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [locCountryInstance: locCountryInstance])
            return
        }
        try {
            locCountryInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-LocCountry : " + e
            render(view: "edit", model: [locCountryInstance: locCountryInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.locCountry.pageTitle", default: "LocCountry"), locCountryInstance.id])
                redirect locCountryInstance
            }
            '*'{ respond locCountryInstance, [status: OK] }
        }
    }

    @Transactional
    delete(LocCountry locCountryInstance) {
        if (locCountryInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-LocCountry : Record not found...!")
            redirect(action: "index")
        }
        try {
            locCountryInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-LocCountry : " + e
            redirect(action: "index")
        }
    }
}
