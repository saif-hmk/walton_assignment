/**
 * @Created_By : AALAA
 * @Date       : 2022.05.05 01:09:31 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm.message


import org.aalaa.auth.AuthRole
import org.aalaa.auth.AuthUser
import org.aalaa.adm.AdmOrganization
import org.aalaa.adm.AdmDepartment
import org.aalaa.adm.AdmDesignation
/**
 * @Note: Select an item to ensure restriction or left blank to permit all
 *
 **/
class NmMessageTemplatePermission {

    NmMessageTemplate nmNotificationTemplate
    AdmOrganization organization
    AdmDepartment department
    AdmDesignation designation
    AuthRole authRole
    AuthUser authUser

    static mapping = {
        table  'A_NM_MESSAGE_TEMPLATE_PRMSN'
    }

    static constraints = {
        nmNotificationTemplate nullable: false

        organization           nullable: true
        department             nullable: true
        designation            nullable: true
        authRole               nullable: true
        authUser               nullable: true
    }
}
