package org.aalaa.rpt

class RptReportLkFormat {
    RptReport    rptReport
    ReportFormat reportFormat

    static mapping = {
        version true
        table 'A_RPT_REPORT_LK_FORMAT'
        //id generator: 'sequence', params: [sequence: 'S_A_RPT_REPORT_LK_FORMAT']
        sort        reportFormat: "asc" // or "desc"
    }

    static constraints = {
        rptReport    nullable: false
        reportFormat nullable: false
    }

    @Override
    String toString() {
        return reportFormat
    }
}
