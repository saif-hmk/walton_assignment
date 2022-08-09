package org.aalaa.pb

import org.aalaa.auth.AuthUser
import org.aalaa.com.*

class PbContact {

    AuthUser      logCreatedBy,
                  logModifiedBy
    Gender        gender        = Gender.MALE
    Religion      religion      = Religion.ISLAM
    Honorific     honorific     = Honorific.MR
    BloodGroup    bloodGroup
    MaritalStatus maritalStatus

    String        nameFirst,
                  nameMiddle,
                  nameLastSur,
                  nameFirstNative,
                  nameMiddleNative,
                  nameLastSurNative,
                  nameFather,
                  nameFatherNative,
                  nameMother,
                  nameMotherNative,
                  address,
                  addressNative,
                  googleLocation,
                  image
    Boolean       active              = true
    Date          dateOfBirth,
                  dateOfAnniversary,
                  logCreatedDate      = new Date(),
                  logModifiedDate

    static hasMany = [pbPhone: PbPhone, pbMobile: PbMobile, pbEmail: PbEmail, pbLabel: PbLabel]

    static mapping = {
        table  'a_pb_contact'
        //image   sqlType: "clob"
        //image   sqlType: "mediumText"
        active  column: "is_active"
    }

    static constraints = {
        pbPhone           nullable: true
        pbMobile          nullable: true
        pbEmail           nullable: true
        pbLabel           nullable: true

        gender            nullable: false
        religion          nullable: false
        honorific         nullable: false
        nameFirst         nullable: false
        nameFirstNative   nullable: false
        address           nullable: false
        addressNative     nullable: false
        active            nullable: false
        logCreatedBy      nullable: false, display: false
        logCreatedDate    nullable: false, display: false

        bloodGroup        nullable: true
        maritalStatus     nullable: true
        nameMiddle        nullable: true
        nameLastSur       nullable: true
        nameMiddleNative  nullable: true
        nameLastSurNative nullable: true
        nameFather        nullable: true
        nameFatherNative  nullable: true
        nameMother        nullable: true
        nameMotherNative  nullable: true
        googleLocation    nullable: true
        image             nullable: true
        dateOfBirth       nullable: true
        dateOfAnniversary nullable: true
        logModifiedBy     nullable: true, display: false
        logModifiedDate   nullable: true, display: false
    }

    @Override
    String toString() {
        return (nameFirst + (nameMiddle ? " " + nameMiddle : "") + (nameLastSur ? " " + nameLastSur : ""))
    }
}
