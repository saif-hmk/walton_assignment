package org.aalaa.auth

import org.aalaa.loc.LocAdmAreaType

class AuthUserLkLoc {

    AuthUser       authUser
    LocAdmAreaType locAdmAreaType

    String         userName
    Long           locationId
    Boolean        isActive = true

    static mapping = {
        version false
        table 'A_AUTH_USER_LK_LOC'
    }

    static constraints = {
        isActive       nullable: false
        authUser       nullable: false, blank: false

        userName       nullable: true
        locAdmAreaType nullable: true, blank: false
        locationId     nullable: true, blank: true
    }
}
