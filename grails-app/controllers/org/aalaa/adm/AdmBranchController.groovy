/**
 * @Created_By : AALAA
 * @Date       : 2021.10.26 08:18:46 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.aalaa.adm

import grails.plugin.springsecurity.SpringSecurityService
import org.aalaa.auth.AuthUser
import org.aalaa.sys.SystemService
import org.aalaa.sys.TrackerService
import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AdmBranchController {
    //static allowedMethods = [save: "POST", update: "PUT"]

    AuthUser              currentUser
    Date                  currentDate
    SimpleDateFormat      dateParseFormat
    TrackerService        trackerService
    SpringSecurityService springSecurityService
    SystemService         systemService
    AdmOrganization       currentUserOrganization
    List<AdmBranch>       currentUserBranches = new ArrayList()

    def beforeInterceptor = {
        currentUserOrganization = session.getAttribute("USER_ORGANIZATION")
        currentUserBranches     = session.getAttribute("USER_BRANCHES")
        currentDate             = new Date()
        currentUser             = springSecurityService.getCurrentUser()
        dateParseFormat         = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
    }

    def index(Integer max) {
        [admBranchInstanceList: systemService.getUserBranchList()]
    }

    def create() {
        [admBranchInstance: new AdmBranch(params), currentUserOrganization: currentUserOrganization]
    }

    @Transactional
    save(AdmBranch admBranchInstance) {
        if (admBranchInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-ComBranch : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(admBranchInstance, ['logCreatedBy'])
        admBranchInstance.logCreatedBy = currentUser
        
        admBranchInstance.validate()
        if (admBranchInstance.hasErrors()) {
            flash.exception = "ER-S2-ComBranch:"
            trackerService.logError([errorMessage: admBranchInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [admBranchInstance: admBranchInstance])
            return
        }
        try {
            admBranchInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-ComBranch : " + e
            render(view: "create", model: [admBranchInstance: admBranchInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.admBranch.pageTitle", default: "ComBranch"), admBranchInstance.id])
                redirect admBranchInstance
            }
            '*' { respond admBranchInstance, [status: CREATED] }
        }
    }

    def show(AdmBranch admBranchInstance) {
        [admBranchInstance : admBranchInstance]
    }

    def edit(AdmBranch admBranchInstance) {
        [admBranchInstance : admBranchInstance, currentUserOrganization: currentUserOrganization]
    }

    @Transactional
    update(AdmBranch admBranchInstance) {
        if (admBranchInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-ComBranch : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (admBranchInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [admBranchInstance: admBranchInstance])
                return
            }
        }
        
        admBranchInstance.logModifiedBy   = currentUser
        admBranchInstance.logModifiedDate = currentDate
        
        admBranchInstance.validate()
        if (admBranchInstance.hasErrors()) {
            flash.exception = "ER-U2-ComBranch:"
            trackerService.logError([errorMessage: admBranchInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [admBranchInstance: admBranchInstance])
            return
        }
        try {
            admBranchInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-ComBranch : " + e
            render(view: "edit", model: [admBranchInstance: admBranchInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.admBranch.pageTitle", default: "ComBranch"), admBranchInstance.id])
                redirect admBranchInstance
            }
            '*'{ respond admBranchInstance, [status: OK] }
        }
    }

    @Transactional
    delete(AdmBranch admBranchInstance) {
        if (admBranchInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-ComBranch : Record not found...!")
            redirect(action: "index")
        }
        try {
            admBranchInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-ComBranch : " + e
            redirect(action: "index")
        }
    }
}
