/**
 * @Created_By : AALAA
 * @Date       : 2022.07.26 12:58:19 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.aalaa.acc

import grails.plugin.springsecurity.SpringSecurityService
import org.aalaa.auth.AuthUser
import org.aalaa.sys.TrackerService
import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AccCurrencyController {
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
        Integer defMin   = params.min ? Integer.parseInt(params.min) : grailsApplication.config.show.item.min,
                defMax   = params.max ? Integer.parseInt(params.max) : grailsApplication.config.show.item.max
        params.max       = Math.min(max ?: defMin, defMax)
        String orderBy   = params.sort  ?: 'id',
               direction = params.order ?: 'desc'   //asc
        List<AccCurrency> accCurrencyInstanceList = AccCurrency.createCriteria().list(params) {
            if(params.active)
                eq('active', true)
            if(params.codeDigital)
                ilike('codeDigital', '%' + params.codeDigital + '%')
            if(params.codeIso)
                ilike('codeIso', '%' + params.codeIso + '%')
            if(params.codeIso4217)
                ilike('codeIso4217', '%' + params.codeIso4217 + '%')
            if(params.codeUnOfficial)
                ilike('codeUnOfficial', '%' + params.codeUnOfficial + '%')
            if(params.currencyNumber)
                ilike('currencyNumber', '%' + params.currencyNumber + '%')
            if(params.dateFrom)
                ilike('dateFrom', '%' + params.dateFrom + '%')
            if(params.dateUntil)
                ilike('dateUntil', '%' + params.dateUntil + '%')
            if(params.decimalPlaces)
                ilike('decimalPlaces', '%' + params.decimalPlaces + '%')
            if(params.keyword)
                ilike('keyword', '%' + params.keyword + '%')
            if(params.note)
                ilike('note', '%' + params.note + '%')
            if(params.oneUnitEqualsTo)
                ilike('oneUnitEqualsTo', '%' + params.oneUnitEqualsTo + '%')
            if(params.remarks)
                ilike('remarks', '%' + params.remarks + '%')
            if(params.replacedBy)
                ilike('replacedBy', '%' + params.replacedBy + '%')
            if(params.symbol)
                ilike('symbol', '%' + params.symbol + '%')
            if(params.tiedTo)
                ilike('tiedTo', '%' + params.tiedTo + '%')
            if(params.title)
                ilike('title', '%' + params.title + '%')
            if(params.titleNative)
                ilike('titleNative', '%' + params.titleNative + '%')
            if(params.titleShort)
                ilike('titleShort', '%' + params.titleShort + '%')
            if(params.titleShortNative)
                ilike('titleShortNative', '%' + params.titleShortNative + '%')
            if(params.usedIn)
                ilike('usedIn', '%' + params.usedIn + '%')
            order(orderBy, direction)
        }

        //[accCurrencyInstanceList: AccCurrency.list(params)]
        [accCurrencyInstanceList: accCurrencyInstanceList, accCurrencyInstanceTotal: accCurrencyInstanceList.getTotalCount()]
    }

    def create() {
        [accCurrencyInstance : new AccCurrency(params)]
    }

    @Transactional
    save(AccCurrency accCurrencyInstance) {
        if (accCurrencyInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-AccCurrency : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(accCurrencyInstance, ['logCreatedBy'])
        accCurrencyInstance.logCreatedBy = currentUser
        
        accCurrencyInstance.validate()
        if (accCurrencyInstance.hasErrors()) {
            flash.exception = "ER-S2-AccCurrency:"
            trackerService.logError([errorMessage: accCurrencyInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [accCurrencyInstance: accCurrencyInstance])
            return
        }
        try {
            accCurrencyInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-AccCurrency : " + e
            render(view: "create", model: [accCurrencyInstance: accCurrencyInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.accCurrency.pageTitle", default: "AccCurrency"), accCurrencyInstance.id])
                redirect accCurrencyInstance
            }
            '*' { respond accCurrencyInstance, [status: CREATED] }
        }
    }

    def show(AccCurrency accCurrencyInstance) {
        [accCurrencyInstance : accCurrencyInstance]
    }

    def edit(AccCurrency accCurrencyInstance) {
        [accCurrencyInstance : accCurrencyInstance]
    }

    @Transactional
    update(AccCurrency accCurrencyInstance) {
        if (accCurrencyInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-AccCurrency : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (accCurrencyInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [accCurrencyInstance: accCurrencyInstance])
                return
            }
        }
        
        accCurrencyInstance.logModifiedBy   = currentUser
        accCurrencyInstance.logModifiedDate = currentDate
        
        accCurrencyInstance.validate()
        if (accCurrencyInstance.hasErrors()) {
            flash.exception = "ER-U2-AccCurrency:"
            trackerService.logError([errorMessage: accCurrencyInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [accCurrencyInstance: accCurrencyInstance])
            return
        }
        try {
            accCurrencyInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-AccCurrency : " + e
            render(view: "edit", model: [accCurrencyInstance: accCurrencyInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.accCurrency.pageTitle", default: "AccCurrency"), accCurrencyInstance.id])
                redirect accCurrencyInstance
            }
            '*'{ respond accCurrencyInstance, [status: OK] }
        }
    }

    @Transactional
    delete(AccCurrency accCurrencyInstance) {
        if (accCurrencyInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-AccCurrency : Record not found...!")
            redirect(action: "index")
        }
        try {
            accCurrencyInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-AccCurrency : " + e
            redirect(action: "index")
        }
    }
}
