/**
 * @Created_By : AALAA
 * @Date       : 2022.05.05 01:09:31 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm.email

import org.aalaa.nm.com.NmContent
import org.aalaa.pb.PbEmail

class NmEmailContent extends NmContent {
    PbEmail from

    String  type = "EMAIL"

    static hasMany = [to: NmEmailContentLkPbEmail, cc: NmEmailContentLkPbEmail, bcc: NmEmailContentLkPbEmail]

    static constraints = {
        from nullable: false
        to   nullable: false

        cc   nullable: true
        bcc  nullable: true
    }
}
