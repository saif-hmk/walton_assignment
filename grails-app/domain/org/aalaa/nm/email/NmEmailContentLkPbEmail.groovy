/**
 * @Created_By : AALAA
 * @Date       : 2022.05.05 01:09:31 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm.email

import org.aalaa.pb.PbEmail

class NmEmailContentLkPbEmail{
    NmEmailContent content
    PbEmail        email

    static mapping = {
        table  'a_nm_email_content_lk_pb_email'
    }

    static constraints = {
        content  nullable: false
        email    nullable: false
    }

    @Override
    String toString() {
        return email.contactNo
    }
}
