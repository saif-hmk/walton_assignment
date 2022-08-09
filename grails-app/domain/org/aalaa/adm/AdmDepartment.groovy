/**
 * @Created_By : AALAA
 * @Date       : 2022.05.30 01:39:41 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.adm

import org.aalaa.com.ComLookup

class AdmDepartment extends ComLookup{
    AdmVendorOrganization admVendorOrganization

    static constraints = {
        admVendorOrganization nullable: false, display: false
        parent          display:false
        title           unique: ['admVendorOrganization']
        keyword         unique: ['admVendorOrganization']
    }
}
