package org.aalaa.auth

import org.aalaa.com.*

class AuthUserProfile implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser      authUser,
                  logCreatedBy,
                  logModifiedBy
    Gender        gender        = Gender.MALE
    MaritalStatus maritalStatus = MaritalStatus.SINGLE
    Honorific     honorific     = Honorific.MR
    Religion      religion      = Religion.ISLAM
    BloodGroup    bloodGroup

    String        nationalId,
                  signature,
                  image,
                  fathersName,
                  mothersName
    Date          dateOfBirth,
                  logCreatedDate  = new Date(),
                  logModifiedDate

    static hasOne  = [authUserProperty: AuthUserProperty]

    static hasMany = [authUserFavouriteMenuItem: AuthUserFavouriteMenuItem]

    static mapping = {
        version      false
        table        'A_AUTH_USER_PROFILE'
        //id generator: 'sequence', params: [sequence: 'S_A_AUTH_USER_PROFILE']
        //authUserFavouriteMenuItem cascade: 'all'
    }

    static constraints = {
        authUserProperty          nullable: true
        authUserFavouriteMenuItem nullable: true

        gender                    nullable: false
        maritalStatus             nullable: false
        honorific                 nullable: false
        religion                  nullable: false
        authUser                  nullable: false, unique : true
        logCreatedBy              nullable: false, display: false
        logCreatedDate            nullable: false, display: false

        fathersName               nullable: true
        mothersName               nullable: true
        dateOfBirth               nullable: true
        nationalId                nullable: true
        bloodGroup                nullable: true
        signature                 nullable: true, size   : 0..255
        image                     nullable: true, size   : 0..255
        logModifiedBy             nullable: true, display: false
        logModifiedDate           nullable: true, display: false
    }
}
