package org.aalaa.auth

/**
 * @Created_By : AALAA
 * @Date       : 2017.10.05 01:26:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

import grails.plugin.springsecurity.SpringSecurityService

import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AuthLandingPageController {

    //static allowedMethods = [save: "POST", update: "PUT"]

    AuthUser              currentUser
    Date                  currentDate
    SimpleDateFormat      dateParseFormat
    SpringSecurityService springSecurityService

    def beforeInterceptor = {
        currentDate     = new Date()
        currentUser     = springSecurityService.getCurrentUser()
        dateParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
    }

//    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100)
    def index() {
        Integer min = params.min ? Integer.parseInt(params.min) : grailsApplication.config.show.item.min,
                max = params.max ? Integer.parseInt(params.max) : grailsApplication.config.show.item.max
        params.max  = Math.min(min, max)
        /*
        String orderBy   = params.sort  ?: "id",
               direction = params.order ?: "desc"   //asc

        List<AuthLandingPage> authLandingPageInstanceList = AuthLandingPage.createCriteria().list(params) {
            eq("bIsActive", true)
            if(params.sName)
                ilike("sName", "%" + params.sName.trim() + "%")
            if (params.code) {
                and {
                    or {
                        eq("codeA", params.codeOne)
                        eq("codeB", params.codeTwo)
                    }
                }
            }
            if(params.lItems)
                inList("lItems", itemList)
            if (params.fromDate && params.toDate) {
                ge("dCreatedDate", dateParseFormat.parse(params.fromDate))
                lt("dCreatedDate", dateParseFormat.parse(params.toDate) + 1)
            } else if (params.fromDate) {
                ge("dCreatedDate", dateParseFormat.parse(params.fromDate))
            } else if (params.toDate) {
                lt("dCreatedDate", dateParseFormat.parse(params.toDate) + 1)
            }

            order(orderBy, direction)
        }
        [authLandingPageInstanceList: authLandingPageInstanceList]
        */
        [authLandingPageInstanceList: AuthLandingPage.list(params)]
        //[authLandingPageInstanceList: AuthLandingPage.list(params), authLandingPageInstanceCount: AuthLandingPage.count()]
    }

    def create() {
        [authLandingPageInstance : new AuthLandingPage(params)]
    }

    @Transactional
    save(AuthLandingPage authLandingPageInstance) {
        if (authLandingPageInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "Error-Save-AuthLandingPage-L21 : Record not found...!")
            redirect(action: "create")
        }
        bindData(authLandingPageInstance, ["logCreatedBy"])
        authLandingPageInstance.logCreatedBy = currentUser
        authLandingPageInstance.validate()
        if (authLandingPageInstance.hasErrors()) {
            flash.error = "ER-S1-AuthLandingPage : " + authLandingPageInstance.errors
            render(view: "create", model: [authLandingPageInstance: authLandingPageInstance])
            return
        }
        try {
            authLandingPageInstance.save flush:true
        }
        catch (Exception e) {
            flash.error = "EX-S2-AuthLandingPage : " + e
            render(view: "create", model: [authLandingPageInstance: authLandingPageInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "authLandingPage.pageTitle.label", default: "AuthLandingPage"), authLandingPageInstance.id])
                redirect authLandingPageInstance
            }
            '*' { respond authLandingPageInstance, [status: CREATED] }
        }
    }

    def show(AuthLandingPage authLandingPageInstance) {
        [authLandingPageInstance : authLandingPageInstance]
    }

    def edit(AuthLandingPage authLandingPageInstance) {
        [authLandingPageInstance : authLandingPageInstance]
    }

    @Transactional
    update(AuthLandingPage authLandingPageInstance) {
        if (authLandingPageInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "Error-Update-AuthLandingPage-L61 : Record not found...!")
            redirect(action: "update")
        }
        if (params.version) {
            if (authLandingPageInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [authLandingPageInstance: authLandingPageInstance])
                return
            }
        }
        authLandingPageInstance.logModifiedBy   = currentUser
        authLandingPageInstance.logModifiedDate = currentDate
        authLandingPageInstance.validate()
        if (authLandingPageInstance.hasErrors()) {
            flash.error = "ER-U1-AuthLandingPage : " + authLandingPageInstance.errors
            render(view: "update", model: [authLandingPageInstance: authLandingPageInstance])
            return
        }
        try {
            authLandingPageInstance.save flush:true
        } catch (Exception e) {
            flash.error = "EX-U2-AuthLandingPage : " + e
            render(view: "update", model: [authLandingPageInstance: authLandingPageInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "authLandingPage.pageTitle.label", default: "AuthLandingPage"), authLandingPageInstance.id])
                redirect authLandingPageInstance
            }
            '*'{ respond authLandingPageInstance, [status: OK] }
        }
    }

    @Transactional
    delete(AuthLandingPage authLandingPageInstance) {
        if (authLandingPageInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "Error-Delete-AuthLandingPage-L93 : Record not found...!")
            redirect(action: "index")
        }
        try {
            authLandingPageInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.error = "EX-D1-AuthLandingPage : " + e
            redirect(action: "index")
        }
    }
}
