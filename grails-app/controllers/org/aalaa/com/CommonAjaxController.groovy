package org.aalaa.com

import org.aalaa.adm.AdmDepartment
import org.aalaa.adm.AdmVendorOrganization
import org.aalaa.auth.AuthUser
import org.aalaa.auth.AuthUserService
import org.aalaa.loc.LocLocationService

class CommonAjaxController {
    IoUtilService      ioUtilService
    LocLocationService locLocationService
    AuthUserService    authUserService
    ComLookupService   comLookupService

    def filterLocationHierarchy() {
        if (request.xhr) {
            render locLocationService.getOptions(params.id)
        } else
            return "Sorry, you are not authorised to access this service."
    }

    /**
     * User Create/Update Related Information
     **/
    String getUserByUserName() {
        if (request.xhr) {
            if (params.userName) {
                render authUserService.getUserAndLocationTypeByUserName(params.userName)
            }
            else {
                println "EX-CA-UBN-01 : with provided userName (" + params.userName + ")"
                render("0")
            }
        }
    }

    String getDepartments() {
        if (request.xhr) {
            if (params.admVendorOrganization) {
                render comLookupService.getDepartments(AdmVendorOrganization.get(params.admVendorOrganization))
            }
        }
    }

    String getDesignations() {
        if (request.xhr) {
            if (params.admVendorOrganization && params.department) {
                render comLookupService.getDesignations(AdmVendorOrganization.get(params.admVendorOrganization), AdmDepartment.get(params.department))
            }
        }
    }

    def getExistingUser() {
        boolean isExist = true
        if (request.xhr) {
            params.userId = params.userId.trim()
            int count = AuthUser.countByUsername(params.userId)
            if (count > 0)
                isExist = true
            else
                isExist = false
            render isExist.toString()
        }
    }

    def downloadDoc(String moduleName, String subModuleName, String fileName) {
        return ioUtilService.downloadDoc(moduleName, subModuleName, fileName, response)
    }
}
