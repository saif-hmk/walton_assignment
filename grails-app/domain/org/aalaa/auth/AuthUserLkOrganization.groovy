package org.aalaa.auth

import grails.gorm.DetachedCriteria
import org.aalaa.adm.AdmOrganization
import org.apache.commons.lang.builder.HashCodeBuilder

class AuthUserLkOrganization {
    AuthUser        authUser
    AdmOrganization admVendorOrganization

    static mapping = {
        version false
        table 'A_AUTH_USER_LK_ORGANIZATION'
    }

    static constraints = {
        admVendorOrganization validator: { AdmOrganization r, AuthUserLkOrganization ur ->
            if (ur.authUser == null || ur.authUser.id == null) return
            boolean existing = false
            AuthUserLkOrganization.withNewSession {
                existing = AuthUserLkOrganization.exists(ur.authUser.id, r.id)
            }
            if (existing) {
                return 'userGroup.exists'
            }
        }
    }

    @Override
    boolean equals(other) {
        if (!(other instanceof AuthUserLkOrganization)) {
            return false
        }

        other.authUser?.id == authUser?.id && other.admVendorOrganization?.id == admVendorOrganization?.id
    }

    @Override
    int hashCode() {
        def builder = new HashCodeBuilder()
        if (authUser) builder.append(authUser.id)
        if (admVendorOrganization) builder.append(admVendorOrganization.id)
        builder.toHashCode()
    }

    AuthUserLkOrganization() {}

    AuthUserLkOrganization(AuthUser u, AdmOrganization r) {
        authUser        = u
        admVendorOrganization = r
    }

    static AuthUserLkOrganization get(long userId, long companyId) {
        criteriaFor(userId, companyId).get()
    }

    static boolean exists(long userId, long companyId) {
        criteriaFor(userId, companyId).count()
    }

    private static DetachedCriteria criteriaFor(long userId, long companyId) {
        AuthUserLkOrganization.where { authUser == AuthUser.load(userId) && admVendorOrganization == AdmOrganization.load(companyId) }
    }

    static AuthUserLkOrganization create(AuthUser user, AdmOrganization company, boolean flush = false) {
        def instance = new AuthUserLkOrganization(user, company)
        instance.save(flush: flush, insert: true)
        instance
    }

    static boolean remove(AuthUser u, AdmOrganization r, boolean flush = false) {
        if (u == null || r == null) return false

        int rowCount = AuthUserLkOrganization.where { authUser == u && admVendorOrganization == r }.deleteAll()

        if (flush) {
            AuthUserLkOrganization.withSession { it.flush() }
        }

        rowCount
    }

    static void removeAll(AuthUser u, boolean flush = false) {
        if (u == null) return

        AuthUserLkOrganization.where { authUser == u }.deleteAll()

        if (flush) {
            AuthUserLkOrganization.withSession { it.flush() }
        }
    }

    static void removeAll(AdmOrganization r, boolean flush = false) {
        if (r == null) return

        AuthUserLkOrganization.where { admVendorOrganization == r }.deleteAll()

        if (flush) {
            AuthUserLkOrganization.withSession { it.flush() }
        }
    }
}
