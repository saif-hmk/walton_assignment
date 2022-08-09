/**
 * @Created_By : AALAA
 * @Date       : 2022.07.23 12:14:01 AM
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
class AdmDesignationController {
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
        Integer defMin   = params.min ? Integer.parseInt(params.min) : grailsApplication.config.show.item.min,
                defMax   = params.max ? Integer.parseInt(params.max) : grailsApplication.config.show.item.max
        params.max       = Math.min(max ?: defMin, defMax)
        String orderBy   = params.sort  ?: 'id',
               direction = params.order ?: 'desc'   //asc
        List<AdmDesignation> admDesignationInstanceList = AdmDesignation.createCriteria().list(params) {
            if(params.active)
                eq('active', true)
            if(params.admDepartment)
                eq('admDepartment', org.aalaa.adm.AdmDepartment.get(params.admDepartment))
            if(params.admVendorOrganization)
                eq('admVendorOrganization', org.aalaa.adm.AdmOrganization.get(params.admVendorOrganization))
            if(params.keyword)
                ilike('keyword', '%' + params.keyword + '%')
            if(params.remarks)
                ilike('remarks', '%' + params.remarks + '%')
            if(params.title)
                ilike('title', '%' + params.title + '%')
            if(params.titleNative)
                ilike('titleNative', '%' + params.titleNative + '%')
            if(params.titleShort)
                ilike('titleShort', '%' + params.titleShort + '%')
            if(params.titleShortNative)
                ilike('titleShortNative', '%' + params.titleShortNative + '%')
            order(orderBy, direction)
        }

        [admDesignationInstanceList: admDesignationInstanceList, admDesignationInstanceTotal: admDesignationInstanceList.getTotalCount()]
        */
        [admDesignationInstanceList: AdmDesignation.list(params)]
    }

    def create() {
        [admDesignationInstance : new AdmDesignation(params)]
    }

    @Transactional
    save(AdmDesignation admDesignationInstance) {
        if (admDesignationInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-AdmDesignation : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(admDesignationInstance, ['logCreatedBy'])
        admDesignationInstance.logCreatedBy = currentUser
        
        admDesignationInstance.validate()
        if (admDesignationInstance.hasErrors()) {
            flash.exception = "ER-S2-AdmDesignation:"
            trackerService.logError([errorMessage: admDesignationInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [admDesignationInstance: admDesignationInstance])
            return
        }
        try {
            admDesignationInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-AdmDesignation : " + e
            render(view: "create", model: [admDesignationInstance: admDesignationInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.admDesignation.pageTitle", default: "AdmDesignation"), admDesignationInstance.id])
                redirect admDesignationInstance
            }
            '*' { respond admDesignationInstance, [status: CREATED] }
        }
    }

    def show(AdmDesignation admDesignationInstance) {
        [admDesignationInstance : admDesignationInstance]
    }

    def edit(AdmDesignation admDesignationInstance) {
        [admDesignationInstance : admDesignationInstance]
    }

    @Transactional
    update(AdmDesignation admDesignationInstance) {
        if (admDesignationInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-AdmDesignation : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (admDesignationInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [admDesignationInstance: admDesignationInstance])
                return
            }
        }
        
        admDesignationInstance.logModifiedBy   = currentUser
        admDesignationInstance.logModifiedDate = currentDate
        
        admDesignationInstance.validate()
        if (admDesignationInstance.hasErrors()) {
            flash.exception = "ER-U2-AdmDesignation:"
            trackerService.logError([errorMessage: admDesignationInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [admDesignationInstance: admDesignationInstance])
            return
        }
        try {
            admDesignationInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-AdmDesignation : " + e
            render(view: "edit", model: [admDesignationInstance: admDesignationInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.admDesignation.pageTitle", default: "AdmDesignation"), admDesignationInstance.id])
                redirect admDesignationInstance
            }
            '*'{ respond admDesignationInstance, [status: OK] }
        }
    }

    @Transactional
    delete(AdmDesignation admDesignationInstance) {
        if (admDesignationInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-AdmDesignation : Record not found...!")
            redirect(action: "index")
        }
        try {
            admDesignationInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-AdmDesignation : " + e
            redirect(action: "index")
        }
    }
}
