/**
 * @Created_By : AALAA
 * @Date       : 2021.03.21 10:31:11 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.rpt

import org.aalaa.auth.AuthUser

class RptReportSample {
    AuthUser           logCreatedBy,
                       logModifiedBy
    RptReport          rptReport
    JasperExportFormat exportFormat

    String             title,
                       titleNative,
                       filePath,
                       remarks,
                       query
    Integer            fileVersion     = 0
    Date               logCreatedDate  = new Date(),
                       logModifiedDate

    static mapping = {
        version true
        table 'A_RPT_REPORT_SAMPLE'
        //id generator: 'sequence', params: [sequence: 'S_A_RPT_REPORT_SAMPLE']
        sort        id: "asc" // or "desc"
    }

    static constraints = {
        rptReport       nullable: false
        exportFormat    nullable: false
        title           nullable: false
        filePath        nullable: false
        fileVersion     nullable: false
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false

        titleNative     nullable: true, size: 1..255
        remarks         nullable: true, size: 1..500
        query           nullable: true, size: 1..2000
        logModifiedBy   nullable: true, display: false
        logModifiedDate nullable: true, display: false
    }

    @Override
    String toString() {
        return title
    }
}
