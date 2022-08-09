/**
 * @Created_By : AALAA
 * @Date       : 2022.08.06 08:02:17 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.aalaa.prl


import grails.plugin.springsecurity.SpringSecurityService
import org.aalaa.auth.AuthUser
import org.aalaa.sys.TrackerService
import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PrlPeriodController {
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
        List<PrlPeriod> prlPeriodInstanceList = PrlPeriod.createCriteria().list(params) {
            if(params.dateOfEnd){
                ge('dateOfEnd', dateParseFormat.parse(params.dateOfEnd))
                lt('dateOfEnd', dateParseFormat.parse(params.dateOfEnd) + 1)
            }
            if(params.dateOfStart){
                ge('dateOfStart', dateParseFormat.parse(params.dateOfStart))
                lt('dateOfStart', dateParseFormat.parse(params.dateOfStart) + 1)
            }
            if(params.isActive)
                eq('isActive', true)
            if(params.isClosed)
                eq('isClosed', true)
            if(params.title)
                ilike('title', '%' + params.title + '%')
            if(params.titleNative)
                ilike('titleNative', '%' + params.titleNative + '%')
            order(orderBy, direction)
        }

        [prlPeriodInstanceList: prlPeriodInstanceList, prlPeriodInstanceTotal: prlPeriodInstanceList.getTotalCount()]
        */
        [prlPeriodInstanceList: PrlPeriod.list(params)]
    }

    def create() {
        [prlPeriodInstance : new PrlPeriod(params)]
    }

    @Transactional
    save(PrlPeriod prlPeriodInstance) {
        if (prlPeriodInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-PrlPeriod : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(prlPeriodInstance, ['logCreatedBy', 'dateOfStart', 'dateOfEnd'])
        prlPeriodInstance.logCreatedBy = currentUser
        params.dateOfStart ? prlPeriodInstance.dateOfStart = dateParseFormat.parse(params.dateOfStart) : null
        params.dateOfEnd   ? prlPeriodInstance.dateOfEnd   = dateParseFormat.parse(params.dateOfEnd  ) : null
        
        prlPeriodInstance.validate()
        if (prlPeriodInstance.hasErrors()) {
            flash.exception = "ER-S2-PrlPeriod:"
            trackerService.logError([errorMessage: prlPeriodInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [prlPeriodInstance: prlPeriodInstance])
            return
        }
        try {
            prlPeriodInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-PrlPeriod : " + e
            render(view: "create", model: [prlPeriodInstance: prlPeriodInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.prlPeriod.pageTitle", default: "PrlPeriod"), prlPeriodInstance.id])
                redirect prlPeriodInstance
            }
            '*' { respond prlPeriodInstance, [status: CREATED] }
        }
    }

    def show(PrlPeriod prlPeriodInstance) {
        [prlPeriodInstance : prlPeriodInstance]
    }

    def edit(PrlPeriod prlPeriodInstance) {
        [prlPeriodInstance : prlPeriodInstance]
    }

    @Transactional
    update(PrlPeriod prlPeriodInstance) {
        if (prlPeriodInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-PrlPeriod : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (prlPeriodInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [prlPeriodInstance: prlPeriodInstance])
                return
            }
        }

        bindData(prlPeriodInstance, ['logModifiedBy', 'logModifiedDate', 'dateOfStart', 'dateOfEnd'])
        prlPeriodInstance.logModifiedBy   = currentUser
        prlPeriodInstance.logModifiedDate = currentDate
        params.dateOfStart ? prlPeriodInstance.dateOfStart = dateParseFormat.parse(params.dateOfStart) : null
        params.dateOfEnd   ? prlPeriodInstance.dateOfEnd   = dateParseFormat.parse(params.dateOfEnd  ) : null
        
        prlPeriodInstance.validate()
        if (prlPeriodInstance.hasErrors()) {
            flash.exception = "ER-U2-PrlPeriod:"
            trackerService.logError([errorMessage: prlPeriodInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [prlPeriodInstance: prlPeriodInstance])
            return
        }
        try {
            prlPeriodInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-PrlPeriod : " + e
            render(view: "edit", model: [prlPeriodInstance: prlPeriodInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.prlPeriod.pageTitle", default: "PrlPeriod"), prlPeriodInstance.id])
                redirect prlPeriodInstance
            }
            '*'{ respond prlPeriodInstance, [status: OK] }
        }
    }

    @Transactional
    delete(PrlPeriod prlPeriodInstance) {
        if (prlPeriodInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-PrlPeriod : Record not found...!")
            redirect(action: "index")
        }
        try {
            prlPeriodInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-PrlPeriod : " + e
            redirect(action: "index")
        }
    }
}
