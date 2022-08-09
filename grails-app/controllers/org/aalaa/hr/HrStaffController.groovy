/**
 * @Created_By : AALAA
 * @Date       : 2022.07.23 08:47:43 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.aalaa.hr

import grails.plugin.springsecurity.SpringSecurityService
import org.aalaa.auth.AuthUser
import org.aalaa.sys.TrackerService
import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HrStaffController {
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
        List<HrStaff> hrStaffInstanceList = HrStaff.createCriteria().list(params) {
            if(params.admVendorOrganization)
                eq('admVendorOrganization', org.aalaa.adm.AdmOrganization.get(params.admVendorOrganization))
            if(params.bid)
                ilike('bid', '%' + params.bid + '%')
            if(params.code)
                ilike('code', '%' + params.code + '%')
            if(params.dateOfBirth){
                ge('dateOfBirth', dateParseFormat.parse(params.dateOfBirth))
                lt('dateOfBirth', dateParseFormat.parse(params.dateOfBirth) + 1)
            }
            if(params.dateOfDeath){
                ge('dateOfDeath', dateParseFormat.parse(params.dateOfDeath))
                lt('dateOfDeath', dateParseFormat.parse(params.dateOfDeath) + 1)
            }
            if(params.dateOfServiceEnd){
                ge('dateOfServiceEnd', dateParseFormat.parse(params.dateOfServiceEnd))
                lt('dateOfServiceEnd', dateParseFormat.parse(params.dateOfServiceEnd) + 1)
            }
            if(params.dateOfServiceStart){
                ge('dateOfServiceStart', dateParseFormat.parse(params.dateOfServiceStart))
                lt('dateOfServiceStart', dateParseFormat.parse(params.dateOfServiceStart) + 1)
            }
            if(params.department)
                eq('department', org.aalaa.adm.AdmDepartment.get(params.department))
            if(params.departmentJoining)
                eq('departmentJoining', org.aalaa.adm.AdmDepartment.get(params.departmentJoining))
            if(params.designation)
                eq('designation', org.aalaa.adm.AdmDesignation.get(params.designation))
            if(params.designationJoining)
                eq('designationJoining', org.aalaa.adm.AdmDesignation.get(params.designationJoining))
            if(params.email)
                ilike('email', '%' + params.email + '%')
            if(params.emergencyContactNo)
                ilike('emergencyContactNo', '%' + params.emergencyContactNo + '%')
            if(params.emergencyContactPerson)
                ilike('emergencyContactPerson', '%' + params.emergencyContactPerson + '%')
            if(params.grossSalary)
                eq('grossSalary', Float.parseFloat(params.grossSalary))
            if(params.grossSalaryJoining)
                eq('grossSalaryJoining', Float.parseFloat(params.grossSalaryJoining))
            if(params.locPermanentAddress)
                ilike('locPermanentAddress', '%' + params.locPermanentAddress + '%')
            if(params.locPermanentDistrict)
                eq('locPermanentDistrict', org.aalaa.loc.LocDistrict.get(params.locPermanentDistrict))
            if(params.locPermanentDivision)
                eq('locPermanentDivision', org.aalaa.loc.LocDivision.get(params.locPermanentDivision))
            if(params.locPermanentSubDistrict)
                eq('locPermanentSubDistrict', org.aalaa.loc.LocSubDistrict.get(params.locPermanentSubDistrict))
            if(params.locPermanentUnionCouncil)
                eq('locPermanentUnionCouncil', org.aalaa.loc.LocUnionCouncil.get(params.locPermanentUnionCouncil))
            if(params.locPresentAddress)
                ilike('locPresentAddress', '%' + params.locPresentAddress + '%')
            if(params.locPresentDistrict)
                eq('locPresentDistrict', org.aalaa.loc.LocDistrict.get(params.locPresentDistrict))
            if(params.locPresentDivision)
                eq('locPresentDivision', org.aalaa.loc.LocDivision.get(params.locPresentDivision))
            if(params.locPresentSubDistrict)
                eq('locPresentSubDistrict', org.aalaa.loc.LocSubDistrict.get(params.locPresentSubDistrict))
            if(params.locPresentUnionCouncil)
                eq('locPresentUnionCouncil', org.aalaa.loc.LocUnionCouncil.get(params.locPresentUnionCouncil))
            if(params.mobileNoPrimary)
                ilike('mobileNoPrimary', '%' + params.mobileNoPrimary + '%')
            if(params.mobileNoSecondary)
                ilike('mobileNoSecondary', '%' + params.mobileNoSecondary + '%')
            if(params.nameFather)
                ilike('nameFather', '%' + params.nameFather + '%')
            if(params.nameFull)
                ilike('nameFull', '%' + params.nameFull + '%')
            if(params.nameFullNative)
                ilike('nameFullNative', '%' + params.nameFullNative + '%')
            if(params.nameMother)
                ilike('nameMother', '%' + params.nameMother + '%')
            if(params.nameNativeFather)
                ilike('nameNativeFather', '%' + params.nameNativeFather + '%')
            if(params.nameNativeMother)
                ilike('nameNativeMother', '%' + params.nameNativeMother + '%')
            if(params.nid)
                ilike('nid', '%' + params.nid + '%')
            order(orderBy, direction)
        }

        //[hrStaffInstanceList: HrStaff.list(params)]
        [hrStaffInstanceList: hrStaffInstanceList, hrStaffInstanceTotal: hrStaffInstanceList.getTotalCount()]
    }

    def create() {
        [hrStaffInstance : new HrStaff(params)]
    }

    @Transactional
    save(HrStaff hrStaffInstance) {
        if (hrStaffInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-HrStaff : Record not found...!")
            redirect(action: "index")
        }

        bindData(hrStaffInstance, ['logCreatedBy', 'dateOfBirth', 'dateOfDeath', 'dateOfServiceEnd', 'dateOfServiceStart', 'logCreatedDate', 'passportExpireDate'])
        hrStaffInstance.logCreatedBy = currentUser
        params.dateOfBirth        ? hrStaffInstance.dateOfBirth        = dateParseFormat.parse(params.dateOfBirth       ) : null
        params.dateOfDeath        ? hrStaffInstance.dateOfDeath        = dateParseFormat.parse(params.dateOfDeath       ) : null
        params.dateOfServiceEnd   ? hrStaffInstance.dateOfServiceEnd   = dateParseFormat.parse(params.dateOfServiceEnd  ) : null
        params.dateOfServiceStart ? hrStaffInstance.dateOfServiceStart = dateParseFormat.parse(params.dateOfServiceStart) : null
        
        hrStaffInstance.validate()
        if (hrStaffInstance.hasErrors()) {
            flash.exception = "ER-S2-HrStaff:"
            trackerService.logError([errorMessage: hrStaffInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [hrStaffInstance: hrStaffInstance])
            return
        }
        try {
            hrStaffInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-HrStaff : " + e
            render(view: "create", model: [hrStaffInstance: hrStaffInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.hrStaff.pageTitle", default: "HrStaff"), hrStaffInstance.id])
                redirect hrStaffInstance
            }
            '*' { respond hrStaffInstance, [status: CREATED] }
        }
    }

    def show(HrStaff hrStaffInstance) {
        [hrStaffInstance : hrStaffInstance]
    }

    def edit(HrStaff hrStaffInstance) {
        [hrStaffInstance : hrStaffInstance]
    }

    @Transactional
    update(HrStaff hrStaffInstance) {
        if (hrStaffInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-HrStaff : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (hrStaffInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [hrStaffInstance: hrStaffInstance])
                return
            }
        }

        bindData(hrStaffInstance, ['dateOfBirth', 'dateOfDeath', 'dateOfServiceEnd', 'dateOfServiceStart', 'logModifiedDate', 'passportExpireDate'])
        hrStaffInstance.logModifiedBy   = currentUser
        hrStaffInstance.logModifiedDate = currentDate
        params.dateOfBirth        ? hrStaffInstance.dateOfBirth        = dateParseFormat.parse(params.dateOfBirth       ) : null
        params.dateOfDeath        ? hrStaffInstance.dateOfDeath        = dateParseFormat.parse(params.dateOfDeath       ) : null
        params.dateOfServiceEnd   ? hrStaffInstance.dateOfServiceEnd   = dateParseFormat.parse(params.dateOfServiceEnd  ) : null
        params.dateOfServiceStart ? hrStaffInstance.dateOfServiceStart = dateParseFormat.parse(params.dateOfServiceStart) : null
        
        hrStaffInstance.validate()
        if (hrStaffInstance.hasErrors()) {
            flash.exception = "ER-U2-HrStaff:"
            trackerService.logError([errorMessage: hrStaffInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [hrStaffInstance: hrStaffInstance])
            return
        }
        try {
            hrStaffInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-HrStaff : " + e
            render(view: "edit", model: [hrStaffInstance: hrStaffInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.hrStaff.pageTitle", default: "HrStaff"), hrStaffInstance.id])
                redirect hrStaffInstance
            }
            '*'{ respond hrStaffInstance, [status: OK] }
        }
    }

    @Transactional
    delete(HrStaff hrStaffInstance) {
        if (hrStaffInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-HrStaff : Record not found...!")
            redirect(action: "index")
        }
        try {
            hrStaffInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-HrStaff : " + e
            redirect(action: "index")
        }
    }
}
