/**
 * @Created_By : AALAA
 * @Date       : 2020.05.09 12:25:10 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

import org.aalaa.auth.AuthUserProfile

class SysLogPwdResReq {
    AuthUserProfile authUserProfile

    String          code,
                    email
    Date            dob,
                    logCreatedDate = new Date()

    static mapping = {
        version         false
        table           'A_SYS_LOG_PWD_RES_REQ'
        //id generator: 'sequence', params: [sequence: 'S_A_SYS_LOG_PWD_RES_REQ']
    }

    static constraints = {
        email           nullable: false
        dob             nullable: false
        logCreatedDate  nullable: false

        code            nullable: true, size: 8..8
        authUserProfile nullable: true
    }

    @Override
    String toString() {
        return email
    }
}
