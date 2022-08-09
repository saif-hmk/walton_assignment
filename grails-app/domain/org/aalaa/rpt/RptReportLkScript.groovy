/**
 * @Created_By : AALAA
 * @Date       : 2021.05.22 02:06:03 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.rpt

import org.aalaa.auth.AuthUser
import org.aalaa.sys.SysScript

class RptReportLkScript {

    AuthUser  logCreatedBy,
              logModifiedBy
    RptReport rptReport
    SysScript sysScript

    String    description
    Integer   sortOrder
    Boolean   active
    Date      logCreatedDate  = new Date(),
              logModifiedDate

    static mapping = {
        version true
        table 'A_RPT_REPORT_LK_SCRIPT'
        //id generator: 'sequence', params: [sequence: 'S_A_RPT_REPORT_LK_SCRIPT']
        sort        id: "asc" // or "desc"
    }

    static constraints = {
        active          nullable: false
        rptReport       nullable: false
        sysScript       nullable: false, unique: ["rptReport"]
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false

        sortOrder       nullable: true
        description     nullable: true
        logModifiedBy   nullable: true, display: false
        logModifiedDate nullable: true, display: false
    }

    @Override
    String toString() {
        return sysScript
    }
}
