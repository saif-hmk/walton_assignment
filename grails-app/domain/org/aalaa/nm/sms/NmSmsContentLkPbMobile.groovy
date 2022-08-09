/**
 * @Created_By : AALAA
 * @Date       : 2022.05.05 01:09:31 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm.sms

import org.aalaa.pb.PbMobile

class NmSmsContentLkPbMobile {
    NmSmsContent content
    PbMobile     mobile

    static mapping = {
        table  'a_nm_sms_content_lk_pb_mobile'
    }

    static constraints = {
        content nullable: false
        mobile  nullable: false
    }

    @Override
    String toString() {
        return mobile.contactNo
    }
}
