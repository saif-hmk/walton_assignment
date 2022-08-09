/**
 * @Created_By : AALAA
 * @Date       : 2022.05.30 01:58:30 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.adm

import org.aalaa.com.ComLookup

class AdmContentCategory extends ComLookup{
    AdmVendorOrganization admVendorOrganization

    static constraints = {
        parent                display: false
        admVendorOrganization nullable: false, display: false
        title                 unique: ['admVendorOrganization', 'parent']
        keyword               unique: ['admVendorOrganization', 'parent']
    }
}
