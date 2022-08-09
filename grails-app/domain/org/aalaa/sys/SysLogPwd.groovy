/**
 * @Created_By : AALAA
 * @Date       : 2020.05.07 11:20:10 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

import org.aalaa.auth.AuthUser

class SysLogPwd {
    AuthUser authUser,
             logCreatedBy

    String   code,
             password
    Date     logCreatedDate = new Date()

    static mapping = {
        version         true
        table           'A_SYS_LOG_PWD'
        password        column: '`PASSWORD`'
        //id generator: 'sequence', params: [sequence: 'S_A_SYS_LOG_PWD']
    }

    static constraints = {
        authUser       nullable: false
        logCreatedBy   nullable: false
        logCreatedDate nullable: false
        password       nullable: false, size: 1..100
        code           nullable: false, size: 1..50// , unique: "authUser"
    }

    @Override
    String toString() {
        return password
    }
}
