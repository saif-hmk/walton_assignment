/**
 * @Created_By : AALAA
 * @Date       : 2022.06.20 11:30:07 AM
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
class ComUnitOfMeasurementCategoryController {
    //static allowedMethods = [save: "POST", update: "PUT"]

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
        [comUnitOfMeasurementCategoryInstanceList: ComUnitOfMeasurementCategory.list(params)]
    }

    def create() {
        [comUnitOfMeasurementCategoryInstance : new ComUnitOfMeasurementCategory(params)]
    }

    @Transactional
    save(ComUnitOfMeasurementCategory comUnitOfMeasurementCategoryInstance) {
        if (comUnitOfMeasurementCategoryInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-ComUnitOfMeasurementCategory : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(comUnitOfMeasurementCategoryInstance, ['logCreatedBy'])
        comUnitOfMeasurementCategoryInstance.logCreatedBy = currentUser
        
        comUnitOfMeasurementCategoryInstance.validate()
        if (comUnitOfMeasurementCategoryInstance.hasErrors()) {
            flash.exception = "ER-S2-ComUnitOfMeasurementCategory:"
            //trackerService.logError([errorMessage: comUnitOfMeasurementCategoryInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [comUnitOfMeasurementCategoryInstance: comUnitOfMeasurementCategoryInstance])
            return
        }
        try {
            comUnitOfMeasurementCategoryInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-ComUnitOfMeasurementCategory : " + e
            render(view: "create", model: [comUnitOfMeasurementCategoryInstance: comUnitOfMeasurementCategoryInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.comUnitOfMeasurementCategory.pageTitle", default: "ComUnitOfMeasurementCategory"), comUnitOfMeasurementCategoryInstance.id])
                redirect comUnitOfMeasurementCategoryInstance
            }
            '*' { respond comUnitOfMeasurementCategoryInstance, [status: CREATED] }
        }
    }

    def show(ComUnitOfMeasurementCategory comUnitOfMeasurementCategoryInstance) {
        [comUnitOfMeasurementCategoryInstance : comUnitOfMeasurementCategoryInstance]
    }

    def edit(ComUnitOfMeasurementCategory comUnitOfMeasurementCategoryInstance) {
        [comUnitOfMeasurementCategoryInstance : comUnitOfMeasurementCategoryInstance]
    }

    @Transactional
    update(ComUnitOfMeasurementCategory comUnitOfMeasurementCategoryInstance) {
        if (comUnitOfMeasurementCategoryInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-ComUnitOfMeasurementCategory : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (comUnitOfMeasurementCategoryInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [comUnitOfMeasurementCategoryInstance: comUnitOfMeasurementCategoryInstance])
                return
            }
        }
        
        comUnitOfMeasurementCategoryInstance.logModifiedBy   = currentUser
        comUnitOfMeasurementCategoryInstance.logModifiedDate = currentDate
        
        comUnitOfMeasurementCategoryInstance.validate()
        if (comUnitOfMeasurementCategoryInstance.hasErrors()) {
            flash.exception = "ER-U2-ComUnitOfMeasurementCategory:"
            //trackerService.logError([errorMessage: comUnitOfMeasurementCategoryInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [comUnitOfMeasurementCategoryInstance: comUnitOfMeasurementCategoryInstance])
            return
        }
        try {
            comUnitOfMeasurementCategoryInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-ComUnitOfMeasurementCategory : " + e
            render(view: "edit", model: [comUnitOfMeasurementCategoryInstance: comUnitOfMeasurementCategoryInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.comUnitOfMeasurementCategory.pageTitle", default: "ComUnitOfMeasurementCategory"), comUnitOfMeasurementCategoryInstance.id])
                redirect comUnitOfMeasurementCategoryInstance
            }
            '*'{ respond comUnitOfMeasurementCategoryInstance, [status: OK] }
        }
    }

    @Transactional
    delete(ComUnitOfMeasurementCategory comUnitOfMeasurementCategoryInstance) {
        if (comUnitOfMeasurementCategoryInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-ComUnitOfMeasurementCategory : Record not found...!")
            redirect(action: "index")
        }
        try {
            comUnitOfMeasurementCategoryInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-ComUnitOfMeasurementCategory : " + e
            redirect(action: "index")
        }
    }
}
