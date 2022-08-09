/**
 * @Created_By : AALAA
 * @Date       : 2017.10.24 01:44:45 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
**/

package org.aalaa.rpt

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.aalaa.auth.AuthUser
import org.aalaa.com.IoUtilService
import org.aalaa.sys.TrackerService

import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.OK

@Transactional(readOnly = true)
class RptReportController {
    //static allowedMethods = [save: "POST", update: "PUT"]

    SpringSecurityService springSecurityService
    TrackerService        trackerService
    IoUtilService         ioUtilService
    ReportService         reportService
    AuthUser              currentUser
    Date                  currentDate
    SimpleDateFormat      dateParseFormat,
                          printDateFormat
    String                printDate

    def beforeInterceptor = {
        currentDate     = new Date()
        currentUser     = springSecurityService.getCurrentUser()
        dateParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
        printDateFormat = new SimpleDateFormat(grailsApplication.config.format.printDate)
        printDate       = printDateFormat.format(currentDate).toString()
    }

    def index(Integer max) {
        Integer defMin   = params.min ? Integer.parseInt(params.min) : grailsApplication.config.show.item.min,
                defMax   = params.max ? Integer.parseInt(params.max) : grailsApplication.config.show.item.max
        params.max       = Math.min(max ?: defMin, defMax)
        String orderBy   = params.sort  ?: 'id',
               direction = params.order ?: 'desc'   //asc
        List<RptReport> rptReportInstanceList = RptReport.createCriteria().list(params) {
            if(params.code)
                ilike('code', '%' + params.code + '%')
            if(params.fileName)
                ilike('fileName', '%' + params.fileName + '%')
            if(params.isActive)
                eq('isActive', true)
            if(params.module)
                ilike('componentGroup', '%' + params.module + '%')
            if(params.organization)
                ilike('organization', '%' + params.organization + '%')
            if(params.query)
                ilike('query', '%' + params.query + '%')
            if(params.remarks)
                ilike('remarks', '%' + params.remarks + '%')
            if(params.title)
                ilike('title', '%' + params.title + '%')
            if(params.subModule)
                ilike('subModule', '%' + params.subModule + '%')
            order(orderBy, direction)
        }

        //[rptReportInstanceList: RptReport.list(params)]
        [rptReportInstanceList: rptReportInstanceList, rptReportInstanceTotal: rptReportInstanceList.getTotalCount()]
    }

    def create() {
        [rptReportInstance : new RptReport(params)]
    }

    @Transactional
    save(RptReport rptReportInstance) {
        if (rptReportInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "ER-S1-RptReport : Record not found...!")
            redirect(action: "index")
        }
        
        bindData(rptReportInstance, ['logCreatedBy'])
        rptReportInstance.logCreatedBy = currentUser
        
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      rptReportChild                                                                                                                                      
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        rptReportInstance.rptReportChild = null
        int i = 0
        while (params["rptReportChild[" + i + "]"]) {
            org.aalaa.rpt.RptReportChild rptReportChild
            Map rptReportChildParams = params["rptReportChild[" + i + "]"]
        
            if (rptReportChildParams?.id) {
                rptReportChild = org.aalaa.rpt.RptReportChild.get(rptReportChildParams?.id)
            }else{
                rptReportChild = new org.aalaa.rpt.RptReportChild(rptReportChildParams)
            }
            rptReportChild.validate()
            rptReportInstance.addToRptReportChild(rptReportChild)
            i++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      rptReportLkFormat                                                                                                                                      
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        rptReportInstance.rptReportLkFormat = null
        int j = 0
        while (params["rptReportLkFormat[" + j + "]"]) {
            org.aalaa.rpt.RptReportLkFormat rptReportLkFormat
            Map rptReportLkFormatParams = params["rptReportLkFormat[" + j + "]"]
        
            if (rptReportLkFormatParams?.id) {
                rptReportLkFormat = org.aalaa.rpt.RptReportLkFormat.get(rptReportLkFormatParams?.id)
            }else{
                rptReportLkFormat = new org.aalaa.rpt.RptReportLkFormat(rptReportLkFormatParams)
            }
            rptReportLkFormat.validate()
            rptReportInstance.addToRptReportLkFormat(rptReportLkFormat)
            j++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      rptReportLkParam                                                                                                                                      
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        rptReportInstance.rptReportLkParam = null
        int k = 0
        while (params["rptReportLkParam[" + k + "]"]) {
            org.aalaa.rpt.RptReportLkParam rptReportLkParam
            Map rptReportLkParamParams = params["rptReportLkParam[" + k + "]"]
        
            if (rptReportLkParamParams?.id) {
                rptReportLkParam = org.aalaa.rpt.RptReportLkParam.get(rptReportLkParamParams?.id)
            }else{
                rptReportLkParam = new org.aalaa.rpt.RptReportLkParam(rptReportLkParamParams)
            }
            rptReportLkParam.validate()
            rptReportInstance.addToRptReportLkParam(rptReportLkParam)
            k++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      rptReportLkRole                                                                                                                                      
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        rptReportInstance.rptReportLkRole = null
        int l = 0
        while (params["rptReportLkRole[" + l + "]"]) {
            org.aalaa.rpt.RptReportLkRole rptReportLkRole
            Map rptReportLkRoleParams = params["rptReportLkRole[" + l + "]"]
        
            if (rptReportLkRoleParams?.id) {
                rptReportLkRole = org.aalaa.rpt.RptReportLkRole.get(rptReportLkRoleParams?.id)
            }else{
                rptReportLkRole = new org.aalaa.rpt.RptReportLkRole(rptReportLkRoleParams)
            }
            rptReportLkRole.validate()
            rptReportInstance.addToRptReportLkRole(rptReportLkRole)
            l++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------

        rptReportInstance.validate()
        if (rptReportInstance.hasErrors()) {
            flash.error = "ER-S2-RptReport:"
            trackerService.logError([errorMessage: rptReportInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "create", model: [rptReportInstance: rptReportInstance])
            return
        }
        try {
            rptReportInstance.save(flush: true, failOnError: true)
        }
        catch (Exception e) {
            flash.error = "EX-S1-RptReport : " + e
            render(view: "create", model: [rptReportInstance: rptReportInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.created", args: [message(code: "label.rptReport.pageTitle", default: "RptReport"), rptReportInstance.id])
                redirect rptReportInstance
            }
            '*' { respond rptReportInstance, [status: CREATED] }
        }
    }

    def show(RptReport rptReportInstance) {
        [rptReportInstance : rptReportInstance]
    }

    def edit(RptReport rptReportInstance) {
        [rptReportInstance : rptReportInstance]
    }

    @Transactional
    update(RptReport rptReportInstance) {
        if (rptReportInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "ER-U1-RptReport : Record not found...!")
            redirect(action: "index")
        }
        if (params.version) {
            if (rptReportInstance.version > Long.valueOf(params.version)) {
                flash.warning = message(code: 'default.message.optimisticLock', default: "Sorry, Another user has updated this, while you were editing. Please update now...!")
                render(view: "edit", model: [rptReportInstance: rptReportInstance])
                return
            }
        }
        
        rptReportInstance.logModifiedBy   = currentUser
        rptReportInstance.logModifiedDate = currentDate
        
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      rptReportChild                                                                                                                                      
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        rptReportInstance.rptReportChild = null
        int i = 0
        while (params["rptReportChild[" + i + "]"]) {
            org.aalaa.rpt.RptReportChild rptReportChild
            Map rptReportChildParams = params["rptReportChild[" + i + "]"]
        
            if (rptReportChildParams?.id) {
                rptReportChild = org.aalaa.rpt.RptReportChild.get(rptReportChildParams?.id)
            }else{
                rptReportChild = new org.aalaa.rpt.RptReportChild(rptReportChildParams)
            }
            rptReportChild.validate()
            rptReportInstance.addToRptReportChild(rptReportChild)
            i++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      rptReportLkFormat                                                                                                                                      
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        rptReportInstance.rptReportLkFormat = null
        int j = 0
        while (params["rptReportLkFormat[" + j + "]"]) {
            org.aalaa.rpt.RptReportLkFormat rptReportLkFormat
            Map rptReportLkFormatParams = params["rptReportLkFormat[" + j + "]"]
        
            if (rptReportLkFormatParams?.id) {
                rptReportLkFormat = org.aalaa.rpt.RptReportLkFormat.get(rptReportLkFormatParams?.id)
            }else{
                rptReportLkFormat = new org.aalaa.rpt.RptReportLkFormat(rptReportLkFormatParams)
            }
            rptReportLkFormat.validate()
            rptReportInstance.addToRptReportLkFormat(rptReportLkFormat)
            j++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      rptReportLkParam                                                                                                                                      
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        rptReportInstance.rptReportLkParam = null
        int k = 0
        while (params["rptReportLkParam[" + k + "]"]) {
            org.aalaa.rpt.RptReportLkParam rptReportLkParam
            Map rptReportLkParamParams = params["rptReportLkParam[" + k + "]"]
        
            if (rptReportLkParamParams?.id) {
                rptReportLkParam = org.aalaa.rpt.RptReportLkParam.get(rptReportLkParamParams?.id)
            }else{
                rptReportLkParam = new org.aalaa.rpt.RptReportLkParam(rptReportLkParamParams)
            }
            rptReportLkParam.validate()
            rptReportInstance.addToRptReportLkParam(rptReportLkParam)
            k++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        //      rptReportLkRole                                                                                                                                      
        //------------------------------------------------------------------------------------------------------------------------------------------------------
        rptReportInstance.rptReportLkRole = null
        int l = 0
        while (params["rptReportLkRole[" + l + "]"]) {
            org.aalaa.rpt.RptReportLkRole rptReportLkRole
            Map rptReportLkRoleParams = params["rptReportLkRole[" + l + "]"]
        
            if (rptReportLkRoleParams?.id) {
                rptReportLkRole = org.aalaa.rpt.RptReportLkRole.get(rptReportLkRoleParams?.id)
            }else{
                rptReportLkRole = new org.aalaa.rpt.RptReportLkRole(rptReportLkRoleParams)
            }
            rptReportLkRole.validate()
            rptReportInstance.addToRptReportLkRole(rptReportLkRole)
            l++
        }
        //------------------------------------------------------------------------------------------------------------------------------------------------------

        rptReportInstance.validate()
        if (rptReportInstance.hasErrors()) {
            flash.error = "ER-U2-RptReport:"
            trackerService.logError([errorMessage: rptReportInstance?.errors?.fieldErrors, request: request, params: params, currentUser: currentUser])
            render(view: "edit", model: [rptReportInstance: rptReportInstance])
            return
        }
        try {
            rptReportInstance.save(flush: true, failOnError: true)
        } catch (Exception e) {
            flash.error = "EX-U1-RptReport : " + e
            render(view: "edit", model: [rptReportInstance: rptReportInstance])
            return
        }
        request.withFormat {
            form multipartForm {
                flash.success = message(code: "default.message.recordUpdated", args: [message(code: "label.rptReport.pageTitle", default: "RptReport"), rptReportInstance.id])
                redirect rptReportInstance
            }
            '*'{ respond rptReportInstance, [status: OK] }
        }
    }

    @Transactional
    delete(RptReport rptReportInstance) {
        if (rptReportInstance == null) {
            flash.error = message(code: "default.message.recordNotFound", default: "ER-D1-RptReport : Record not found...!")
            redirect(action: "index")
        }
        try {
            rptReportInstance.delete flush:true
            flash.success = 'Record deleted successfully...!'
            redirect(action: "index")
        }
        catch (Exception e) {
            flash.error = "EX-D1-RptReport : " + e
            redirect(action: "index")
        }
    }

    def download() {
        [reportList: reportService.getReportList([forGlobalWindow: true, complete: true, active: true])]
    }

    def print() {
        RptReport rptReport  = RptReport.get(params.rptReport)
        Map       parameters = new LinkedHashMap(params)

        for (RptReportLkParam p in rptReport?.rptReportLkParam?.findAll {it.active == true && it.receiveValueFrom == ReceiveValueFrom.BACK_END}?.sort{it.sortOrder}){
            String key = p.rptParameter.keyword
            if(key.equals("P_AUTH_USER_ID")){
                parameters.put(key, currentUser.id)
            }
            else if(key.equals("P_COM_ORGANIZATION_ID")){
                parameters.put(key, session.getAttribute("USER_ORGANIZATION")?.id)
            }
        }

        //String    outputFileName = (rptReport?.admVendorOrganization?.code ?: "AALAA") + "_" + (utilityService.formatAsEnumKey(rptReport.title).toLowerCase()) + "_v" + printDate
        //String    outputFileName = (rptReport?.admVendorOrganization?.code ?: "AALAA") + "_r-" + rptReport.id + (rptReport.title.replaceAll("[^a-zA-Z0-9\\u0980-\\u09FF]", " ")?.trim()?.replaceAll("\\s+", "_")?.toLowerCase()) + "_v" + printDate
        //String    outputFileName = reportService.generateReportName(rptReport) + "_v" + printDate
        parameters.put("REPORT_DIRECTORY", ioUtilService.getReportDirectory(rptReport.module, rptReport.subModule))
        parameters.put("SUBREPORT_DIR"   , ioUtilService.getReportDirectory(rptReport.module, rptReport.subModule))
        parameters.put("REPORT_FILE_NAME", rptReport.fileName)
        //parameters.put("OUTPUT_FILE_NAME", outputFileName)
        parameters.put("OUTPUT_FILE_NAME", reportService.generateReportName(rptReport) + "_V" + printDate)
        parameters.put("REPORT_FILE"     , parameters.REPORT_DIRECTORY + parameters.REPORT_FILE_NAME)

        parameters.putAll(reportService.addFormatDependencies(parameters.P_REPORT_FORMAT))

        //todo: move it to reportService not @ioUtil, enhance report service
        if(!ioUtilService.isFileExist(parameters.REPORT_FILE)){
            println "EX-01-RptReport : File('" + parameters.REPORT_FILE_NAME + "') Not found @ path : " + parameters.REPORT_DIRECTORY
            flash.warning = "EX-01-validateReport : Sorry, report not yet configured. Please inform admProject authority...!"
            render(view: "download", model: [params: parameters])
            return
        }
        if(!parameters.extension) {
            flash.exception = "Sorry, You are requesting an invalid report exportFormat...!"
            render(view: "download", model: [params: parameters])
            return
        }

        println(
            "\n-------------------------------------------------------------------------------------------------------------------------------------------------------\n\t" +
            "Report Directory       : " + parameters.REPORT_DIRECTORY + "\n\t" +
            "SubReport Directory    : " + parameters.SUBREPORT_DIR    + "\n\t" +
            "Report Path            : " + parameters.REPORT_DIRECTORY + "\n\t" +
            "Report Name            : " + parameters.REPORT_FILE_NAME + "\n\t" +
            "Report Format          : " + parameters.P_REPORT_FORMAT  + "\n\t" +
            "Output File Name       : " + parameters.OUTPUT_FILE_NAME + "\n\t" +
            "Parameters             : " + parameters                  + "\n\t" +
            "Printed By (Full Name) : " + currentUser.fullName        + "\n\t" +
            "Printed By (Id)        : " + currentUser.username        + "\n\t" +
            "Printed By (H.Id)      : " + currentUser.id              + "\n\t" +
            "Print Time             : " + currentDate                 + "\n" +
            "-------------------------------------------------------------------------------------------------------------------------------------------------------\n"
        )

        Exception exception
        if (parameters.P_REPORT_FORMAT == "PDF_V") {
            exception = reportService.showPdfToBrowser(parameters, response)
        }
        else{
            exception = reportService.downloadReport(parameters, response)
        }
        flash.exception = exception
        render(view: "download", model: [params: parameters, rptReport: params.rptReport, reportList: reportService.getReportList([forGlobalWindow: true, complete: true, active: true])])
        return
    }

    def getReports(){
        if(request.xhr){
            Map<String, Object> reportDetails = new LinkedHashMap()
            for(r in reportService.getReportList()){
                reportDetails.put(r.id.toString(), getReportDetails(r))
            }
            //println(reportDetails as JSON)
            render (reportDetails as JSON)
        }
    }

    Map<String, Object> getReportDetails(RptReport r){
        Map m = new LinkedHashMap()
        m.put("meta"   , reportService.getReportMetaData(r))
        m.put("formats", reportService.getReportFormats (r))
        m.put("params" , reportService.getReportParams  (r))
        m.put("scripts", reportService.getReportScripts (r))
        return  m
    }
}
