package org.aalaa.prl

import org.aalaa.auth.AuthUser

class PrlPeriod {
    AuthUser logCreatedBy,
             logModifiedBy

    String   title,
             titleNative,
             keyword    //yyyy-mm
    Boolean  isActive       = true,
             isClosed       = false
    Date     dateOfStart,
             dateOfEnd,
             logCreatedDate = new Date(),
             logModifiedDate

    static mapping = {
        table  'A_PRL_PERIOD'
    }

    static constraints = {
        logCreatedBy             nullable: false, display: false
        logCreatedDate           nullable: false, display: false
        title                    nullable: false, unique : true
        titleNative              nullable: false, unique : true
        keyword                  nullable: false, matches: "[0-9-]+", unique : true
        isActive                 nullable: false
        isClosed                 nullable: false
        dateOfStart              nullable: false
        dateOfEnd                nullable: false

        logModifiedBy            nullable: true, display: false
        logModifiedDate          nullable: true, display: false
    }

    @Override
    String toString() {
        return title
    }
}
