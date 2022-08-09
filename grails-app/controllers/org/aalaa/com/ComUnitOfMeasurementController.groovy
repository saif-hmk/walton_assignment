/**
 * @Created_By : AALAA
 * @Date       : 2022.06.15 05:52:07 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.aalaa.com

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.aalaa.auth.AuthUser

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.OK

@Transactional(readOnly = true)
class ComUnitOfMeasurementController {

    AuthUser currentUser
    Date                  currentDate
    SimpleDateFormat      dateParseFormat
    SpringSecurityService springSecurityService

    def beforeInterceptor = {
        currentDate     = new Date()
        currentUser     = springSecurityService.getCurrentUser()
        dateParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
    }

    def index(Integer max) {
        [comUnitOfMeasurementInstanceList: ComUnitOfMeasurement.list(params)]
    }

    def create() {
        List<ComUnitOfMeasurement> comUnitOfMeasurementList = ComUnitOfMeasurement.createCriteria().list {
            eq("active", true)
            order("measurementCategory", "asc")
            order("title", "asc")
        }
        [comUnitOfMeasurementInstance: new ComUnitOfMeasurement(params), comUnitOfMeasurementList: comUnitOfMeasurementList]
    }

    @Transactional
    save(ComUnitOfMeasurement comUnitOfMeasurementInstance) {
        if (comUnitOfMeasurementInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-ComUnitOfMeasurement : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(comUnitOfMeasurementInstance, ['logCreatedBy'])
        comUnitOfMeasurementInstance.logCreatedBy = currentUser
        
        comUnitOfMeasurementInstance.validate()
        if (comUnitOfMeasurementInstance.hasErrors()) {
            flash.exception = "ER-S2-ComUnitOfMeasurement:"
            //trackerService.logError([errorMessage: comUnitOfMeasurementInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [comUnitOfMeasurementInstance: comUnitOfMeasurementInstance])
            return
        }
        try {
            comUnitOfMeasurementInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-ComUnitOfMeasurement : " + e
            render(view: "create", model: [comUnitOfMeasurementInstance: comUnitOfMeasurementInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.comUnitOfMeasurement.pageTitle", default: "ComUnitOfMeasurement"), comUnitOfMeasurementInstance.id])
                redirect comUnitOfMeasurementInstance
            }
            '*' { respond comUnitOfMeasurementInstance, [status: CREATED] }
        }
    }

    def show(ComUnitOfMeasurement comUnitOfMeasurementInstance) {
        [comUnitOfMeasurementInstance : comUnitOfMeasurementInstance]
    }

    def edit(ComUnitOfMeasurement comUnitOfMeasurementInstance) {
        List<ComUnitOfMeasurement> comUnitOfMeasurementList = ComUnitOfMeasurement.createCriteria().list {
            eq("active", true)
            order("measurementCategory", "asc")
            order("title", "asc")
        }
        [comUnitOfMeasurementInstance : comUnitOfMeasurementInstance, comUnitOfMeasurementList: comUnitOfMeasurementList]
    }

    @Transactional
    update(ComUnitOfMeasurement comUnitOfMeasurementInstance) {
        if (comUnitOfMeasurementInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-ComUnitOfMeasurement : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (comUnitOfMeasurementInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [comUnitOfMeasurementInstance: comUnitOfMeasurementInstance])
                return
            }
        }
        
        comUnitOfMeasurementInstance.logModifiedBy   = currentUser
        comUnitOfMeasurementInstance.logModifiedDate = currentDate
        
        comUnitOfMeasurementInstance.validate()
        if (comUnitOfMeasurementInstance.hasErrors()) {
            flash.exception = "ER-U2-ComUnitOfMeasurement:"
            //trackerService.logError([errorMessage: comUnitOfMeasurementInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [comUnitOfMeasurementInstance: comUnitOfMeasurementInstance])
            return
        }
        try {
            comUnitOfMeasurementInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-ComUnitOfMeasurement : " + e
            render(view: "edit", model: [comUnitOfMeasurementInstance: comUnitOfMeasurementInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.comUnitOfMeasurement.pageTitle", default: "ComUnitOfMeasurement"), comUnitOfMeasurementInstance.id])
                redirect comUnitOfMeasurementInstance
            }
            '*'{ respond comUnitOfMeasurementInstance, [status: OK] }
        }
    }

    @Transactional
    delete(ComUnitOfMeasurement comUnitOfMeasurementInstance) {
        if (comUnitOfMeasurementInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-ComUnitOfMeasurement : Record not found...!")
            redirect(action: "index")
        }
        try {
            comUnitOfMeasurementInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-ComUnitOfMeasurement : " + e
            redirect(action: "index")
        }
    }
}
