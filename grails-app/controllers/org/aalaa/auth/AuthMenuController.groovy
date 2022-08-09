package org.aalaa.auth

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional

import java.text.SimpleDateFormat

/**
 * @Created_By : AALAA
 * @Date       : 2018.04.01 01:37:28 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.OK

@Transactional(readOnly = true)
class AuthMenuController {
    //static allowedMethods = [save: "POST", update: "PUT"]

    AuthUser              currentUser
    Date                  currentDate
    SimpleDateFormat      dateParseFormat
    AuthMenuService       authMenuService
    SpringSecurityService springSecurityService

    def beforeInterceptor = {
        currentDate     = new Date()
        currentUser     = springSecurityService.getCurrentUser()
        dateParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
    }

    def index(Integer max) {
        /*
        Integer defMin   = params.min ? Integer.parseInt(params.min) : grailsApplication.config.show.item.min,
                defMax   = params.max ? Integer.parseInt(params.max) : grailsApplication.config.show.item.max
        params.max       = Math.min(max ?: defMin, defMax)
        String orderBy   = params.sort  ?: 'id',
               direction = params.order ?: 'desc'   //asc
        List<AuthMenu> authMenuInstanceList = AuthMenu.createCriteria().list(params) {
            if(params.code)
                ilike('code', '%' + params.code + '%')
            if(params.description)
                ilike('description', '%' + params.description + '%')
            if(params.isActive)
                eq('isActive', true)
            if(params.isExternal)
                eq('isExternal', true)
            if(params.isOpenNewTab)
                eq('isOpenNewTab', true)
            if(params.menuIcon)
                ilike('menuIcon', '%' + params.menuIcon + '%')
            if(params.parentMenu)
                eq('parentMenu', AuthMenu.get(params.parentMenu))
            if(params.sortOrder)
                eq('sortOrder', Integer.parseInt(params.sortOrder))
            if(params.title)
                ilike('title', '%' + params.title + '%')
            if(params.toolTip)
                ilike('toolTip', '%' + params.toolTip + '%')
            if(params.url)
                ilike('url', '%' + params.url + '%')
            order(orderBy, direction)
        }
        [authMenuInstanceList: authMenuInstanceList, authMenuInstanceTotal: authMenuInstanceList.getTotalCount(), authMenuList: authMenuService.getMenuTree()]
        */

        [authMenuInstanceList: AuthMenu.list(params)]
    }

    def create() {
        [authMenuInstance: new AuthMenu(params), authMenuList: authMenuService.getMenuTree()]
    }

    @Transactional
    save(AuthMenu authMenuInstance) {
        if (authMenuInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "ER-S1-AuthMenu : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(authMenuInstance, ['logCreatedBy'])
        authMenuInstance.logCreatedBy = currentUser
        
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      childMenu                                                                                                                                      
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        authMenuInstance.childMenu = null
        int i = 0
        while (params["childMenu[" + i + "]"]) {
            AuthMenu childMenu
            Map childMenuParams = params["childMenu[" + i + "]"]
        
            if (childMenuParams?.id) {
                childMenu = AuthMenu.get(childMenuParams?.id)
            }else{
                childMenu = new AuthMenu(childMenuParams)
            }
            childMenu.validate()
            authMenuInstance.addToChildMenu(childMenu)
            i++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------

        authMenuInstance.validate()
        if (authMenuInstance.hasErrors()) {
            flash.error = "ER-S2-AuthMenu : " + authMenuInstance.errors
            render(view: "create", model: [authMenuInstance: authMenuInstance])
            return
        }
        try {
            authMenuInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.error = "EX-S1-AuthMenu : " + e
            render(view: "create", model: [authMenuInstance: authMenuInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.authMenu.pageTitle", default: "AuthMenu"), authMenuInstance.id])
                redirect authMenuInstance
            }
            '*' { respond authMenuInstance, [status: CREATED] }
        }
    }

    def show(AuthMenu authMenuInstance) {
        [authMenuInstance: authMenuInstance]
    }

    def edit(AuthMenu authMenuInstance) {
        [authMenuInstance: authMenuInstance, authMenuList: authMenuService.getMenuTree()]
    }

    @Transactional
    update(AuthMenu authMenuInstance) {
        if (authMenuInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "ER-U1-AuthMenu : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (authMenuInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [authMenuInstance: authMenuInstance])
                return
            }
        }
        
        authMenuInstance.logModifiedBy   = currentUser
        authMenuInstance.logModifiedDate = currentDate
        
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      childMenu                                                                                                                                      
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        authMenuInstance.childMenu = null
        int i = 0
        while (params["childMenu[" + i + "]"]) {
            AuthMenu childMenu
            Map childMenuParams = params["childMenu[" + i + "]"]
        
            if (childMenuParams?.id) {
                childMenu = AuthMenu.get(childMenuParams?.id)
            }else{
                childMenu = new AuthMenu(childMenuParams)
            }
            childMenu.validate()
            authMenuInstance.addToChildMenu(childMenu)
            i++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------

        authMenuInstance.validate()
        if (authMenuInstance.hasErrors()) {
            flash.error = "ER-U2-AuthMenu : " + authMenuInstance.errors
            render(view: "edit", model: [authMenuInstance: authMenuInstance])
            return
        }
        try {
            authMenuInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.error = "EX-U1-AuthMenu : " + e
            render(view: "edit", model: [authMenuInstance: authMenuInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.authMenu.pageTitle", default: "AuthMenu"), authMenuInstance.id])
                redirect authMenuInstance
            }
            '*'{ respond authMenuInstance, [status: OK] }
        }
    }

    @Transactional
    delete(AuthMenu authMenuInstance) {
        if (authMenuInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "ER-D1-AuthMenu : Record not found...!")
            redirect(action: "index")
        }
        try {
            authMenuInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.error = "EX-D1-AuthMenu : " + e
            redirect(action: "index")
        }
    }
}
