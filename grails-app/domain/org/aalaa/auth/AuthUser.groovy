package org.aalaa.auth

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes = 'username')
@ToString(includes = 'username', includeNames = true, includePackage = false)
class AuthUser implements Serializable {

    private static final long serialVersionUID = 1

    transient springSecurityService

    String  username,
            password,
            hdCode,
            fullName,
            displayName,
            phone,
            email,
            remarks
    Boolean enabled          = true,
            accountExpired   = false,
            accountLocked    = false,
            passwordExpired  = false,
            resetAtNextLogin = false
    Long    logCreatedBy,
            logModifiedBy
    Date    lastPwResetDate,
            logCreatedDate  = new Date(),
            logModifiedDate

    static hasOne = [authUserProfile: AuthUserProfile, authUserLkEmployee: AuthUserLkEmployee]

    static mapping = {
        version     true
        table           'A_AUTH_USER'
        username        column: 'USER_NAME'
        password        column: '`PASSWORD`'
        enabled         column: 'IS_ENABLED'
        accountExpired  column: 'IS_ACCOUNT_EXPIRED'
        accountLocked   column: 'IS_ACCOUNT_LOCKED'
        passwordExpired column: 'IS_PASSWORD_EXPIRED'
        logCreatedBy    column: 'LOG_CREATED_BY_ID'
        logCreatedDate  column: 'LOG_CREATED_DATE'
        logModifiedBy   column: 'LOG_MODIFIED_BY_ID'
        logModifiedDate column: 'LOG_MODIFIED_DATE'

        sort            id: 'asc'
        //id generator: 'sequence', params: [sequence: 'S_A_AUTH_USER']
    }

    static constraints = {
        authUserProfile    nullable: true
        authUserLkEmployee nullable: true

        username           nullable: false, blank: false, size: 3..25 , matches: "[a-z0-9._]+", unique : true
        displayName        nullable: false, blank: false, size: 3..25 , matches: "[a-zA-Z0-9-.\\s]+"
        fullName           nullable: false, blank: false, size: 3..35 , matches: "[a-zA-Z-.\\s]+"
        hdCode             nullable: false, blank: true , size: 3..256, display: false
        enabled            nullable: false
        accountExpired     nullable: false
        accountLocked      nullable: false
        passwordExpired    nullable: false
        resetAtNextLogin   nullable: false
        logCreatedDate     nullable: false, display: false
        logCreatedBy       nullable: false, display: false
        password           nullable: false, blank  : true , size: 3..128

        lastPwResetDate    nullable: true
        email              nullable: true, blank  : false, email: true, maxSize: 255
        phone              nullable: true, blank  : false, minSize: 14, maxSize: 14,  matches: "([+]{1})+8801+([3-9]{1})+([0-9]{8,8})"
        remarks            nullable: true, blank  : false, size : 0..255
        logModifiedDate    nullable: true, display: false
        logModifiedBy      nullable: true, display: false
    }

    @Override
    String toString() {
        return displayName
    }

    static transients = ['springSecurityService']

    AuthUser() {
    }

    AuthUser(String username, String password) {
        this()
        this.username = username
        this.password = password
    }

    Set<AuthRole> getAuthorities() {
        AuthUserLkRole.findAllByAuthUser(this)*.authRole
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }
}
