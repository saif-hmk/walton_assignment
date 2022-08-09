/**
 * @Created_By : AALAA
 * @Date       : 2022.05.05 01:09:31 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm.message

import org.aalaa.auth.AuthUser
import org.aalaa.nm.com.NmContent

class NmMessageContent extends NmContent{
    AuthUser recipient

    String   type       = "MESSAGE"
    Boolean  seenByUser = false
    Date     seenAt

    static mapping = {
        seenByUser    column: "IS_SEEN_BY_USER"
    }

    static constraints = {
        recipient  nullable: false
        seenByUser nullable: false

        seenAt     nullable: true
    }
}
