package org.aalaa.rpt

class RptReportChild {
    RptReport rptReport
    String    fileName,
              query,
              shortDescription,
              remarks

    static mapping = {
        version true
        table 'A_RPT_REPORT_CHILD'
        //id generator: 'sequence', params: [sequence: 'S_A_RPT_REPORT_CHILD']
        sort        fileName: "asc" // or "desc"
    }

    static constraints = {
        rptReport         nullable: false
        fileName          nullable: false

        remarks           nullable: true, size: 1..255
        shortDescription  nullable: true, size: 1..1000
        query             nullable: true, size: 1..4000
    }

    @Override
    String toString() {
        return fileName
    }
}
