/**
 * @Created_By : AALAA
 * @Date       : 2022.07.02 02:44:50 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.aalaa.adm

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.aalaa.adm.AdmContentCategory
import org.aalaa.auth.AuthUser

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.OK

@Transactional(readOnly = true)
class AdmContentCategoryController {
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
        [admContentCategoryInstanceList: AdmContentCategory.list(params)]
    }

    def create() {
        [admContentCategoryInstance : new AdmContentCategory(params)]
    }

    @Transactional
    save(AdmContentCategory admContentCategoryInstance) {
        if (admContentCategoryInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-AdmContentCategory : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(admContentCategoryInstance, ['logCreatedBy'])
        admContentCategoryInstance.logCreatedBy = currentUser
        
        admContentCategoryInstance.validate()
        if (admContentCategoryInstance.hasErrors()) {
            flash.exception = "ER-S2-AdmContentCategory:"
            render(view: "create", model: [admContentCategoryInstance: admContentCategoryInstance])
            return
        }
        try {
            admContentCategoryInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-AdmContentCategory : " + e
            render(view: "create", model: [admContentCategoryInstance: admContentCategoryInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.admContentCategory.pageTitle", default: "AdmContentCategory"), admContentCategoryInstance.id])
                redirect admContentCategoryInstance
            }
            '*' { respond admContentCategoryInstance, [status: CREATED] }
        }
    }

    def show(AdmContentCategory admContentCategoryInstance) {
        [admContentCategoryInstance : admContentCategoryInstance]
    }

    def edit(AdmContentCategory admContentCategoryInstance) {
        [admContentCategoryInstance : admContentCategoryInstance]
    }

    @Transactional
    update(AdmContentCategory admContentCategoryInstance) {
        if (admContentCategoryInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-AdmContentCategory : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (admContentCategoryInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [admContentCategoryInstance: admContentCategoryInstance])
                return
            }
        }
        
        admContentCategoryInstance.logModifiedBy   = currentUser
        admContentCategoryInstance.logModifiedDate = currentDate
        
        admContentCategoryInstance.validate()
        if (admContentCategoryInstance.hasErrors()) {
            flash.exception = "ER-U2-AdmContentCategory:"
            render(view: "edit", model: [admContentCategoryInstance: admContentCategoryInstance])
            return
        }
        try {
            admContentCategoryInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-AdmContentCategory : " + e
            render(view: "edit", model: [admContentCategoryInstance: admContentCategoryInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.admContentCategory.pageTitle", default: "AdmContentCategory"), admContentCategoryInstance.id])
                redirect admContentCategoryInstance
            }
            '*'{ respond admContentCategoryInstance, [status: OK] }
        }
    }

    @Transactional
    delete(AdmContentCategory admContentCategoryInstance) {
        if (admContentCategoryInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-AdmContentCategory : Record not found...!")
            redirect(action: "index")
        }
        try {
            admContentCategoryInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-AdmContentCategory : " + e
            redirect(action: "index")
        }
    }
}
