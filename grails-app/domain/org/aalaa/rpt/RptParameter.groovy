/**
 * @Created_By : AALAA
 * @Date       : 2018.07.28 02:31:11 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.rpt

import org.aalaa.auth.AuthUser

/**
 * Can be add a type to distinguish the group, entity or global levels
 * Do not use: type of business, componentGroup or organization
 **/
class RptParameter {

    AuthUser     logCreatedBy,
                 logModifiedBy
    RptParameter parent         //for list or set

    String       keyword,
                 title,
                 titleNative
    Integer      sortOrder
    Boolean      isActive        = 1    //will be used only at create time of a report (param)
    Date         logCreatedDate  = new Date(),
                 logModifiedDate

    static hasMany = [
            rptParameter: RptParameter
    ]

    static mapping = {
        version true
        table 'A_RPT_PARAMETER'
        //id generator: 'sequence', params: [sequence: 'S_A_RPT_PARAMETER']
        sort        id: "asc" // or "desc"
    }

    static constraints = {
        isActive        nullable: false
        keyword         nullable: false, size: 1..30, unique: true
        title           nullable: false, size: 1..50
        titleNative     nullable: false, size: 1..100
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false

        parent          nullable: true
        rptParameter    nullable: true
        sortOrder       nullable: true

        logModifiedBy   nullable: true, display: false
        logModifiedDate nullable: true, display: false
    }

    @Override
    String toString() {
        return title
    }
}
