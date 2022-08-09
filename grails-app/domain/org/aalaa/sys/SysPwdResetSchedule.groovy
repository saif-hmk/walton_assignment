/**
 * @Created_By : AALAA
 * @Date       : 2020.05.27 11:24:10 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

import org.aalaa.auth.AuthUser

class SysPwdResetSchedule {
    AuthUser logCreatedBy,
             logModifiedBy

    Date     resetAfter       = new Date(),
             lockAccountAfter = new Date(),
             logCreatedDate   = new Date(),
             logModifiedDate  = new Date()

    static mapping = {
        version false
        table   'A_SYS_PWD_RESET_SCHEDULE'
        //id generator: 'sequence', params: [sequence: 'S_A_SYS_PWD_RESET_SCHEDULE']
        sort     resetAfter: "desc"
    }

    static constraints = {
        resetAfter       nullable: false
        lockAccountAfter nullable: false
        logCreatedBy     nullable: false, display: false
        logCreatedDate   nullable: false, display: false

        logModifiedBy    nullable: true, display: false
        logModifiedDate  nullable: true, display: false
    }

    @Override
    String toString() {
        return resetAfter
    }
}
