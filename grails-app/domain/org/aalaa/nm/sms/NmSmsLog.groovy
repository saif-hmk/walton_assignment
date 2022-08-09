/**
 * @Created_By : AALAA
 * @Date : 2022.05.05 01:09:31 AM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.nm.sms

import org.aalaa.nm.com.NmLog

class NmSmsLog extends NmLog {
    String  typeNm = "SMS",
            mobileNo,
            messageStatus,
            apiResponse,
            apiStatusGroupName,
            apiStatusKeyword,
            apiStatusDescription,
            apiMessageId
    Integer apiMessageCount,
            apiStatusId,
            apiStatusGroupId

    static constraints = {
        mobileNo             nullable: false

        messageStatus        nullable: true
        apiResponse          nullable: true
        apiStatusGroupName   nullable: true
        apiStatusKeyword     nullable: true
        apiStatusDescription nullable: true
        apiMessageId         nullable: true
        apiMessageCount      nullable: true
        apiStatusId          nullable: true
        apiStatusGroupId     nullable: true
    }
}
