/**
 * @Created_By : AALAA
 * @Date       : 2022.05.05 01:09:31 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm.message

import org.aalaa.nm.com.NmTemplate

class NmMessageTemplate extends NmTemplate {
    String  typeOfTemplate = "MESSAGE",
            icon,
            cssClass,
            redirectTo     = "/#"

    static hasMany = [nmMessageTemplatePermission: NmMessageTemplatePermission, nmMessageTemplateSchedule: NmMessageTemplateSchedule]

    static constraints = {
        nmMessageTemplatePermission nullable: false
        nmMessageTemplateSchedule   nullable: false

        icon                        nullable: false
        redirectTo                  nullable: false

        cssClass                    nullable: true
    }
}
