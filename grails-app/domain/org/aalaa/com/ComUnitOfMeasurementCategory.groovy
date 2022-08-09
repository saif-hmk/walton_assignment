/**
 * @Created_By : AALAA
 * @Date : 2022.06.20 11:30:07 AM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.com

import org.aalaa.adm.AdmVendorOrganization

class ComUnitOfMeasurementCategory extends ComLookup {
    AdmVendorOrganization admVendorOrganization

    static constraints = {
        admVendorOrganization nullable: false, display: false
        parent                display: false
        title                 unique: ['admVendorOrganization', 'parent']
        keyword               unique: ['admVendorOrganization', 'parent']
    }
}
