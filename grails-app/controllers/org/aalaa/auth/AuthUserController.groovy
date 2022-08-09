/**
 * @Created_By : AALAA
 * @Date       : 2021.12.08 05:13:29 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.aalaa.auth

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.aalaa.adm.AdmBranch
import org.aalaa.com.DbService
import org.aalaa.hr.HrEmployee
import org.aalaa.sys.SysLogPwd
import org.aalaa.sys.SystemService
import org.aalaa.sys.TrackerService
import org.codehaus.groovy.grails.commons.GrailsApplication
import org.springframework.security.core.context.SecurityContextHolder
import service.org.aalaa.util.Aes256

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.OK

@Transactional(readOnly = true)
class AuthUserController {
    //static allowedMethods = [save: "POST", update: "PUT"]

    AuthUser              currentUser
    Date                  currentDate
    SimpleDateFormat      dateParseFormat
    DbService             dbService
    TrackerService        trackerService
    SpringSecurityService springSecurityService
    GrailsApplication     grailsApplication
    SystemService         systemService
    AuthUserService       authUserService
    AuthMenuService       authMenuService
    String                currentUserRoles

    def beforeInterceptor = {
        currentDate      = new Date()
        currentUser      = springSecurityService.getCurrentUser()
        currentUserRoles = currentUser?.authorities?.toString()
        dateParseFormat  = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
    }

    /**
     * @Query:
     *  SELECT U.*
     *   FROM A_AUTH_USER U, A_AUTH_ROLE R, A_AUTH_USER_LK_ROLE UR
     *  WHERE     1 = 1
     *        AND UR.AUTH_USER_ID = U.ID
     *        AND R.ID = UR.AUTH_ROLE_ID
     *        AND R.RANK >= (SELECT MIN (RANK)
     *                         FROM A_AUTH_ROLE A, A_AUTH_USER_LK_ROLE B
     *                        WHERE A.ID = B.AUTH_ROLE_ID AND B.AUTH_USER_ID = ${currentUser?.id})
     *  UNION
     *  SELECT U.*
     *    FROM A_AUTH_USER U
     *   WHERE     1 = 1
     *        AND ID NOT IN (SELECT U.ID
     *                         FROM A_AUTH_USER U, A_AUTH_USER_LK_ROLE UR
     *                        WHERE 1 = 1 AND UR.AUTH_USER_ID = U.ID)
     **/
    def index() {
        List<AuthUser> authUserList = new ArrayList()
        authUserList.addAll(AuthUser.executeQuery("select ur.authUser from AuthRole r, AuthUserLkRole ur where ur.authRole = r and r.rank >= ${session.getAttribute("USER_ROLES")?.rank?.min()}"))
        authUserList.addAll(AuthUser.executeQuery("select u from AuthUser u where id not in (select a.id from AuthUser a, AuthUserLkRole ur where ur.authUser = u)"))

        //[authUserInstanceList: AuthUser.executeQuery("select ur.authUser from AuthRole r, AuthUserLkRole ur where ur.authRole = r and r.rank >= ${session.getAttribute("USER_ROLES")?.rank?.min()}")]
        //[authUserInstanceList: AuthUser.findAllWhere(query)]
        [authUserInstanceList: authUserList.unique()]
    }

    def create(AuthUser authUserInstance) {
        List<String> permittedRoles    = new ArrayList<String>(),
                     permittedBranches = new ArrayList<String>()
        if(!authUserInstance){
            if(params.ui){
                authUserInstance = AuthUser.get(params.ui)
                if(authUserInstance){
                    permittedRoles    = AuthUserLkRole?.findAllByAuthUser(authUserInstance)?.authRole?.authority
                    permittedBranches = AuthUserLkBranch?.findAllByAuthUser(authUserInstance)?.admBranch?.keyword
                }
            }
            else{
                authUserInstance = new AuthUser(params)
            }
        }
        else{
            permittedRoles    = AuthUserLkRole?.findAllByAuthUser(authUserInstance)?.authRole?.authority
            permittedBranches = AuthUserLkBranch?.findAllByAuthUser(authUserInstance)?.admBranch?.keyword
        }

        AuthUserProfile authUserProfileInstance = authUserInstance?.authUserProfile

        if(!authUserProfileInstance){
            authUserProfileInstance                   = new AuthUserProfile()
            authUserProfileInstance.authUser          = authUserInstance

            AuthUserProperty authUserPropertyInstance = new AuthUserProperty()
            authUserPropertyInstance.authUserProfile  = authUserProfileInstance

            authUserProfileInstance.authUserProperty  = authUserPropertyInstance

            authUserInstance.authUserProfile          = authUserProfileInstance
        }

        AuthUserLkEmployee authUserLkEmployeeInstance = authUserInstance?.authUserLkEmployee

        if(!authUserLkEmployeeInstance){
            authUserLkEmployeeInstance          = new AuthUserLkEmployee()
            authUserLkEmployeeInstance.authUser = authUserInstance

            authUserInstance.authUserLkEmployee = authUserLkEmployeeInstance
        }

        [
            authRoleList              : systemService.getRoleList(),
            admBranchList             : systemService.getUserBranchList(),
            authUserInstance          : authUserInstance,
            authUserProfileInstance   : authUserProfileInstance,
            authUserLkEmployeeInstance: authUserLkEmployeeInstance,
            permittedRoles            : permittedRoles,
            permittedBranches         : permittedBranches,
            at                        : params.at,
            params                    : params
        ]
    }

    @Transactional
    save(AuthUser authUserInstance) {
        if (authUserInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-AuthUser: Record not found...!")
            redirect(action: "index")
        }

        String newPassword = params?.password?.trim(), confirmPassword = params?.confirmPassword?.trim()
        if(!newPassword || !confirmPassword){
            flash.warning = "You must have to enter that 'Password' and 'Confirm Password'!"
            redirect(action: "create", id: authUserInstance?.id)
            return
        }
        else {
            if(newPassword != confirmPassword){
                flash.warning = "You must have to ensure that 'Password' and 'Confirm Password' are same!"
                redirect(action: "create", id: authUserInstance?.id)
                return
            }
            else{
                String newCode = Aes256?.encrypt(newPassword)
                if(newCode){
                    authUserInstance.hdCode   = newCode
                    authUserInstance.password = newPassword
                }
                else {
                    flash.warning = "Sorry, you could not enter an old/existing password...!"
                    redirect(action: "edit", id: authUserInstance?.id)
                    return
                }
            }
        }

        bindData(authUserInstance, ['logCreatedBy'])
        authUserInstance.logCreatedBy = currentUser?.id

        bindData(authUserInstance.authUserProfile, ["authUserProfile.dateOfBirth", "authUserProfile.authUser"])
        authUserInstance.authUserProfile.dateOfBirth  = params.authUserProfile.dateOfBirth ? dateParseFormat.parse(params.authUserProfile.dateOfBirth) : null
        authUserInstance.authUserProfile.authUser     = authUserInstance
        authUserInstance.authUserProfile.logCreatedBy = currentUser

        authUserInstance.validate()
        if (authUserInstance.hasErrors()) {
            flash.exception = "ER-S2-AuthUser:"
            trackerService.logError([errorMessage: authUserInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [authUserInstance: authUserInstance])
            return
        }
        try {
            authUserInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-AuthUser : " + e
            render(view: "create", model: [authUserInstance: authUserInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.authUser.pageTitle", default: "AuthUser"), authUserInstance.id])
                redirect authUserInstance
            }
            '*' { respond authUserInstance, [status: CREATED] }
        }
    }

    def show(AuthUser authUserInstance) {
        List<String> permittedRoles    = new ArrayList<String>(),
                     permittedBranches = new ArrayList<String>()
        if(authUserInstance){
            try {
                permittedRoles    = AuthUserLkRole?.findAllByAuthUser(authUserInstance)?.authRole?.authority
            } catch (Exception e) {
                println e
            }
            try {
                permittedBranches = AuthUserLkBranch?.findAllByAuthUser(authUserInstance)?.admBranch?.keyword
            } catch (Exception e) {
                println e
            }
        }

        [
            authUserInstance : authUserInstance,
            permittedRoles   : permittedRoles,
            permittedBranches: permittedBranches
        ]
    }

    def edit(AuthUser authUserInstance) {
        [authUserInstance : authUserInstance]
    }

    @Transactional
    update(AuthUser authUserInstance) {
        if (authUserInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-U1-AuthUser : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (authUserInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [authUserInstance: authUserInstance])
                return
            }
        }

        String newPassword = params?.password?.trim(), confirmPassword = params?.confirmPassword?.trim()
        if(newPassword || confirmPassword){
            if(newPassword != confirmPassword){
                flash.warning = "You must have to ensure that 'Password' and 'Confirm Password' are same!"
                redirect(action: "edit", id: authUserInstance?.id)
                return
            }
            else{
                //bindData(authUserInstance, ["password"])
                String oldCode = authUserInstance.hdCode,
                       newCode = Aes256.encrypt(newPassword, authUserInstance.id)

                //todo remove this block after all password reset.
                try {
                    oldCode = Aes256.encrypt(trackerService.getDcCodeHex(oldCode))
                }
                catch (Exception e) {
                    println e
                }

                Integer totalResult = dbService.countResultSet("SELECT COUNT(*) TOTAL FROM A_SYS_LOG_PWD WHERE 1=1 AND AUTH_USER_ID = :authUser AND code = :code", [authUser: authUserInstance?.id, code: newCode])
                SysLogPwd sysLogPwd = new SysLogPwd()

                if(oldCode != newCode && totalResult == 0){
                    sysLogPwd.authUser       = authUserInstance
                    sysLogPwd.logCreatedBy   = authUserInstance
                    sysLogPwd.code           = oldCode
                    sysLogPwd.password       = dbService.getFirstResult("SELECT PASSWORD R FROM A_AUTH_USER WHERE ID=:ID", ["ID": authUserInstance.id])["R"]
                    sysLogPwd.logCreatedDate = currentDate
                    sysLogPwd.save(flush: true, failOnError: true, errors: true)

                    authUserInstance.hdCode          = newCode
                    authUserInstance.password        = newPassword
                    authUserInstance.logModifiedBy   = currentUser?.id
                    authUserInstance.logModifiedDate = currentDate
                    authUserInstance.lastPwResetDate = currentDate    //no need due to ensure a reset by respective user.
                }
                else {
                    flash.warning = "Sorry, you could not enter an old/existing password...!"
                    redirect(action: "edit", id: authUserInstance?.id)
                    return
                }
            }
        }
        else {
            bindData(authUserInstance, ["password"])
            authUserInstance.password = dbService.getFirstResult("SELECT PASSWORD R FROM A_AUTH_USER WHERE ID=:ID", ["ID": authUserInstance.id])["R"]
        }

        authUserInstance.logModifiedBy   = currentUser?.id
        authUserInstance.logModifiedDate = currentDate

        bindData(authUserInstance.authUserProfile, ["authUserProfile.dateOfBirth", "authUserProfile.authUser"])
        authUserInstance.authUserProfile.dateOfBirth = params.authUserProfile.dateOfBirth ? dateParseFormat.parse(params.authUserProfile.dateOfBirth) : null
        authUserInstance.authUserProfile.authUser    = authUserInstance
        
        authUserInstance.validate()
        if (authUserInstance.hasErrors()) {
            flash.exception = "ER-U2-AuthUser:"
            trackerService.logError([errorMessage: authUserInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [authUserInstance: authUserInstance])
            return
        }
        try {
            authUserInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.exception = "EX-U1-AuthUser : " + e
            render(view: "edit", model: [authUserInstance: authUserInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.authUser.pageTitle", default: "AuthUser"), authUserInstance.id])
                redirect authUserInstance
            }
            '*'{ respond authUserInstance, [status: OK] }
        }
    }

    @Transactional
    delete(AuthUser authUserInstance) {
        if (authUserInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-D1-AuthUser : Record not found...!")
            redirect(action: "index")
        }
        try {
            authUserInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.exception = "EX-D1-AuthUser : " + e
            redirect(action: "index")
        }
    }

    def changePassword() {
        AuthUser authUserInstance = currentUser
        if (params.passwordChanged) {
            flash.message = "Password changed successfully...! Please login again."
            SecurityContextHolder.getContext().setAuthentication(null)
            params.passwordChanged = false
            redirect(controller: "login", action: "auth")
            return
        }
        if (request.method == 'POST') {
            if (params.newPassword == "" || params.confirmPassword == "") {
                flash.warning = "Password field cannot be empty...!"
                render view: 'changePassword', model: [userName: authUserInstance?.username, fullName: authUserInstance?.fullName]
                return
            }
            if (params.newPassword != params.confirmPassword) {
                flash.warning = "'New Password' and 'Confirm Password' are not matched...!"
                render view: 'changePassword', model: [userName: authUserInstance?.username, fullName: authUserInstance?.fullName]
                return
            }
            if (params.newPassword.contains(authUserInstance?.username)) {
                flash.warning = "Password should'nt contain userName...!"
                render view: 'changePassword', model: [userName: authUserInstance?.username, fullName: authUserInstance?.fullName]
                return
            }
            else {
                authUserInstance.password        = params.newPassword
                authUserInstance.hdCode          = trackerService.getHdCode(params.newPassword, authUserInstance.id)
                authUserInstance.logModifiedBy   = currentUser?.id
                authUserInstance.logModifiedDate = currentDate
                authUserInstance.validate()
                if (authUserInstance.hasErrors()) {
                    flash.error = "EX-01-changePassword : "
                    render view: 'changePassword', model: [userName: authUserInstance?.username, fullName: authUserInstance?.fullName]
                    return
                }
                Boolean passwordChanged = false
                if (authUserInstance.save(flush: true)) {
                    passwordChanged = true
                    flash.success   = "Your password has been changed successfully!"
                    redirect(controller: "authUser", action: "changePassword", params: [passwordChanged: passwordChanged])
                    return
                } else {
                    flash.error = "Password could not updated! Please try again later."
                    passwordChanged = false
                }
                redirect(controller: "authUser", action: "changePassword")
                return
            }
        }
        [userName: authUserInstance?.username, fullName: authUserInstance?.fullName]
    }

    @Transactional
    resetPassword(AuthUser authUserInstance) {
        Set<AuthRole> loggedUserRoles   = session.getAttribute("USER_ROLES"),
                      instanceUserRoles = authUserInstance?.authorities
        Boolean       allowReset        = false
        Integer       loggedUserRank    = loggedUserRoles?.rank?.min(),
                      instanceUserRank  = instanceUserRoles?.rank?.min()
        if((loggedUserRoles.toString().contains("DEVELOPER") || loggedUserRoles.toString().contains("ADMIN")) && loggedUserRank <= instanceUserRank){
            allowReset = true
        }
        if(!allowReset){
            flash.warning = "Sorry you are not authorised to reset this password..."
            redirect(controller: "authUser", action: "index")
            return
        }
        else {
            if (request.method == 'POST') {
                if (params.newPassword == "" || params.confirmPassword == "") {
                    flash.warning = "Password field cannot be empty...!"
                    render view: 'resetPassword', model: [userInstance: authUserInstance, userName: authUserInstance?.username, fullName: authUserInstance?.fullName]
                    return
                }
                if (params.newPassword != params.confirmPassword) {
                    flash.warning = "'New Password' and 'Confirm Password' are not matched...!"
                    render view: 'resetPassword', model: [userInstance: authUserInstance, userName: authUserInstance?.username, fullName: authUserInstance?.fullName]
                    return
                }
                if (params.newPassword.contains(authUserInstance?.username)) {
                    flash.warning = "Password should'nt contain userName...!"
                    render view: 'resetPassword', model: [userInstance: authUserInstance, userName: authUserInstance?.username, fullName: authUserInstance?.fullName]
                    return
                } else {
                    authUserInstance.resetAtNextLogin = params["resetAtNextLogin"] ? true : false
                    authUserInstance.password         = params.newPassword
                    authUserInstance.hdCode           = trackerService.getHdCode(params.newPassword, authUserInstance.id)
                    authUserInstance.logModifiedBy    = currentUser?.id
                    authUserInstance.lastPwResetDate  = currentDate
                    authUserInstance.logModifiedDate  = currentDate

                    authUserInstance.validate()
                    if (authUserInstance.hasErrors()) {
                        flash.error = "EX-RP-01: "
                        render view: 'resetPassword', model: [userInstance: authUserInstance, userName: authUserInstance?.username, fullName: authUserInstance?.fullName]
                        return
                    }
                    if (authUserInstance.save(flush: true)) {
                        flash.success = "Password changed successfully."
                        redirect(controller: "authUser", action: "index")
                        return
                    } else {
                        flash.error = "Sorry, failed to reset password...! Please try again later."
                    }
                    redirect(controller: "authUser", action: "resetPassword", id: authUserInstance?.id)
                    return
                }
            }
        }
        [userInstance:authUserInstance, userName: authUserInstance?.username, fullName: authUserInstance?.fullName]
    }

    def dcCode(AuthUser authUserInstance) {
        if (authUserInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "ER-DCC-User-01 : No Record found...!")
            redirect(controller: 'user', action: 'index')
            return
        }

        if (!currentUser.authorities.toString().contains("ROLE_DEVELOPER")) {
            flash.message = "Sorry, you are not authorised to access this service...!"
            redirect(controller: 'authHome', action: 'index')
            return
        }

        [authUserInstance: authUserInstance]
    }

    @Transactional
    def saveGeneralInfo(AuthUser authUserInstance) {
        if (authUserInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-S1-AuthUser: Record not found...!")
            redirect(action: "index")
        }

        String newPassword = params?.password?.trim(), confirmPassword = params?.confirmPassword?.trim()
        if(authUserInstance?.id && !newPassword && !confirmPassword){
            /*
            String oldCode = authUserInstance.hdCode,
                   newCode = Aes256.encrypt(newPassword, authUserInstance.id)

            if(!oldCode)
            try {
                oldCode = Aes256.encrypt(trackerService.getDcCode(oldCode))
            }
            catch (Exception e) {
                println e
            }

            if(!oldCode)
            try {
                oldCode = Aes256.encrypt(trackerService.getDcCodeHex(oldCode))
            }
            catch (Exception e) {
                println e
            }

            Integer totalResult = dbService.countResultSet("SELECT COUNT(*) TOTAL FROM A_SYS_LOG_PWD WHERE 1=1 AND AUTH_USER_ID = :authUser AND code = :code", [authUser: authUserInstance?.id, code: newCode])
            SysLogPwd sysLogPwd = new SysLogPwd()

            if(oldCode != newCode && totalResult == 0){
                sysLogPwd.authUser       = authUserInstance
                sysLogPwd.logCreatedBy   = authUserInstance
                sysLogPwd.code           = oldCode
                sysLogPwd.password       = dbService.getFirstResult("SELECT PASSWORD R FROM A_AUTH_USER WHERE ID=:ID", ["ID": authUserInstance.id])["R"]
                sysLogPwd.logCreatedDate = currentDate
                sysLogPwd.version        = (totalResult + 1)
                sysLogPwd.save(flush: true, failOnError: true, errors: true)

                authUserInstance.hdCode          = newCode
                authUserInstance.password        = newPassword
                authUserInstance.logModifiedBy   = authUserInstance?.id
                authUserInstance.logModifiedDate = currentDate
                authUserInstance.lastPwResetDate = currentDate    //no need due to ensure a reset by respective user.
            }
            else {
                flash.warning = "Sorry, you could not enter an old/existing password...!"
                redirect(action: "edit", id: authUserInstance?.id)
                return
            }
            */
        }
        else if(!newPassword || !confirmPassword){
            flash.warning = "You must have to enter that 'Password' and 'Confirm Password'!"
            redirect(action: "create", id: authUserInstance?.id)
            return
        }
        else {
            if(newPassword != confirmPassword){
                flash.warning = "You must have to ensure that 'Password' and 'Confirm Password' are same!"
                redirect(action: "create", id: authUserInstance?.id)
                return
            }
            else{
                String newCode = Aes256.encrypt(newPassword)
                if(newCode){
                    authUserInstance.hdCode   = newCode
                    authUserInstance.password = newPassword
                }
                else {
                    flash.warning = "Sorry, you could not enter an old/existing password...!"
                    redirect(action: "create", id: authUserInstance?.id)
                    return
                }
            }
        }

        bindData(authUserInstance, ['logCreatedBy'])
        if(!authUserInstance.id){
            authUserInstance.logCreatedBy = currentUser?.id
        }
        else{
            authUserInstance.logModifiedBy   = currentUser?.id
            authUserInstance.logModifiedDate = currentDate
        }

        authUserInstance.validate()
        if (authUserInstance.hasErrors()) {
            trackerService.logError([errorMessage: authUserInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [authUserInstance: authUserInstance, at: "gi", ui : authUserInstance.id])
            return
        }
        try {
            authUserInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-AuthUser : " + e
            render(view: "create", model: [authUserInstance: authUserInstance, at: "pi", ui : authUserInstance.id])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = "Basic Information Saved Successfully...!"
                redirect(action: "create", params: [at: "pi", ui: authUserInstance.id])
            }
            '*' { respond authUserInstance, [status: CREATED] }
        }
    }

    def savePersonalInfo() {
        if(!params.id){
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-SPI-01: Record not found...!")
            redirect(action: "index")
        }

        Map      profileParams    = params["authUserProfile"]
        AuthUser authUserInstance = AuthUser.get(params.id)
        profileParams.authUser    = authUserInstance
        AuthUserProfile authUserProfileInstance = authUserInstance.authUserProfile

        if(!authUserProfileInstance){
            authUserProfileInstance = new AuthUserProfile(params["authUserProfile"])
        }
        else{
            authUserProfileInstance.properties = profileParams
        }

        if (authUserProfileInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-SPI-02: Record not found...!")
            redirect(action: "index")
        }

        bindData(authUserProfileInstance, ["logCreatedBy", "dateOfBirth"])
        if(!authUserProfileInstance.id){
            authUserProfileInstance.logCreatedBy = currentUser
            authUserProfileInstance.dateOfBirth  = profileParams.dateOfBirth ? dateParseFormat.parse(profileParams.dateOfBirth) : null
        }
        else{
            authUserProfileInstance.logModifiedBy   = currentUser
            authUserProfileInstance.logModifiedDate = currentDate
            authUserProfileInstance.dateOfBirth     = profileParams.dateOfBirth ? dateParseFormat.parse(profileParams.dateOfBirth) : authUserProfileInstance.dateOfBirth
        }

        if(!authUserProfileInstance.authUserProperty){
            authUserProfileInstance.authUserProperty = new AuthUserProperty()
        }

        authUserProfileInstance.validate()
        if (authUserProfileInstance.hasErrors()) {
            trackerService.logError([errorMessage: authUserProfileInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [authUserProfileInstance: authUserProfileInstance, at: "pi", ui : params.id])
            return
        }
        try {
            authUserProfileInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-AuthUser : " + e
            render(view: "create", model: [authUserProfileInstance: authUserProfileInstance, at: "pi", ui : params.id])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = "Personal Information Saved Successfully...!"
                redirect(action: "create", params: [at: "ei", ui: params.id])
            }
            '*' { respond authUserProfileInstance, [status: CREATED] }
        }
    }

    def saveEmployeeInfo() {
        if(!params.id){
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-SPI-01: Record not found...!")
            redirect(action: "index")
        }

        Map        authUserLkEmployeeParams           = params["authUserLkEmployee"]
        AuthUser   authUserInstance                   = AuthUser.get(authUserLkEmployeeParams.authUser)
        HrEmployee hrEmployeeInstance                 = HrEmployee.get(authUserLkEmployeeParams.hrEmployee)
        authUserLkEmployeeParams.authUser             = authUserInstance
        authUserLkEmployeeParams.hrEmployee           = hrEmployeeInstance
        AuthUserLkEmployee authUserLkEmployeeInstance = authUserInstance.authUserLkEmployee

        if(!authUserLkEmployeeInstance){
            authUserLkEmployeeInstance = new AuthUserLkEmployee(params["authUserLkEmployee"])
        }
        else{
            authUserLkEmployeeInstance.properties = authUserLkEmployeeParams
        }

        if (authUserLkEmployeeInstance == null) {
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-SPI-02: Record not found...!")
            redirect(action: "index")
        }

        bindData(authUserLkEmployeeInstance, ["userName", "employeeName"])
        authUserLkEmployeeInstance.userName     = authUserLkEmployeeInstance?.authUser?.username
        authUserLkEmployeeInstance.employeeName = authUserLkEmployeeInstance?.hrEmployee?.nameFull

        authUserLkEmployeeInstance.validate()
        if (authUserLkEmployeeInstance.hasErrors()) {
            trackerService.logError([errorMessage: authUserLkEmployeeInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [authUserLkEmployeeInstance: authUserLkEmployeeInstance, at: "ei", ui : params.id])
            return
        }
        try {
            authUserLkEmployeeInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.exception = "EX-S1-AuthUser : " + e
            render(view: "create", model: [authUserLkEmployeeInstance: authUserLkEmployeeInstance, at: "ei", ui : params.id])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = "Employee Account Has Been Assigned Successfully...!"
                redirect(action: "create", params: [at: "ri", ui: params.id])
            }
            '*' { respond authUserLkEmployeeInstance, [status: CREATED] }
        }
    }

    def saveRoleInfo(AuthUser authUserInstance){
        if(!authUserInstance){
            if(params.ui){
                authUserInstance = AuthUser.get(params.ui)
            }
        }

        if(!authUserInstance){
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-SPI-01: Record not found...!")
            redirect(action: "index")
        }

        Map            permittedRoles = params?.authUserLkRole?.authRole
        List<AuthRole> roleList       = new ArrayList()
        Set<AuthRole>  authUserRoles  = authUserService.authUserRoles
        if(authUserRoles.toString().contains("DEVELOPER")){
            roleList = AuthRole.list()
        }
        else{
            roleList = AuthRole.executeQuery("select r from AuthRole r where r.authority not like '%DEVELOPER%'")
        }

        int roleCount = permittedRoles?.size()
        for(AuthRole r in roleList){
            try {
                if(permittedRoles[r.authority]){
                    AuthUserLkRole authUserLkRole = AuthUserLkRole.findByAuthUserAndAuthRole(authUserInstance, r)
                    if(!authUserLkRole){
                        new AuthUserLkRole([authUser: authUserInstance, authRole: r]).save(flush: true, failOnError: true)
                        roleCount += 1
                    }
                }
                else{
                    AuthUserLkRole authUserLkRole = AuthUserLkRole.findByAuthUserAndAuthRole(authUserInstance, r)
                    if(authUserLkRole){
                        authUserLkRole.delete(flush: true)
                        roleCount -= 1
                    }
                }
            } catch (Exception e) {
                println e
            }
        }

        if(roleCount > 0){
            flash.success = "Role Information Saved Successfully...!"
            redirect(action: "create", params: [at: "bi", ui: params.id])
        }
        else{
            redirect(action: "create", params: [at: "ri", ui: params.id])
        }
    }

    def saveBranchInfo(AuthUser authUserInstance){
        if(!authUserInstance){
            if(params.ui){
                authUserInstance = AuthUser.get(params.ui)
            }
        }

        if(!authUserInstance){
            flash.exception = message(code: "default.message.recordNotFound", default: "ER-SPI-01: Record not found...!")
            redirect(action: "index")
        }

        List<AdmBranch> branchList = systemService.getUserBranchList()
        Integer branchCount = 0
        if(branchList){
            Map permittedBranches = params?.authUserLkBranch?.admBranch
            if(permittedBranches){
                branchCount = permittedBranches?.size()
                for(AdmBranch b in branchList){
                    try {
                        if(permittedBranches[b.keyword]){
                            AuthUserLkBranch authUserLkBranch = AuthUserLkBranch.findByAuthUserAndAdmBranch(authUserInstance, b)
                            if(!authUserLkBranch){
                                new AuthUserLkBranch([authUser: authUserInstance, admBranch: b]).save(flush: true, failOnError: true)
                                branchCount += 1
                            }
                        }
                        else{
                            AuthUserLkBranch authUserLkBranch = AuthUserLkBranch.findByAuthUserAndAdmBranch(authUserInstance, b)
                            if(authUserLkBranch){
                                authUserLkBranch.delete(flush: true)
                                branchCount -= 1
                            }
                        }
                    } catch (Exception e) {
                        println e
                    }
                }
            }
            else{
                for(AdmBranch b in branchList){
                    AuthUserLkBranch authUserLkBranch = AuthUserLkBranch.findByAuthUserAndAdmBranch(authUserInstance, b)
                    if(authUserLkBranch){
                        authUserLkBranch.delete(flush: true)
                        branchCount -= 1
                    }
                }
            }
        }

        if(branchCount > 0){
            flash.success = "Branch Information has been Saved/Updated Successfully...!"
            redirect(action: "create", params: [at: "up", ui: params.id])
        }
        else{
            flash.success = "Branch Information has been Updated/Removed Successfully...!"
            redirect(action: "create", params: [at: "bi", ui: params.id])
        }
    }

    def profile(AuthUser authUserInstance) {
        if (authUserInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "Error-U-AuthUser-L61 : No Record found...!")
            render view: 'profile', model: [authUserInstance: authUserInstance]
            return
        }
        if (!authUserInstance.equals(currentUser)  && !currentUserRoles.contains("DEVELOPER")) {
            flash.warning = "Sorry, you should not try to view another user's profile...!"
            redirect(controller: 'login', action: 'denied')
            return
        }

        AuthUserProfile                 authUserProfileInstance
        AuthUserProperty                authUserPropertyInstance
        List<AuthMenu>                  authMenuList = authMenuService.getPermittedHierarchicalMenuList()
        List<AuthUserFavouriteMenuItem> authUserFavouriteMenuItemList = new ArrayList<AuthUserFavouriteMenuItem>()
        if (request.method == 'POST') {
            if (params.newPassword || params.confirmPassword) {
                if (params.newPassword != params.confirmPassword) {
                    flash.warning = "New Password and Confirm Password are not matched!"
                    render view: 'profile', model: [authUserInstance: authUserInstance]
                    return
                } else {
                    authUserInstance.password = params.newPassword
                    authUserInstance.hdCode   = trackerService.getHdCode(params.newPassword, authUserInstance.id)
                }
            }
            if(params["authUserProfile"]){
                Map authUserProfileParams = params["authUserProfile"]
                if(authUserProfileParams?.id){
                    authUserProfileInstance                  = AuthUserProfile.get(authUserProfileParams?.id)
                    authUserProfileInstance.logModifiedBy    = currentUser
                    authUserProfileInstance.logModifiedDate  = currentDate
                }
                else{
                    authUserProfileParams.authUser       = authUserInstance
                    authUserProfileParams.logCreatedBy   = currentUser
                    authUserProfileParams.logCreatedDate = currentDate
                    authUserProfileInstance              = new AuthUserProfile(authUserProfileParams)
                }

                authUserProfileInstance.properties       = authUserProfileParams
                authUserProfileInstance.authUserProperty = AuthUserProperty.findByAuthUserProfile(authUserProfileInstance) ?: new AuthUserProperty()

                bindData(authUserProfileInstance, ["dateOfBirth"])
                if(authUserProfileParams?.dateOfBirth){
                    authUserProfileInstance.dateOfBirth = dateParseFormat.parse(authUserProfileParams.dateOfBirth)
                }

                authUserProfileInstance.validate(true)
                authUserProfileInstance  = authUserProfileInstance.save(flush: true, failOnError: true, errors: true)
                authUserPropertyInstance = authUserProfileInstance?.authUserProperty
            }
            if(params["authUserProperty"]){
                Map authUserPropertyParams          = params.authUserProperty

                authUserPropertyInstance            = AuthUserProperty.get(authUserPropertyParams.id)
                authUserPropertyInstance.properties = authUserPropertyParams

                authUserPropertyInstance.validate(true)
                authUserPropertyInstance = authUserPropertyInstance.save(flush: true, failOnError: true, errors: true)
                authUserProfileInstance  = authUserPropertyInstance?.authUserProfile
            }
            if(params["authUserFavouriteMenuItem[0]"]){
                authUserProfileInstance  = AuthUserProfile.get(params["authUserFavouriteMenuItem[0].authUserProfile"])
                if(!authUserProfileInstance){
                    flash.warning = "Please update your profile first!"
                    render view: 'profile', model: [authUserInstance: authUserInstance]
                    return
                }
                int i = 0
                while (params["authUserFavouriteMenuItem[" + i + "]"]) {
                    AuthUserFavouriteMenuItem authUserFavouriteMenuItem
                    Map authUserFavouriteMenuItemParams             = params["authUserFavouriteMenuItem[" + i + "]"]
                    authUserFavouriteMenuItemParams.authUserProfile = authUserProfileInstance
                    authUserFavouriteMenuItemParams.sortOrder       = (i + 1)

                    if (authUserFavouriteMenuItemParams?.id) {
                        authUserFavouriteMenuItem            = AuthUserFavouriteMenuItem.get(authUserFavouriteMenuItemParams?.id)
                        authUserFavouriteMenuItem.properties = authUserFavouriteMenuItemParams
                    }
                    else{
                        authUserFavouriteMenuItem            = new AuthUserFavouriteMenuItem(authUserFavouriteMenuItemParams)
                    }
                    authUserFavouriteMenuItem.validate()
                    if (authUserFavouriteMenuItem.hasErrors()) {
                        flash.exception = "ER-UpdateProfile: " + authUserFavouriteMenuItem.errors
                        render view: 'profile', model: [authUserInstance: authUserInstance, authUserProfileInstance: authUserProfileInstance, authUserPropertyInstance: authUserPropertyInstance, authMenuList: authMenuList, authUserFavouriteMenuItemList: authUserProfileInstance?.authUserFavouriteMenuItem]
                        return
                    }
                    try {
                        authUserFavouriteMenuItemList.add(authUserFavouriteMenuItem.save(flush: true, failOnError: true, errors: true))
                    } catch (Exception e) {
                        flash.exception = "ER-UpdateProfile: " + authUserFavouriteMenuItem.errors
                        render view: 'profile', model: [authUserInstance: authUserInstance, authUserProfileInstance: authUserProfileInstance, authUserPropertyInstance: authUserPropertyInstance, authMenuList: authMenuList, authUserFavouriteMenuItemList: authUserProfileInstance?.authUserFavouriteMenuItem]
                        return
                    }
                    i++
                }
            }

            authUserInstance.logModifiedBy   = currentUser?.id
            authUserInstance.logModifiedDate = currentDate
            authUserInstance.validate()
            if (authUserInstance.hasErrors()) {
                flash.error = "Error-Update-Profile-L188 : " + authUserInstance.errors
                render view: 'profile', model: [authUserInstance: authUserInstance, authUserProfileInstance: authUserProfileInstance, authUserPropertyInstance: authUserPropertyInstance, authMenuList: authMenuList, authUserFavouriteMenuItemList: authUserProfileInstance?.authUserFavouriteMenuItem]
                return
            }

            try {
                if (authUserInstance.save(flush: true)) {
                    flash.success = "Your profile has been updated successfully...!"
                    render view: 'profile', model: [authUserInstance: authUserInstance, authUserProfileInstance: authUserProfileInstance, authUserPropertyInstance: authUserPropertyInstance, authMenuList: authMenuList, authUserFavouriteMenuItemList: authUserProfileInstance?.authUserFavouriteMenuItem]
                }
            }
            catch (Exception e) {
                flash.error = "Error-Update-Profile-L196 : " + e
                render view: 'profile', model: [authUserInstance: authUserInstance, authUserProfileInstance: authUserProfileInstance, authUserPropertyInstance: authUserPropertyInstance, authMenuList: authMenuList, authUserFavouriteMenuItemList: authUserProfileInstance?.authUserFavouriteMenuItem]
            }
        }
        else {
            authUserProfileInstance       = AuthUserProfile.findByAuthUser(authUserInstance)                ?: new AuthUserProfile()
            authUserPropertyInstance      = AuthUserProperty.findByAuthUserProfile(authUserProfileInstance) ?: new AuthUserProperty()
            authUserFavouriteMenuItemList = authUserProfileInstance?.authUserFavouriteMenuItem?.toList()
        }
        [authUserInstance: authUserInstance, authUserProfileInstance: authUserProfileInstance, authUserPropertyInstance: authUserPropertyInstance, authMenuList: authMenuList, authUserFavouriteMenuItemList: authUserFavouriteMenuItemList]
    }
}
