/**
 * @Created_By : AALAA
 * @Date       : 2022.07.23 12:14:33 AM
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
class AdmDepartmentController {
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
        List<AdmDepartment> admDepartmentInstanceList = AdmDepartment.createCriteria().list(params) {
            if(params.active)
                eq('active', true)
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

        [admDepartmentInstanceList: admDepartmentInstanceList, admDepartmentInstanceTotal: admDepartmentInstanceList.getTotalCount()]
        */
        [admDepartmentInstanceList: AdmDepartment.list(params)]
    }

    def create() {
        [admDepartmentInstance : new AdmDepartment(params)]
    }

    @Transactional
    save(AdmDepartment admDepartmentInstance) {
        if (admDepartmentInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-AdmDepartment : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(admDepartmentInstance, ['logCreatedBy'])
        admDepartmentInstance.logCreatedBy = currentUser
        
        admDepartmentInstance.validate()
        if (admDepartmentInstance.hasErrors()) {
            flash.exception = "ER-S2-AdmDepartment:"
            trackerService.logError([errorMessage: admDepartmentInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [admDepartmentInstance: admDepartmentInstance])
            return
        }
        try {
            admDepartmentInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-AdmDepartment : " + e
            render(view: "create", model: [admDepartmentInstance: admDepartmentInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.admDepartment.pageTitle", default: "AdmDepartment"), admDepartmentInstance.id])
                redirect admDepartmentInstance
            }
            '*' { respond admDepartmentInstance, [status: CREATED] }
        }
    }

    def show(AdmDepartment admDepartmentInstance) {
        [admDepartmentInstance : admDepartmentInstance]
    }

    def edit(AdmDepartment admDepartmentInstance) {
        [admDepartmentInstance : admDepartmentInstance]
    }

    @Transactional
    update(AdmDepartment admDepartmentInstance) {
        if (admDepartmentInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-AdmDepartment : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (admDepartmentInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [admDepartmentInstance: admDepartmentInstance])
                return
            }
        }
        
        admDepartmentInstance.logModifiedBy   = currentUser
        admDepartmentInstance.logModifiedDate = currentDate
        
        admDepartmentInstance.validate()
        if (admDepartmentInstance.hasErrors()) {
            flash.exception = "ER-U2-AdmDepartment:"
            trackerService.logError([errorMessage: admDepartmentInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [admDepartmentInstance: admDepartmentInstance])
            return
        }
        try {
            admDepartmentInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-AdmDepartment : " + e
            render(view: "edit", model: [admDepartmentInstance: admDepartmentInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.admDepartment.pageTitle", default: "AdmDepartment"), admDepartmentInstance.id])
                redirect admDepartmentInstance
            }
            '*'{ respond admDepartmentInstance, [status: OK] }
        }
    }

    @Transactional
    delete(AdmDepartment admDepartmentInstance) {
        if (admDepartmentInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-AdmDepartment : Record not found...!")
            redirect(action: "index")
        }
        try {
            admDepartmentInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-AdmDepartment : " + e
            redirect(action: "index")
        }
    }
}
