package org.aalaa.auth

/**
 * @Created_By : AALAA
 * @Date       : 2017.10.05 01:27:52 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

import grails.plugin.springsecurity.SpringSecurityService

import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AuthRoleController {

    AuthUser              currentUser
    Date                  currentDate
    SimpleDateFormat      dateParseFormat
    SpringSecurityService springSecurityService

    def beforeInterceptor = {
        currentDate     = new Date()
        currentUser     = springSecurityService.getCurrentUser()
        dateParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
    }

    def index() {
        [authRoleInstanceList: AuthRole.list(params)]
    }

    def create() {
        [authRoleInstance : new AuthRole(params)]
    }

    @Transactional
    save(AuthRole authRoleInstance) {
        if (authRoleInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "Error-Save-AuthRole-L21 : Record not found...!")
            redirect(action: "create")
        }
        bindData(authRoleInstance, ["logCreatedBy"])
        authRoleInstance.logCreatedBy = currentUser
        authRoleInstance.validate()
        if (authRoleInstance.hasErrors()) {
            flash.error = "ER-S1-AuthRole : " + authRoleInstance.errors
            render(view: "create", model: [authRoleInstance: authRoleInstance])
            return
        }
        try {
            authRoleInstance.save flush:true
        }
        catch (Exception e) {
            flash.error = "EX-S2-AuthRole : " + e
            render(view: "create", model: [authRoleInstance: authRoleInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "authRole.pageTitle.label", default: "AuthRole"), authRoleInstance.id])
                redirect authRoleInstance
            }
            '*' { respond authRoleInstance, [status: CREATED] }
        }
    }

    def show(AuthRole authRoleInstance) {
        [authRoleInstance : authRoleInstance]
    }

    def edit(AuthRole authRoleInstance) {
        [authRoleInstance : authRoleInstance]
    }

    @Transactional
    update(AuthRole authRoleInstance) {
        if (authRoleInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "Error-Update-AuthRole-L61 : Record not found...!")
            redirect(action: "update")
        }
        if (params.version) {
            if (authRoleInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [authRoleInstance: authRoleInstance])
                return
            }
        }
        authRoleInstance.logModifiedBy   = currentUser
        authRoleInstance.logModifiedDate = currentDate
        authRoleInstance.validate()
        if (authRoleInstance.hasErrors()) {
            flash.error = "ER-U1-AuthRole : " + authRoleInstance.errors
            render(view: "update", model: [authRoleInstance: authRoleInstance])
            return
        }
        try {
            authRoleInstance.save flush:true
        } catch (Exception e) {
            flash.error = "EX-U2-AuthRole : " + e
            render(view: "update", model: [authRoleInstance: authRoleInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "authRole.pageTitle.label", default: "AuthRole"), authRoleInstance.id])
                redirect authRoleInstance
            }
            '*'{ respond authRoleInstance, [status: OK] }
        }
    }

    @Transactional
    delete(AuthRole authRoleInstance) {
        if (authRoleInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "Error-Delete-AuthRole-L93 : Record not found...!")
            redirect(action: "index")
        }
        try {
            authRoleInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.error = "EX-D1-AuthRole : " + e
            redirect(action: "index")
        }
    }
}
