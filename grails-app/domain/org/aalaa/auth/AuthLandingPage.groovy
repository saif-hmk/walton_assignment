package org.aalaa.auth

class AuthLandingPage implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser authUser,
             logCreatedBy,
             logModifiedBy
    AuthRole authRole

    String   uri            = "/authHome/",
             remarks
    Integer  priority       = 5
    Boolean  active         = true
    Date     logCreatedDate = new Date(),
             logModifiedDate

    static mapping = {
        version true
        table 'A_AUTH_LANDING_PAGE'

        sort id: 'desc'
        //id generator: 'sequence', params: [sequence: 'S_A_AUTH_LANDING_PAGE']
    }

    static constraints = {
        active          nullable: false
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false
        authRole        nullable: false, unique: true
        uri             nullable: false, unique: ["authUser", "authRole"], size: 0..2000
        priority        nullable: false, unique: ["authUser", "authRole"], min: 0, max: 99

        remarks         nullable: true, size: 0..500
        logModifiedBy   nullable: true, display: false
        logModifiedDate nullable: true, display: false
        authUser        nullable: true, unique: ["authRole", "uri"]
    }

    @Override
    String toString() {
        return uri
    }
}
