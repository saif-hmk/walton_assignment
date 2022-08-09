/**
 * @Created_By: AALAA
 * @Date      : 2015.09.11 11:20:10 AM
 * @Author    : Md. Hoshen Mahmud Khan
 * @Email     : saif_hmk@live.com
 * @Phone     : +8801672036757
 * */

package org.aalaa.sys

import grails.transaction.Transactional
import org.aalaa.auth.AuthRole
import org.aalaa.auth.AuthUserService
import org.aalaa.adm.AdmBranch
import org.codehaus.groovy.grails.commons.GrailsApplication

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession
import java.text.SimpleDateFormat

@Transactional
class SystemService {
//----------------------------------------------------------------------------------------------------------------------------------------------------------
    GrailsApplication             grailsApplication
    AuthUserService               authUserService

    static SimpleDateFormat       dateParseFormat = null
    List<Module>                  moduleList
    List<DashboardComponentGroup> componentGroupList

    static void setDateParseFormat(SimpleDateFormat dateParseFormat) {
        this.dateParseFormat = dateParseFormat
    }

    static SimpleDateFormat getDateParseFormat() {
        return dateParseFormat
    }

    void setModuleList(List<Module> moduleList) {
        this.moduleList = moduleList
    }

    void setModuleList() {
        setModuleList(Module.findAll().sort { it.sortOrder })
    }

    List<Module> getModuleList() {
        return moduleList
    }

    void setComponentGroupList(List<DashboardComponentGroup> componentGroupList) {
        this.componentGroupList = componentGroupList
    }

    void setComponentGroupList() {
        setComponentGroupList(DashboardComponentGroup.findAll().sort { it.sortOrder })
    }

    List<DashboardComponentGroup> getComponentGroupList() {
        return componentGroupList
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    void setSystemProperties(HttpSession session, HttpServletRequest request) {
        try {
            setDateParseFormat(new SimpleDateFormat(grailsApplication.config.format.dtp.date))
            setModuleList()
            setComponentGroupList()

            session.setAttribute("SESSION_STARTED_AT"         , new Date()        )
            session.setAttribute("DATE_PARSE_FORMAT"          , dateParseFormat   )
            session.setAttribute("SYS_MODULE_LIST"            , moduleList        )
            session.setAttribute("SYS_DB_COMPONENT_GROUP_LIST", componentGroupList)

            //println "|SESSION_STARTED_AT: " + session.getAttribute("SESSION_STARTED_AT")
            //println "|SYS_MODULE_LIST   : " + session.getAttribute("SYS_MODULE_LIST"   )
        } catch (Exception e) {
            println "|Sorry, failed to initialize system properties!\n|" + e.getMessage()
        }
    }

    List<AuthRole> getRoleList(){
        List<AuthRole>  authRoleList = new ArrayList()
        if(authUserService.authUserRoles?.toString()?.contains("DEVELOPER")){
            authRoleList = AuthRole.list()
        }
        else{
            authRoleList = AuthRole.executeQuery("select r from AuthRole r where r.authority not like '%ROLE_DEVELOPER%'")
        }
        return authRoleList
    }

    List<AdmBranch> getBranchList(){
        return AdmBranch.executeQuery("select b from AdmBranch b, AdmOrganization o where b.admVendorOrganization = o and b.active = true order by o.sortOrder, b.sortOrder")
    }

    List<AdmBranch> getUserBranchList(){
        //return ComBranch.executeQuery("select b from ComBranch b, AdmOrganization o where b.admVendorOrganization = o and b.active = true order by o.sortOrder, b.sortOrder")
        List<AdmBranch> admBranchList = new ArrayList()
        if(authUserService.authUserRoles?.toString()?.contains("DEVELOPER")){
            admBranchList = AdmBranch.findAllByActive(true)
        }
        else{
            admBranchList = AdmBranch.executeQuery("select b from AdmBranch b where admVendorOrganization.id = :comOrganizationId", [comOrganizationId: authUserService.authUserOrganization?.id])
        }
        return admBranchList?.sort{[it.admVendorOrganization.title, it.sortOrder]}
    }
//----------------------------------------------------------------------------------------------------------------------------------------------------------
}
