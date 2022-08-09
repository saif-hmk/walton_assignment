/**
 * @Created_By : AALAA
 * @Date       : 2022.07.25 11:30:26 PM
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
class LocDistrictController {
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
        List<LocDistrict> locDistrictInstanceList = LocDistrict.createCriteria().list(params) {
            if(params.acquired)
                ilike('acquired', '%' + params.acquired + '%')
            if(params.areaLandSqKm)
                eq('areaLandSqKm', Float.parseFloat(params.areaLandSqKm))
            if(params.areaLandSqMile)
                eq('areaLandSqMile', Float.parseFloat(params.areaLandSqMile))
            if(params.areaTotalSqKm)
                eq('areaTotalSqKm', Float.parseFloat(params.areaTotalSqKm))
            if(params.areaTotalSqMile)
                eq('areaTotalSqMile', Float.parseFloat(params.areaTotalSqMile))
            if(params.areaWaterSqKm)
                eq('areaWaterSqKm', Float.parseFloat(params.areaWaterSqKm))
            if(params.areaWaterSqMile)
                eq('areaWaterSqMile', Float.parseFloat(params.areaWaterSqMile))
            if(params.censusYear)
                eq('censusYear', Integer.parseInt(params.censusYear))
            if(params.code)
                ilike('code', '%' + params.code + '%')
            if(params.establishmentDate)
                ilike('establishmentDate', '%' + params.establishmentDate + '%')
            if(params.isActive)
                eq('isActive', true)
            if(params.name)
                ilike('name', '%' + params.name + '%')
            if(params.nameNative)
                ilike('nameNative', '%' + params.nameNative + '%')
            if(params.parent)
                eq('parent', org.aalaa.loc.LocLocation.get(params.parent))
            if(params.populationDensitySqKm)
                eq('populationDensitySqKm', Float.parseFloat(params.populationDensitySqKm))
            if(params.remarks)
                ilike('remarks', '%' + params.remarks + '%')
            order(orderBy, direction)
        }

        //[locDistrictInstanceList: LocDistrict.list(params)]
        [locDistrictInstanceList: locDistrictInstanceList, locDistrictInstanceTotal: locDistrictInstanceList.getTotalCount()]
    }

    def create() {
        [locDistrictInstance : new LocDistrict(params)]
    }

    @Transactional
    save(LocDistrict locDistrictInstance) {
        if (locDistrictInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-LocDistrict : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(locDistrictInstance, ['logCreatedBy'])
        locDistrictInstance.logCreatedBy = currentUser
        
        locDistrictInstance.validate()
        if (locDistrictInstance.hasErrors()) {
            flash.exception = "ER-S2-LocDistrict:"
            trackerService.logError([errorMessage: locDistrictInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [locDistrictInstance: locDistrictInstance])
            return
        }
        try {
            locDistrictInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-LocDistrict : " + e
            render(view: "create", model: [locDistrictInstance: locDistrictInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.locDistrict.pageTitle", default: "LocDistrict"), locDistrictInstance.id])
                redirect locDistrictInstance
            }
            '*' { respond locDistrictInstance, [status: CREATED] }
        }
    }

    def show(LocDistrict locDistrictInstance) {
        [locDistrictInstance : locDistrictInstance]
    }

    def edit(LocDistrict locDistrictInstance) {
        [locDistrictInstance : locDistrictInstance]
    }

    @Transactional
    update(LocDistrict locDistrictInstance) {
        if (locDistrictInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-LocDistrict : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (locDistrictInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [locDistrictInstance: locDistrictInstance])
                return
            }
        }
        
        locDistrictInstance.logModifiedBy   = currentUser
        locDistrictInstance.logModifiedDate = currentDate
        
        locDistrictInstance.validate()
        if (locDistrictInstance.hasErrors()) {
            flash.exception = "ER-U2-LocDistrict:"
            trackerService.logError([errorMessage: locDistrictInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [locDistrictInstance: locDistrictInstance])
            return
        }
        try {
            locDistrictInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-LocDistrict : " + e
            render(view: "edit", model: [locDistrictInstance: locDistrictInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.locDistrict.pageTitle", default: "LocDistrict"), locDistrictInstance.id])
                redirect locDistrictInstance
            }
            '*'{ respond locDistrictInstance, [status: OK] }
        }
    }

    @Transactional
    delete(LocDistrict locDistrictInstance) {
        if (locDistrictInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-LocDistrict : Record not found...!")
            redirect(action: "index")
        }
        try {
            locDistrictInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-LocDistrict : " + e
            redirect(action: "index")
        }
    }
}
