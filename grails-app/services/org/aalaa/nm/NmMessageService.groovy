/**
 * @Created_By : AALAA
 * @Date : 2020.05.30 12:21:11 PM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.nm

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.aalaa.adm.AdmDepartment
import org.aalaa.adm.AdmOrganization
import org.aalaa.auth.AuthRole
import org.aalaa.auth.AuthUser
import org.aalaa.auth.AuthUserService
import org.aalaa.com.ComLookupService
import org.aalaa.hr.HrEmployee
import org.aalaa.hr.HrEmployeeService
import org.aalaa.nm.com.NmContent
import org.aalaa.nm.message.NmMessageContent
import org.codehaus.groovy.grails.web.util.WebUtils

import javax.servlet.http.HttpSession
import java.text.SimpleDateFormat

@Transactional
class NmMessageService {
    SpringSecurityService springSecurityService
    AuthUserService authUserService
    SimpleDateFormat      dateParseFormat
    Date                  currentDate
    AuthUser currentUser
    AdmOrganization currentUserOrg
    AdmDepartment currentUserDept
    Set<AuthRole> currentUserRoles
    Boolean               rootUser                            ,
                          admin,
                          hod

    ComLookupService comLookupService
    HrEmployeeService hrEmployeeService

    //todo fix
    void refreshDependencies() {
        HttpSession session = WebUtils.retrieveGrailsWebRequest().getSession()
        dateParseFormat     = session.getAttribute("DATE_PARSE_FORMAT")
        currentUserRoles    = session.getAttribute("CURRENT_USER_ROLES")
        currentUserOrg      = session.getAttribute("CURRENT_USER_ORGANIZATION")
        currentUserDept     = session.getAttribute("CURRENT_USER_DEPARTMENT")
        rootUser            = session.getAttribute("ROOT_USER")
        admin               = session.getAttribute("ADMIN")
        hod                 = session.getAttribute("HOD")

        currentDate         = new Date()
        currentUser         = springSecurityService.getCurrentUser()
    }

    List<NmContent> getMessageList() {
        return getMessageList(["authUser": springSecurityService.getCurrentUser()])
    }

    List<NmContent> getMessageList(Map params) {
        refreshDependencies()
        List<NmContent> messageList = NmMessageContent.createCriteria().list(params) {
            eq("recipient", params.authUser)

            if (params.seenByUser) {
                eq("seenByUser", params.seenByUser)
            } else {
                eq("seenByUser", false)
            }

            if (params.active) {
                eq("active", Boolean.valueOf(params.active))
            } else {
                eq("active", true)
            }
        }
        return messageList?.sort { [[it.status.sortOrder, "asc"], [it.logCreatedDate, "desc"]] }
    }

    static String getIcon(NmContent content) {
        String icon = "fa"
        if (content.status == StatusNm.PENDING) {
            icon += ' fa-laptop'
        } else if (content.status == StatusNm.SUCCESS) {
            icon += ' fa-check'
        } else if (content.status == StatusNm.HOLD) {
            icon += ' fa-pause'
        } else if (content.status == StatusNm.EXPIRED) {
            icon += ' fa-clock'
        } else if (content.status == StatusNm.FAILED) {
            icon += ' fa-warning'
        } else if (content.status == StatusNm.REJECTED) {
            icon += ' fa-trash'
        }
        return icon
    }

    static String getColor(NmContent content) {
        String color
        if (content.status == StatusNm.PENDING) {
            color = 'c-gray'
        } else if (content.status == StatusNm.SUCCESS) {
            color = 'c-success'
        } else if (content.status == StatusNm.HOLD) {
            color = 'c-info'
        } else if (content.status == StatusNm.EXPIRED) {
            color = 'c-purple'
        } else if (content.status == StatusNm.FAILED) {
            color = 'c-warning'
        } else if (content.status == StatusNm.REJECTED) {
            color = 'c-danger'
        }
        return color
    }

    static String getColorOfMessage(NmContent content) {
        String color
        if (content.status == StatusNm.PENDING) {
            color = 'c-success'
        } else if (content.status == StatusNm.SUCCESS) {
            color = 'c-gray'
        } else if (content.status == StatusNm.HOLD) {
            color = 'c-info'
        } else if (content.status == StatusNm.EXPIRED) {
            color = 'c-purple'
        } else if (content.status == StatusNm.FAILED) {
            color = 'c-warning'
        } else if (content.status == StatusNm.REJECTED) {
            color = 'c-danger'
        }
        return color
    }

    void sendMessageToUsers(List<AuthUser> userList, Map content){
        content.put("logCreatedBy", springSecurityService.getCurrentUser())
        //Field error in object 'org.aalaa.nm.message.NmMessageContent' on field 'category': rejected value [null]; codes [org.aalaa.nm.message.NmMessageContent.category.nullable.error.org.aalaa.nm.message.NmMessageContent.category,org.aalaa.nm.message.NmMessageContent.category.nullable.error.category,org.aalaa.nm.message.NmMessageContent.category.nullable.error.org.aalaa.com.ComLookup,org.aalaa.nm.message.NmMessageContent.category.nullable.error,nmMessageContent.category.nullable.error.org.aalaa.nm.message.NmMessageContent.category,nmMessageContent.category.nullable.error.category,nmMessageContent.category.nullable.error.org.aalaa.com.ComLookup,nmMessageContent.category.nullable.error,org.aalaa.nm.message.NmMessageContent.category.nullable.org.aalaa.nm.message.NmMessageContent.category,org.aalaa.nm.message.NmMessageContent.category.nullable.category,org.aalaa.nm.message.NmMessageContent.category.nullable.org.aalaa.com.ComLookup,org.aalaa.nm.message.NmMessageContent.category.nullable,nmMessageContent.category.nullable.org.aalaa.nm.message.NmMessageContent.category,nmMessageContent.category.nullable.category,nmMessageContent.category.nullable.org.aalaa.com.ComLookup,nmMessageContent.category.nullable,nullable.org.aalaa.nm.message.NmMessageContent.category,nullable.category,nullable.org.aalaa.com.ComLookup,nullable]; arguments [category,class org.aalaa.nm.message.NmMessageContent]; default message [Property [{0}] of class [{1}] cannot be null]
        content.put("category"    , comLookupService.getContentCategory("EVENT_NOTIFICATION"))
        for (AuthUser user in userList){
            content.put("recipient", user)
            NmMessageContent messageContent = new NmMessageContent(content)
            messageContent.validate(true)
            if(messageContent.hasErrors()){
                println messageContent.errors
            }
            messageContent.save(flush: true, failOnError: true)
        }
    }

    void sendMessageToEmployees(List<HrEmployee> employeeList, Map content){
        sendMessageToUsers(hrEmployeeService.getUserList(employeeList), content)
    }

}
