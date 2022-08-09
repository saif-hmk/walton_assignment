/**
 * @Created_By : AALAA
 * @Date       : 2022.07.26 09:57:43 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.aalaa.adm

import grails.plugin.springsecurity.SpringSecurityService
import org.aalaa.auth.AuthUser
import org.aalaa.sys.TrackerService
import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AdmVendorOrganizationController {
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
        [admVendorOrganizationInstanceList: AdmVendorOrganization.list(params)]
    }

    def create() {
        [admVendorOrganizationInstance : new AdmVendorOrganization(params)]
    }

    @Transactional
    save(AdmVendorOrganization admVendorOrganizationInstance) {
        if (admVendorOrganizationInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-AdmVendorOrganization : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(admVendorOrganizationInstance, ['logCreatedBy'])
        admVendorOrganizationInstance.logCreatedBy = currentUser
        
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      admBranch
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        admVendorOrganizationInstance.admBranch = null
        int i = 0
        while (params["admBranch[" + i + "]"]) {
            org.aalaa.adm.AdmBranch admBranch
            Map admBranchParams = params["admBranch[" + i + "]"]
        
            if (admBranchParams?.id) {
                admBranch = org.aalaa.adm.AdmBranch.get(admBranchParams?.id)
            }else{
                admBranch = new org.aalaa.adm.AdmBranch(admBranchParams)
            }
            admBranch.validate()
            admVendorOrganizationInstance.addToComBranch(admBranch)
            i++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------

        admVendorOrganizationInstance.validate()
        if (admVendorOrganizationInstance.hasErrors()) {
            flash.exception = "ER-S2-AdmVendorOrganization:"
            trackerService.logError([errorMessage: admVendorOrganizationInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [admVendorOrganizationInstance: admVendorOrganizationInstance])
            return
        }
        try {
            admVendorOrganizationInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-AdmVendorOrganization : " + e
            render(view: "create", model: [admVendorOrganizationInstance: admVendorOrganizationInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.admVendorOrganization.pageTitle", default: "AdmVendorOrganization"), admVendorOrganizationInstance.id])
                redirect admVendorOrganizationInstance
            }
            '*' { respond admVendorOrganizationInstance, [status: CREATED] }
        }
    }

    def show(AdmVendorOrganization admVendorOrganizationInstance) {
        [admVendorOrganizationInstance : admVendorOrganizationInstance]
    }

    def edit(AdmVendorOrganization admVendorOrganizationInstance) {
        [admVendorOrganizationInstance : admVendorOrganizationInstance]
    }

    @Transactional
    update(AdmVendorOrganization admVendorOrganizationInstance) {
        if (admVendorOrganizationInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-AdmVendorOrganization : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (admVendorOrganizationInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [admVendorOrganizationInstance: admVendorOrganizationInstance])
                return
            }
        }
        
        admVendorOrganizationInstance.logModifiedBy   = currentUser
        admVendorOrganizationInstance.logModifiedDate = currentDate
        
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      admBranch
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        admVendorOrganizationInstance.admBranch = null
        int i = 0
        while (params["admBranch[" + i + "]"]) {
            org.aalaa.adm.AdmBranch admBranch
            Map admBranchParams = params["admBranch[" + i + "]"]
        
            if (admBranchParams?.id) {
                admBranch = org.aalaa.adm.AdmBranch.get(admBranchParams?.id)
            }else{
                admBranch = new org.aalaa.adm.AdmBranch(admBranchParams)
            }
            admBranch.validate()
            admVendorOrganizationInstance.addToComBranch(admBranch)
            i++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------

        admVendorOrganizationInstance.validate()
        if (admVendorOrganizationInstance.hasErrors()) {
            flash.exception = "ER-U2-AdmVendorOrganization:"
            trackerService.logError([errorMessage: admVendorOrganizationInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [admVendorOrganizationInstance: admVendorOrganizationInstance])
            return
        }
        try {
            admVendorOrganizationInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-AdmVendorOrganization : " + e
            render(view: "edit", model: [admVendorOrganizationInstance: admVendorOrganizationInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.admVendorOrganization.pageTitle", default: "AdmVendorOrganization"), admVendorOrganizationInstance.id])
                redirect admVendorOrganizationInstance
            }
            '*'{ respond admVendorOrganizationInstance, [status: OK] }
        }
    }

    @Transactional
    delete(AdmVendorOrganization admVendorOrganizationInstance) {
        if (admVendorOrganizationInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-AdmVendorOrganization : Record not found...!")
            redirect(action: "index")
        }
        try {
            admVendorOrganizationInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-AdmVendorOrganization : " + e
            redirect(action: "index")
        }
    }
}
