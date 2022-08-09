package org.aalaa.auth

import grails.gorm.DetachedCriteria
import groovy.transform.ToString
import org.apache.commons.lang.builder.HashCodeBuilder

@ToString(cache = true, includeNames = true, includePackage = false)
class AuthUserLkRole implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser authUser
    AuthRole authRole

    String   userName,
             roleName

    static mapping = {
        cache   true
        version  true
        table "A_AUTH_USER_LK_ROLE"
        //id generator: 'sequence', params: [sequence: 'S_A_AUTH_USER_LK_ROLE']
        sort id: 'desc'
        //id composite: ['authUser', 'authRole']
    }

    static constraints = {
        authUser nullable: false, unique: "authRole"
        /*
        authRole nullable: false, validator: { AuthRole r, AuthUserLkRole ur ->
            if (!ur.authUser || !ur.authUser) return
            boolean existing = false
            AuthUserLkRole.withNewSession {
                existing = AuthUserLkRole.exists(ur.authUser.id, r.id)
            }
            if (existing) {
                return 'userRole.exists'
            }
        }
        */
        authRole nullable: false, unique: "authUser"
        userName nullable: true , display: false
        roleName nullable: true , display: false
    }

    AuthUserLkRole() {
    }

    AuthUserLkRole(AuthUser u, AuthRole r) {
        this()
        authUser = u
        authRole = r
    }

    def beforeInsert() {
        initializeNames()
    }

    def beforeUpdate() {
        initializeNames()
    }

    protected void initializeNames() {
        userName = this.authUser.username
        roleName = this.authRole.authority
    }

    @Override
    boolean equals(other) {
        if (!(other instanceof AuthUserLkRole)) {
            return false
        }
        other.authUser?.id == authUser?.id && other.authRole?.id == authRole?.id
    }

    @Override
    int hashCode() {
        def builder = new HashCodeBuilder()
        if (authUser) builder.append(authUser.id)
        if (authRole) builder.append(authRole.id)
        builder.toHashCode()
    }

    static AuthUserLkRole get(long authUserId, long authRoleId) {
        criteriaFor(authUserId, authRoleId).get()
    }

    static boolean exists(long authUserId, long authRoleId) {
        criteriaFor(authUserId, authRoleId).count()
    }

    private static DetachedCriteria criteriaFor(long authUserId, long authRoleId) {
        AuthUserLkRole.where {
            authUser == AuthUser.load(authUserId) && authRole == AuthRole.load(authRoleId)
        }
    }

    static AuthUserLkRole create(AuthUser authUser, AuthRole authRole, boolean flush = false) {
        def instance = new AuthUserLkRole(authUser: authUser, authRole: authRole)
        instance.save(flush: flush, insert: true)
        instance
    }

    static boolean remove(AuthUser u, AuthRole r, boolean flush = false) {
        if (u == null || r == null) return false

        int rowCount = AuthUserLkRole.where { authUser == u && authRole == r }.deleteAll()

        if (flush) {
            AuthUserLkRole.withSession { it.flush() }
        }

        rowCount
    }

    static void removeAll(AuthUser u, boolean flush = false) {
        if (u == null) return

        AuthUserLkRole.where { authUser == u }.deleteAll()

        if (flush) {
            AuthUserLkRole.withSession { it.flush() }
        }
    }

    static void removeAll(AuthRole r, boolean flush = false) {
        if (r == null) return

        AuthUserLkRole.where { authRole == r }.deleteAll()

        if (flush) {
            AuthUserLkRole.withSession { it.flush() }
        }
    }
}
