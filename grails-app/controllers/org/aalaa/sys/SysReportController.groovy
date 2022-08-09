package org.aalaa.sys

import grails.plugin.springsecurity.SpringSecurityService
import org.aalaa.auth.AuthUser
import org.aalaa.com.IoUtilService
import org.aalaa.rpt.ReportService
import org.aalaa.rpt.RptReport

import java.text.SimpleDateFormat

class SysReportController {

    IoUtilService         ioUtilService
    ReportService         reportService
    SpringSecurityService springSecurityService
    TrackerService        trackerService
    SimpleDateFormat      dateParseFormat,
                          printDateFormat
    AuthUser              currentUser
    Date                  currentDate
    String                printDate

    def beforeInterceptor = {
        currentUser     = springSecurityService.getCurrentUser()
        dateParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
        printDateFormat = new SimpleDateFormat(grailsApplication.config.format.printDate)
        currentDate     = new Date()
        printDate       = printDateFormat.format(currentDate).toString()
    }

    def index() { }

    def print() {
        RptReport m = RptReport.get(params.rptReport)
        Map parameters = new LinkedHashMap(params)

        parameters.put("REPORT_DIRECTORY", ioUtilService.getReportDirectory(m.module, m.subModule))
        parameters.put("SUBREPORT_DIR"   , ioUtilService.getReportDirectory(m.module, m.subModule))
        parameters.put("REPORT_FILE_NAME", m.fileName)
        parameters.put("OUTPUT_FILE_NAME", "HDC_" + m.title + "_v" + printDate)
        parameters.put("REPORT_FILE", parameters.REPORT_DIRECTORY + parameters.REPORT_FILE_NAME)

        parameters.putAll(reportService.addFormatDependencies(parameters.P_REPORT_FORMAT))

        if(!ioUtilService.isFileExist(parameters.REPORT_FILE)){
            println "EX-01-RptReport : File('" + parameters.REPORT_FILE_NAME + "') Not found @ path : " + parameters.REPORT_DIRECTORY
            flash.warning = "Sorry, Report not yet configured...!"
            render(view: "index", model: [params: parameters])
            return
        }
        if(!parameters.extension) {
            flash.error = "Sorry, You are requesting an invalid report format...!"
            render(view: "index", model: [params: parameters])
            return
        }

        Map ri = trackerService.getRequestInfo(request)
        println ri
        println(
            "\n-------------------------------------------------------------------------------------------------------------------------------------------------------\n\t" +
            "Report Directory       : " + parameters.REPORT_DIRECTORY         + "\n\t" +
            "SubReport Directory    : " + parameters.SUBREPORT_DIR            + "\n\t" +
            "Report Name            : " + parameters.REPORT_FILE_NAME         + "\n\t" +
            "Report Format          : " + parameters.P_REPORT_FORMAT          + "\n\t" +
            "Output File Name       : " + parameters.OUTPUT_FILE_NAME         + "\n\t" +
            "Parameters             : " + parameters                          + "\n\t" +
            "Report Path            : " + parameters.REPORT_DIRECTORY         + "\n\t" +
            "Printed By (Full Name) : " + currentUser.fullName                + "\n\t" +
            "Printed By (Id)        : " + currentUser.username                + "\n\t" +
            "Printed By (H.Id)      : " + currentUser.id                      + "\n\t" +
            "Print Time             : " + currentDate                         + "\n\t" +
            "Printed From           : "                                       + "\n\t" +
            "\tRemote Host Address: " + ri.hostInformation.remoteHostAddress  + "\n\t" +
            "\tRemote Host Name   : " + ri.hostInformation.remoteHostName     + "\n\t" +
            "\tLocal Host Address : " + ri.hostInformation.localHostAddress   + "\n\t" +
            "\tLocal Host Name    : " + ri.hostInformation.localHostName      + "\n"   +
            "-------------------------------------------------------------------------------------------------------------------------------------------------------\n"
        )

        Exception exception
        if (parameters.P_REPORT_FORMAT == "PDF_V") {
            exception = reportService.showPdfToBrowser(parameters, response)
        }
        else{
            exception = reportService.downloadReport(parameters, response)
        }
        flash.error = exception
        render(view: "index", model: [params: parameters])
        return
    }

    def overview() { }
}
