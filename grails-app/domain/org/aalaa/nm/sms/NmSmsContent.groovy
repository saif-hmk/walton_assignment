/**
 * @Created_By : AALAA
 * @Date       : 2022.05.05 01:09:31 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm.sms

import org.aalaa.nm.com.NmContent

class NmSmsContent extends NmContent {
    String type        = "SMS"

    static hasMany = [recipientNo: NmSmsContentLkPbMobile]

    static constraints = {
        recipientNo nullable: false
    }
}
