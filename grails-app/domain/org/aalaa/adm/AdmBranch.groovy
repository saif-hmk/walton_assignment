/**
 * @Created_By : AALAA
 * @Date       : 2021.10.26 02:51:52 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.adm

import org.aalaa.auth.AuthUser

class AdmBranch implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser              logCreatedBy,
                          logModifiedBy
    AdmVendorOrganization admVendorOrganization

    String                code,
                          keyword,
                          title,
                          titleNative,
                          titleShort,
                          titleShortNative,
                          contactPersonName,
                          contactPersonPhone,
                          contactPersonEmail
    Integer               sortOrder       = 0,
                          weight          = 0
    Boolean               active          = true
    Date                  logCreatedDate  = new Date(),
                          logModifiedDate

    static mapping = {
        version true
        table 'A_ADM_BRANCH'
        sort admVendorOrganization: "asc"
        sort sortOrder: "asc"
        //id generator: 'sequence', params: [sequence: 'S_A_COM_BRANCH']
    }

    static constraints = {
        active                nullable: false
        admVendorOrganization nullable: false
        code                  nullable: false, size   : 1..30
        weight                nullable: false, min    : 1, max: 999
        sortOrder             nullable: false, min    : 0, max: 999
        title                 nullable: false, size   : 2..50
        keyword               nullable: false, size   : 2..30, unique: ["admVendorOrganization"]
        logCreatedBy          nullable: false, display: false
        logCreatedDate        nullable: false, display: false

        contactPersonName     nullable: true
        contactPersonPhone    nullable: true
        contactPersonEmail    nullable: true, email  : true
        titleNative           nullable: true, size   : 2..100
        titleShort            nullable: true, size   : 2..15
        titleShortNative      nullable: true, size   : 2..30
        logModifiedBy         nullable: true, display: false
        logModifiedDate       nullable: true, display: false
    }

    @Override
    String toString() {
        return title
    }
}
