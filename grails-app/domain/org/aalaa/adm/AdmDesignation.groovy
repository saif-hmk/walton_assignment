/**
 * @Created_By : AALAA
 * @Date       : 2022.05.30 01:41:46 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.adm

import org.aalaa.com.ComLookup

class AdmDesignation extends ComLookup {
    AdmVendorOrganization admVendorOrganization
    AdmDepartment         admDepartment

    static mapping = {
        sort admVendorOrganization: 'asc'
        sort admDepartment  : 'asc'
        sort sortOrder      : 'asc'
    }

    static constraints = {
        admDepartment   nullable: false
        admVendorOrganization nullable: false, display: false
        title           nullable: false, unique: ['admVendorOrganization', 'admDepartment']
        keyword         nullable: false, unique: ['admVendorOrganization', 'admDepartment']

        parent          display:false
    }
}
