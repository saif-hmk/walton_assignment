package org.aalaa.auth

import org.aalaa.adm.AdmBranch

class AuthUserLkBranch implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser  authUser
    AdmBranch admBranch

    static mapping = {
        version true
        cache   true
        table 'A_AUTH_USER_LK_BRANCH'
        //id generator: 'sequence', params: [sequence: 'S_A_AUTH_USER_LK_BRANCH']

        sort authUser : 'asc'
        sort admBranch: 'asc'
    }

    static constraints = {
        authUser  nullable: false, unique: ["admBranch"]
        admBranch nullable: false, unique: ["authUser" ]
    }

    @Override
    String toString() {
        return admBranch
    }
}
