/**
 * @Created_By : AALAA
 * @Date       : 2022.07.23 08:54:06 PM
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
class HrGeneralEmployeeController {
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
        List<HrGeneralEmployee> hrGeneralEmployeeInstanceList = HrGeneralEmployee.createCriteria().list(params) {
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
            if(params.familyMemberDependent)
                eq('familyMemberDependent', Integer.parseInt(params.familyMemberDependent))
            if(params.familyMemberTotal)
                eq('familyMemberTotal', Integer.parseInt(params.familyMemberTotal))
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
            if(params.nameFirst)
                ilike('nameFirst', '%' + params.nameFirst + '%')
            if(params.nameFirstNative)
                ilike('nameFirstNative', '%' + params.nameFirstNative + '%')
            if(params.nameFull)
                ilike('nameFull', '%' + params.nameFull + '%')
            if(params.nameFullNative)
                ilike('nameFullNative', '%' + params.nameFullNative + '%')
            if(params.nameLastSur)
                ilike('nameLastSur', '%' + params.nameLastSur + '%')
            if(params.nameLastSurNative)
                ilike('nameLastSurNative', '%' + params.nameLastSurNative + '%')
            if(params.nameMiddle)
                ilike('nameMiddle', '%' + params.nameMiddle + '%')
            if(params.nameMiddleNative)
                ilike('nameMiddleNative', '%' + params.nameMiddleNative + '%')
            if(params.nameMother)
                ilike('nameMother', '%' + params.nameMother + '%')
            if(params.nameNativeFather)
                ilike('nameNativeFather', '%' + params.nameNativeFather + '%')
            if(params.nameNativeMother)
                ilike('nameNativeMother', '%' + params.nameNativeMother + '%')
            if(params.nameSpouse)
                ilike('nameSpouse', '%' + params.nameSpouse + '%')
            if(params.nameSpouseNative)
                ilike('nameSpouseNative', '%' + params.nameSpouseNative + '%')
            if(params.nid)
                ilike('nid', '%' + params.nid + '%')
            if(params.passportExpireDate){
                ge('passportExpireDate', dateParseFormat.parse(params.passportExpireDate))
                lt('passportExpireDate', dateParseFormat.parse(params.passportExpireDate) + 1)
            }
            if(params.passportNo)
                ilike('passportNo', '%' + params.passportNo + '%')
            order(orderBy, direction)
        }

        //[hrGeneralEmployeeInstanceList: HrGeneralEmployee.list(params)]
        [hrGeneralEmployeeInstanceList: hrGeneralEmployeeInstanceList, hrGeneralEmployeeInstanceTotal: hrGeneralEmployeeInstanceList.getTotalCount()]
    }

    def create() {
        [hrGeneralEmployeeInstance : new HrGeneralEmployee(params)]
    }

    @Transactional
    save(HrGeneralEmployee hrGeneralEmployeeInstance) {
        if (hrGeneralEmployeeInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-HrGeneralEmployee : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(hrGeneralEmployeeInstance, ['logCreatedBy', 'dateOfBirth', 'dateOfDeath', 'dateOfServiceEnd', 'dateOfServiceStart', 'logCreatedDate', 'logModifiedDate', 'passportExpireDate'])
        hrGeneralEmployeeInstance.logCreatedBy = currentUser
        params.dateOfBirth        ? hrGeneralEmployeeInstance.dateOfBirth        = dateParseFormat.parse(params.dateOfBirth       ) : null
        params.dateOfDeath        ? hrGeneralEmployeeInstance.dateOfDeath        = dateParseFormat.parse(params.dateOfDeath       ) : null
        params.dateOfServiceEnd   ? hrGeneralEmployeeInstance.dateOfServiceEnd   = dateParseFormat.parse(params.dateOfServiceEnd  ) : null
        params.dateOfServiceStart ? hrGeneralEmployeeInstance.dateOfServiceStart = dateParseFormat.parse(params.dateOfServiceStart) : null
        params.logCreatedDate     ? hrGeneralEmployeeInstance.logCreatedDate     = dateParseFormat.parse(params.logCreatedDate    ) : null
        params.logModifiedDate    ? hrGeneralEmployeeInstance.logModifiedDate    = dateParseFormat.parse(params.logModifiedDate   ) : null
        params.passportExpireDate ? hrGeneralEmployeeInstance.passportExpireDate = dateParseFormat.parse(params.passportExpireDate) : null
        
        hrGeneralEmployeeInstance.validate()
        if (hrGeneralEmployeeInstance.hasErrors()) {
            flash.exception = "ER-S2-HrGeneralEmployee:"
            trackerService.logError([errorMessage: hrGeneralEmployeeInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [hrGeneralEmployeeInstance: hrGeneralEmployeeInstance])
            return
        }
        try {
            hrGeneralEmployeeInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-HrGeneralEmployee : " + e
            render(view: "create", model: [hrGeneralEmployeeInstance: hrGeneralEmployeeInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.hrGeneralEmployee.pageTitle", default: "HrGeneralEmployee"), hrGeneralEmployeeInstance.id])
                redirect hrGeneralEmployeeInstance
            }
            '*' { respond hrGeneralEmployeeInstance, [status: CREATED] }
        }
    }

    def show(HrGeneralEmployee hrGeneralEmployeeInstance) {
        [hrGeneralEmployeeInstance : hrGeneralEmployeeInstance]
    }

    def edit(HrGeneralEmployee hrGeneralEmployeeInstance) {
        [hrGeneralEmployeeInstance : hrGeneralEmployeeInstance]
    }

    @Transactional
    update(HrGeneralEmployee hrGeneralEmployeeInstance) {
        if (hrGeneralEmployeeInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-HrGeneralEmployee : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (hrGeneralEmployeeInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [hrGeneralEmployeeInstance: hrGeneralEmployeeInstance])
                return
            }
        }

        bindData(hrGeneralEmployeeInstance, ['logCreatedBy', 'dateOfBirth', 'dateOfDeath', 'dateOfServiceEnd', 'dateOfServiceStart', 'logCreatedDate', 'logModifiedDate', 'passportExpireDate'])
        hrGeneralEmployeeInstance.logModifiedBy   = currentUser
        hrGeneralEmployeeInstance.logModifiedDate = currentDate
        params.dateOfBirth        ? hrGeneralEmployeeInstance.dateOfBirth        = dateParseFormat.parse(params.dateOfBirth       ) : null
        params.dateOfDeath        ? hrGeneralEmployeeInstance.dateOfDeath        = dateParseFormat.parse(params.dateOfDeath       ) : null
        params.dateOfServiceEnd   ? hrGeneralEmployeeInstance.dateOfServiceEnd   = dateParseFormat.parse(params.dateOfServiceEnd  ) : null
        params.dateOfServiceStart ? hrGeneralEmployeeInstance.dateOfServiceStart = dateParseFormat.parse(params.dateOfServiceStart) : null
        params.logCreatedDate     ? hrGeneralEmployeeInstance.logCreatedDate     = dateParseFormat.parse(params.logCreatedDate    ) : null
        params.logModifiedDate    ? hrGeneralEmployeeInstance.logModifiedDate    = dateParseFormat.parse(params.logModifiedDate   ) : null
        params.passportExpireDate ? hrGeneralEmployeeInstance.passportExpireDate = dateParseFormat.parse(params.passportExpireDate) : null

        hrGeneralEmployeeInstance.validate()
        if (hrGeneralEmployeeInstance.hasErrors()) {
            flash.exception = "ER-U2-HrGeneralEmployee:"
            trackerService.logError([errorMessage: hrGeneralEmployeeInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [hrGeneralEmployeeInstance: hrGeneralEmployeeInstance])
            return
        }
        try {
            hrGeneralEmployeeInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-HrGeneralEmployee : " + e
            render(view: "edit", model: [hrGeneralEmployeeInstance: hrGeneralEmployeeInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.hrGeneralEmployee.pageTitle", default: "HrGeneralEmployee"), hrGeneralEmployeeInstance.id])
                redirect hrGeneralEmployeeInstance
            }
            '*'{ respond hrGeneralEmployeeInstance, [status: OK] }
        }
    }

    @Transactional
    delete(HrGeneralEmployee hrGeneralEmployeeInstance) {
        if (hrGeneralEmployeeInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-HrGeneralEmployee : Record not found...!")
            redirect(action: "index")
        }
        try {
            hrGeneralEmployeeInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-HrGeneralEmployee : " + e
            redirect(action: "index")
        }
    }
}
