package org.aalaa.rpt

import org.aalaa.auth.AuthRole

class RptReportLkRole {
    RptReport   rptReport
    AuthRole    authRole

    static mapping = {
        version true
        table 'A_RPT_REPORT_LK_ROLE'
        //id generator: 'sequence', params: [sequence: 'S_A_RPT_REPORT_LK_ROLE']
        sort        authRole: "asc" // or "desc"
    }

    static constraints = {
        rptReport   nullable: false
        authRole    nullable: false, unique: ["rptReport"]
    }

    @Override
    String toString() {
        return authRole
    }
}
