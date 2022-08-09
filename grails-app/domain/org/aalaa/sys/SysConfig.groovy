package org.aalaa.sys

import org.aalaa.auth.AuthUser

class SysConfig implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser            logCreatedBy,
                        logModifiedBy
    DecimalPlaceDigit   decimalPlaceDigit   = DecimalPlaceDigit.TWO
    DecimalPlacePattern decimalPlacePattern = DecimalPlacePattern.CEIL

    String              remarks
    Boolean             isActive       = true
    Date                logCreatedDate = new Date(),
                        logModifiedDate

    static mapping = {
        version      true
        cache        true
        table       'A_SYS_CONFIG'

        sort id: 'desc'
    }

    static constraints = {
        decimalPlaceDigit   nullable: false
        decimalPlacePattern nullable: false
        logCreatedBy        nullable: false, display: false
        logCreatedDate      nullable: false, display: false

        remarks             nullable: true, size: 0..500
        logModifiedBy       nullable: true, display: false
        logModifiedDate     nullable: true, display: false
    }
}
