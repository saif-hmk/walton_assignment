package org.aalaa.rpt

import org.aalaa.sys.QueryType

class RptReportLkParam {
    RptReport        rptReport
    RptParameter     rptParameter
    DataType         dataType
    QueryType        queryType
    ReceiveValueFrom receiveValueFrom = ReceiveValueFrom.FRONT_END

    String           classResponsive  = "col-xs-12 col-sm-6 col-md-4 col-lg-3",
                     classCss         = "form-control",
                     classLabel       = "",
                     jsId,
                     title,
                     placeholder,
                     query,
                     defaultValue,
                     collectionKey,
                     collectionValue,
                     collectionValueNative,
                     collectionOrderBy,
                     collectionDirection,
                     collectionPojo,          //required for list, set or object type
                     dtAddOrLess,             //for add days/months/years to date
                     min,                     //it could be: number, length or date
                     max                      //it could be: number, length or date
    Integer          sortOrder
    Float            step         = 1.0F

    Boolean          active       = true,
                     required     = false,
                     replaceParam = false

    static mapping = {
        version true
        table 'A_RPT_REPORT_LK_PARAM'
        //id generator: 'sequence', params: [sequence: 'S_A_RPT_REPORT_LK_PARAM']
        sort        rptReport: "asc" // or "desc"
        sort        sortOrder: "asc" // or "desc"
    }

    static constraints = {
        rptReport             nullable: false, display: false
        rptParameter          nullable: false, unique : ["rptReport"]
        dataType              nullable: false
        active                nullable: false
        required              nullable: false
        sortOrder             nullable: false
        replaceParam          nullable: false
        receiveValueFrom      nullable: false

        min                   nullable: true
        max                   nullable: true
        step                  nullable: true
        defaultValue          nullable: true
        queryType             nullable: true
        dtAddOrLess           nullable: true
        collectionPojo        nullable: true
        classResponsive       nullable: true, size: 0..50
        title                 nullable: true, size: 0..100
        placeholder           nullable: true, size: 0..50
        collectionKey         nullable: true, size: 0..30
        collectionValue       nullable: true, size: 0..30
        collectionValueNative nullable: true, size: 0..60
        collectionOrderBy     nullable: true, size: 0..30
        collectionDirection   nullable: true, size: 0..30
        jsId                  nullable: true, size: 0..30
        classCss              nullable: true, size: 0..50
        classLabel            nullable: true, size: 0..50
        query                 nullable: true, size: 0..500
    }

    @Override
    String toString() {
        return rptParameter
    }
}
