/**
 * @Created By: AALAA
 * @Date      : 2017.10.24 01:44:45 AM
 * @Author    : Md. Hoshen Mahmud Khan
 * @Email     : saif_hmk@live.com
 * @Phone     : +8801672036757
 **/

package org.aalaa.rpt

import org.aalaa.adm.AdmOrganization
import org.aalaa.auth.AuthUser

class RptReport implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser        logCreatedBy,
                    logModifiedBy
    AdmOrganization admVendorOrganization     //custom report or for specific org.
    ReportFormat    defaultFormat

    String          code,
                    module,
                    subModule,
                    title,
                    titleNative,
                    fileName,
                    optGroup,
                    optGroupNative,
                    query,              //This is a backup query that used at JRXML File
                    messageForUser,     //Reports may required special guideline/instruction/warning (eg: big table used)
                    messageType,        //Bootstrap types (info, success, warning, danger)
                    shortDescription,   //For end user (admin) to display
                    remarks             //For developer
    Integer         sortOrder       = 0
    Boolean         forGlobalWindow = true,
                    complete        = true,
                    active          = true
    Date            logCreatedDate  = new Date(),
                    logModifiedDate

    //todo add a details for permitted entities as like role.
    static hasMany = [
            rptReportLkParam : RptReportLkParam,
            rptReportLkRole  : RptReportLkRole,
            rptReportLkFormat: RptReportLkFormat,
            rptReportLkScript: RptReportLkScript,
            rptReportChild   : RptReportChild,
            rptReportSample  : RptReportSample
    ]

    static mapping = {
        version true
        table 'A_RPT_REPORT'
        //id generator: 'sequence', params: [sequence: 'S_A_RPT_REPORT']
        sort        module   : "asc" // or "desc"
        sort        subModule: "asc" // or "desc"
        sort        sortOrder: "asc" // or "desc"
        sort        title    : "asc" // or "desc"
    }

    static constraints = {
        module            nullable: false
        fileName          nullable: false
        forGlobalWindow   nullable: false
        complete          nullable: false
        active            nullable: false
        defaultFormat     nullable: false
        optGroup          nullable: false, size: 0..50
        sortOrder         nullable: false, min: 0, max: 999
        title             nullable: false, unique: ["admVendorOrganization", "module"]
        logCreatedBy      nullable: false, display: false
        logCreatedDate    nullable: false, display: false

        admVendorOrganization   nullable: true
        rptReportChild    nullable: true
        rptReportLkParam  nullable: true
        rptReportLkRole   nullable: true
        rptReportLkScript nullable: true
        rptReportLkFormat nullable: true
        rptReportSample   nullable: true

        subModule         nullable: true
        messageType       nullable: true, size: 1..15
        messageForUser    nullable: true, size: 1..255
        titleNative       nullable: true, size: 1..255
        optGroupNative    nullable: true, size: 1..255
        remarks           nullable: true, size: 1..255
        shortDescription  nullable: true, size: 1..1000
        query             nullable: true, size: 1..4000
        logModifiedBy     nullable: true, display: false
        logModifiedDate   nullable: true, display: false
    }

    @Override
    String toString() {
        return title
    }
}
