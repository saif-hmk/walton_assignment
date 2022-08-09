/**
 * @Created_By : AALAA
 * @Date       : 2019.07.27 01:04:52 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.adm

import org.aalaa.auth.AuthUser

abstract class AdmOrganization {
    AuthUser logCreatedBy,
             logModifiedBy

    String   code,
             title,
             titleNative,
             titleShort,
             titleShortNative,
             chairPersonName,
             contactPersonName,
             contactPersonPhone,
             contactPersonEmail,
             organizationWebsite,
             organizationPhone,
             organizationEmail,
             originCountry,
             slogan,
             address,
             addressNative,
             logoPath,
             remarks
    Integer  sortOrder        = 5,
             weight           = 0
    Boolean  active           = true
    Date     establishmentDate,
             logCreatedDate   = new Date(),
             logModifiedDate

    static mapping = {
        version true
        table   'A_ADM_ORGANIZATION'
        //id generator: 'sequence', params: [sequence: 'S_A_COM_ORGANIZATION']
        sort    sortOrder: "asc" // or "desc"
    }

    static constraints = {
        active              nullable: false
        code                nullable: false, size   : 1..20 , unique: true
        title               nullable: false, size   : 1..100, unique: true
        titleNative         nullable: false, size   : 1..200
        address             nullable: false, size   : 1..255
        addressNative       nullable: false, size   : 1..500
        weight              nullable: false, min: 1, max: 999
        logCreatedBy        nullable: false, display: false
        logCreatedDate      nullable: false, display: false

        titleShort          nullable: true, size   : 1..30
        titleShortNative    nullable: true, size   : 1..60
        contactPersonName   nullable: true
        contactPersonPhone  nullable: true
        logoPath            nullable: true
        slogan              nullable: true
        establishmentDate   nullable: true
        organizationPhone   nullable: true
        originCountry       nullable: true
        organizationWebsite nullable: true, url    : true
        organizationEmail   nullable: true, email  : true
        contactPersonEmail  nullable: true, email  : true
        chairPersonName     nullable: true, size   : 0..35
        remarks             nullable: true, size   : 0..500
        logModifiedBy       nullable: true, display: false
        logModifiedDate     nullable: true, display: false
    }

    @Override
    String toString() {
        return title
    }
}
