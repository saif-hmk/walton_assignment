/**
 * @Created_By : AALAA
 * @Date       : 2022.05.01 12:02:32 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

import org.aalaa.auth.AuthUser

abstract class ComLookup implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser        logCreatedBy,
                    logModifiedBy
    ComLookup       parent

    String          keyword,
                    title,
                    titleNative,
                    titleShort,
                    titleShortNative,
                    sortOrder      = "1",
                    remarks
    Boolean         active         = true
    Date            logCreatedDate = new Date(),
                    logModifiedDate

    static hasMany = [children: ComLookup]

    static mapping = {
        version true
        table 'A_COM_LOOKUP'

        sort sortOrder: 'asc'
        //id generator: 'sequence', params: [sequence: 'S_A_COM_LOOKUP']
    }

    static constraints = {
        parent           nullable: true
        children         nullable: true, display: false

        active          nullable: false
        //admVendorOrganization nullable: false
        title           nullable: false, size: 1..60//, unique: ['admVendorOrganization', 'parent']
        keyword         nullable: false, size: 0..60, matches: "[A-Z0-9_]+"//, unique: ['admVendorOrganization', 'parent']
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false

        sortOrder        nullable: true, size: 1..10
        titleNative      nullable: true, size: 1..120
        titleShort       nullable: true, size: 1..50
        titleShortNative nullable: true, size: 1..100
        remarks          nullable: true, size: 0..255
        children         nullable: true, display: false
        logModifiedBy    nullable: true, display: false
        logModifiedDate  nullable: true, display: false
    }

    ComLookup(){}

    @Override
    String toString() {
        return title
    }
}
