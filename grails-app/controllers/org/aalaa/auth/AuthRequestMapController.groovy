package org.aalaa.auth

/**
 * @Created_By : AALAA
 * @Date       : 2016.10.05 01:23:32 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

import grails.plugin.springsecurity.SpringSecurityService

import java.text.SimpleDateFormat
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AuthRequestMapController {

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
//        Integer min = params.min ? Integer.parseInt(params.min) : grailsApplication.config.show.item.min,
//                max = params.max ? Integer.parseInt(params.max) : grailsApplication.config.show.item.max
//        params.max  = Math.min(min, max)
        /*
        String orderBy   = params.sort  ?: "id",
               direction = params.order ?: "desc"   //asc

        List<AuthRequestMap> authRequestMapInstanceList = AuthRequestMap.createCriteria().list(params) {
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
        [authRequestMapInstanceList: authRequestMapInstanceList]
        */
        [authRequestMapInstanceList: AuthRequestMap.list(params)]
        //[authRequestMapInstanceList: AuthRequestMap.list(params), authRequestMapInstanceCount: AuthRequestMap.count()]
    }

    def create() {
        [authRequestMapInstance : new AuthRequestMap(params)]
    }

    @Transactional
    save(AuthRequestMap authRequestMapInstance) {
        if (authRequestMapInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "Error-Save-AuthRequestMap-L21 : Record not found...!")
            redirect(action: "create")
        }
        bindData(authRequestMapInstance, ["logCreatedBy"])
        authRequestMapInstance.logCreatedBy = currentUser
        authRequestMapInstance.validate()
        if (authRequestMapInstance.hasErrors()) {
            flash.error = "ER-S1-AuthRequestMap : " + authRequestMapInstance.errors
            render(view: "create", model: [authRequestMapInstance: authRequestMapInstance])
            return
        }
        try {
            authRequestMapInstance.save flush:true
        }
        catch (Exception e) {
            flash.error = "EX-S2-AuthRequestMap : " + e
            render(view: "create", model: [authRequestMapInstance: authRequestMapInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "authRequestMap.pageTitle.label", default: "AuthRequestMap"), authRequestMapInstance.id])
                redirect authRequestMapInstance
            }
            '*' { respond authRequestMapInstance, [status: CREATED] }
        }
    }

    def show(AuthRequestMap authRequestMapInstance) {
        [authRequestMapInstance : authRequestMapInstance]
    }

    def edit(AuthRequestMap authRequestMapInstance) {
        [authRequestMapInstance : authRequestMapInstance]
    }

    @Transactional
    update(AuthRequestMap authRequestMapInstance) {
        if (authRequestMapInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "Error-Update-AuthRequestMap-L61 : Record not found...!")
            redirect(action: "update")
        }
        if (params.version) {
            if (authRequestMapInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [authRequestMapInstance: authRequestMapInstance])
                return
            }
        }
        authRequestMapInstance.logModifiedBy   = currentUser
        authRequestMapInstance.logModifiedDate = currentDate
        authRequestMapInstance.validate()
        if (authRequestMapInstance.hasErrors()) {
            flash.error = "ER-U1-AuthRequestMap : " + authRequestMapInstance.errors
            render(view: "update", model: [authRequestMapInstance: authRequestMapInstance])
            return
        }
        try {
            authRequestMapInstance.save flush:true
        } catch (Exception e) {
            flash.error = "EX-U2-AuthRequestMap : " + e
            render(view: "update", model: [authRequestMapInstance: authRequestMapInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "authRequestMap.pageTitle.label", default: "AuthRequestMap"), authRequestMapInstance.id])
                redirect authRequestMapInstance
            }
            '*'{ respond authRequestMapInstance, [status: OK] }
        }
    }

    @Transactional
    delete(AuthRequestMap authRequestMapInstance) {
        if (authRequestMapInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "Error-Delete-AuthRequestMap-L93 : Record not found...!")
            redirect(action: "index")
        }
        try {
            authRequestMapInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.error = "EX-D1-AuthRequestMap : " + e
            redirect(action: "index")
        }
    }
}
