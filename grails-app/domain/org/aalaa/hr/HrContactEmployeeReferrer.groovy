/**
 * @Created_By : AALAA
 * @Date       : 2022.05.25 01:38:09 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.hr

import org.aalaa.pb.PbContact

class HrContactEmployeeReferrer extends PbContact {
    HrGeneralEmployee hrEmployee

    static constraints = {
        hrEmployee nullable: false
    }
}
