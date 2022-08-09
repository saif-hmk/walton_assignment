/**
 * @Created_By : AALAA
 * @Date       : 2015.09.11 11:20:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.rpt

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import net.sf.jasperreports.engine.*
import org.aalaa.auth.AuthRole
import org.aalaa.auth.AuthUser
import org.aalaa.auth.AuthUserService
import org.aalaa.adm.AdmBranch
import org.aalaa.adm.AdmOrganization
import org.aalaa.com.DbService
import org.aalaa.com.IoUtilService
import org.aalaa.sys.QueryType
import org.aalaa.sys.ScriptType
import org.aalaa.util.UtilityService
import org.codehaus.groovy.grails.web.util.WebUtils

import javax.servlet.http.HttpServletResponse
import javax.servlet.http.HttpSession
import java.sql.Connection
import java.sql.SQLException
import java.text.SimpleDateFormat

@Transactional
class ReportService {
    JasperService          jasperService
    IoUtilService          ioUtilService
    AuthUserService        authUserService
    SpringSecurityService  springSecurityService
    UtilityService         utilityService
    DbService              dbService
    AdmOrganization        currentUserOrg
    String                 printDate
    AuthUser               currentUser
    def                    dataSource
    SimpleDateFormat       dateParseFormat
    Set<AuthRole>          currentUserRoles
    static List<AdmBranch> currentUserBranches
    Date                   currentDate
    Boolean                rootUser,
                           admin,
                           hod

    void refreshDependencies(){
        HttpSession session = WebUtils.retrieveGrailsWebRequest().getSession()
        dateParseFormat     = session.getAttribute("DATE_PARSE_FORMAT"         )
        currentUserRoles    = session.getAttribute("USER_ROLES"        )
        currentUserOrg      = session.getAttribute("USER_ORGANIZATION" )
        currentUserBranches = session.getAttribute("USER_BRANCHES"     )
        rootUser            = session.getAttribute("ROOT_USER"                 )
        admin               = session.getAttribute("ADMIN"                     )
        hod                 = session.getAttribute("HOD"                       )

        currentDate         = new Date()
        currentUser         = springSecurityService.getCurrentUser()
    }

    List<RptReport> getReportList(){
        return getReportList([:])
    }

    List<RptReport> getReportList(Map params){
        currentUser    = springSecurityService?.getCurrentUser()
        currentUserOrg = authUserService?.getAuthUserOrganization()
        List<RptReport> reportList = RptReport.createCriteria().list {
            if(params.active) {
                eq("active", params.active)
            }
            if(params.complete) {
                eq("complete", params.complete)
            }
            if(params.forGlobalWindow) {
                eq("forGlobalWindow", params.forGlobalWindow)
            }
            if(params.typeOfModule) {
                eq("typeOfModule"   , params.typeOfModule)
            }
            order("subModule", "asc")
            order("sortOrder", "asc")
        }
        return reportList
    }

    String generateReportName(RptReport r){
        return (r?.admVendorOrganization?.code ?: "WALTON") + "_R" + r.id + "_"+ (r.title.replaceAll("[^a-zA-Z0-9\\u0980-\\u09FF]", " ")?.trim()?.replaceAll("\\s+", "_")?.toLowerCase()).toString()
    }

    Map addFormatDependencies(String reportFormat){
        Map response = new LinkedHashMap()
        reportFormat = reportFormat.toUpperCase()
        if (reportFormat == "CSV") {
            response.put("fileFormat", JasperExportFormat.CSV_FORMAT)
            response.put("contentType", "application/csv")
            response.put("extension", ".csv")
        } else if (reportFormat == "DOCX") {
            response.put("fileFormat", JasperExportFormat.DOCX_FORMAT)
            response.put("contentType", "application/docx")
            response.put("extension", ".docx")
        } else if (reportFormat == "HTML") {
            response.put("fileFormat", JasperExportFormat.HTML_FORMAT)
            response.put("contentType", "application/html")
            response.put("extension", ".html")
        } else if (reportFormat == "ODS") {
            response.put("fileFormat", JasperExportFormat.ODS_FORMAT)
            response.put("contentType", "application/ods")
            response.put("extension", ".ods")
        } else if (reportFormat == "ODT") {
            response.put("fileFormat", JasperExportFormat.ODT_FORMAT)
            response.put("contentType", "application/odt")
            response.put("extension", ".odt")
        } else if (reportFormat == "PDF" || reportFormat == "PDF_D" || reportFormat == "PDF_V") {
            response.put("fileFormat", JasperExportFormat.PDF_FORMAT)
            response.put("contentType", "application/pdf")
            response.put("extension", ".pdf")
        } else if (reportFormat == "PPTX") {
            response.put("fileFormat", JasperExportFormat.PPTX_FORMAT)
            response.put("contentType", "application/vnd.openxmlformats-officedocument.presentationml.presentation")
            response.put("extension", ".pptx")
        } else if (reportFormat == "RTF") {
            response.put("fileFormat", JasperExportFormat.RTF_FORMAT)
            response.put("contentType", "application/rtf")
            response.put("extension", ".rtf")
        } else if (reportFormat == "TEXT") {
            response.put("fileFormat", JasperExportFormat.TEXT_FORMAT)
            response.put("contentType", "application/text")
            response.put("extension", ".text")
        } else if (reportFormat == "XLS") {
            response.put("fileFormat", JasperExportFormat.XLS_FORMAT)
            response.put("contentType", "application/vnd.ms-excel")
            response.put("extension", ".xls")
            response.put("IS_IGNORE_PAGINATION", true)
        } else if (reportFormat == "XLSX") {
            response.put("fileFormat", JasperExportFormat.XLSX_FORMAT)
            response.put("contentType", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
            response.put("extension", ".xlsx")
            response.put("IS_IGNORE_PAGINATION", true)
        } else if (reportFormat == "XML") {
            response.put("fileFormat", JasperExportFormat.XML_FORMAT)
            response.put("contentType", "application/xml")
            response.put("extension", ".xml")
        }
        return response
    }

    Object getCompiledJasperReport(Object reportFile){
        Object jasperReport = null
        if(ioUtilService.getFileExtension(reportFile.toString()).toLowerCase() == ".jrxml"){
            jasperReport = JasperCompileManager.compileReport(reportFile)
        }
        else if(ioUtilService.getFileExtension(reportFile.toString()).toLowerCase() == ".jasper"){
            jasperReport = reportFile
        }
        return jasperReport
    }

    def showPdfToBrowser(Map reportParams, HttpServletResponse response){
        response.reset()
        response.setCharacterEncoding("UTF-8")
        //response.setHeader("Content-Disposition",  "inline");
        //response.setHeader("Content-disposition", "filename=${reportParams.OUTPUT_FILE_NAME}.pdf")

        //Connection connection = ExternalDbConnector.getConnection(["user": "r_s_mis_g_eias", "password": "r_s_mis_g_eias"]);
        Connection connection = dataSource?.getConnection()

        Exception  exception  = null
        try {
            JasperPrint jasperPrint = JasperFillManager.fillReport(getCompiledJasperReport(reportParams?.REPORT_FILE), reportParams, connection)
            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream())
        }
        catch (FileNotFoundException e) {
            exception = e
            e.printStackTrace()
        }
        catch (ClassNotFoundException e) {
            exception = e
            e.printStackTrace()
        }
        catch (JRException e) {
            exception = e
            e.printStackTrace()
        }
        catch (SQLException e) {
            exception = e
            e.printStackTrace()
        }
        catch (Exception e) {
            exception = e
            e.printStackTrace()
        }
        finally {
            if (connection != null) {
                connection.close()
            }
        }
        return exception
    }

    def downloadReport(Map parameters, HttpServletResponse response){
        //println "Report Parameters : " + parameters
        response.reset()
        response.setCharacterEncoding("UTF-8")
        response.setContentType(parameters.contentType)
        response.setHeader('Content-disposition', 'attachment; filename="' + parameters.OUTPUT_FILE_NAME + parameters.extension)
        JasperReportDef report = new JasperReportDef(name: parameters.REPORT_FILE_NAME, folder: parameters.REPORT_DIRECTORY, parameters: parameters, fileFormat: parameters.fileFormat)
        Exception exception    = null
        try {
            response.outputStream << jasperService.generateReport(report).toByteArray()
            response.outputStream.flush()
            return
        }
        catch (FileNotFoundException e) {
            exception = e
            e.printStackTrace()
        }
        catch (ClassNotFoundException e) {
            exception = e
            e.printStackTrace()
        }
        catch (JRException e) {
            exception = e
            e.printStackTrace()
        }
        catch (SQLException e) {
            exception = e
            e.printStackTrace()
        }
        catch (Exception e) {
            exception = e
            e.printStackTrace()
            return
        }
        return exception
    }

    Map getReportMetaData(def id){
        return getReportMetaData(RptReport?.get(id))
    }

    Map getReportMetaData(RptReport r){
        Map m = new LinkedHashMap()
        m.put("id"              , r.id              )
        m.put("defaultFormat"   , [key  : r.defaultFormat.key, value: r.defaultFormat.value])
        m.put("message"         , [exist: (r.messageForUser ? true : false), type: r.messageType, text: r.messageForUser])
        m.put("code"            , r.code            )
        m.put("componentGroup"  , r.module          )
        m.put("subModule"       , r.subModule       )
        m.put("title"           , r.title           )
        m.put("titleNative"     , r.titleNative     )
        m.put("optGroup"        , r.optGroup        )
        m.put("optGroupNative"  , r.optGroupNative  )
        m.put("shortDescription", r.shortDescription)
        m.put("sortOrder"       , r.sortOrder       )
        return m
    }

    String getReportFormats(def id){
        return getReportFormats(RptReport?.get(id))
    }

    String getReportFormats(RptReport r){
        return utilityService.generateDropDownList(r?.rptReportLkFormat?.sort{it.reportFormat}?.reportFormat, "key", "value")
    }

    List<Map> getReportScripts(def id){
        return getReportScripts(RptReport?.get(id))
    }

    List<Map> getReportScripts(RptReport r){
        Set<RptReportLkScript> rptReportLkScriptSet = r?.rptReportLkScript?.findAll {[it.active == true, it.sysScript.scriptType == ScriptType.JS]}?.sort{it.sortOrder}
        List l = new ArrayList()
        for (RptReportLkScript p in rptReportLkScriptSet){
            Map m = new LinkedHashMap()
            m.put("rptReport" , r.id              )
            m.put("active"    , p.active          )
            m.put("scriptText", p.sysScript.scriptText)
            l.add(m)
        }
        return l
    }

    List<Map> getReportParams(def id){
        return getReportParams(RptReport?.get(id))
    }

    List<Map> getReportParams(RptReport r){
        Set<RptReportLkParam> rptReportLkParamSet = new HashSet<>()
        try {
            rptReportLkParamSet = r?.rptReportLkParam?.findAll {it.active == true && it.receiveValueFrom == ReceiveValueFrom.FRONT_END}?.sort{it.sortOrder}
        } catch (Exception e) {
            println "|EX-RS-GRP: " + e
        }
        List l = new ArrayList()
        for (RptReportLkParam p in rptReportLkParamSet){
            Map m = new LinkedHashMap()
            m.put("rptReport"      , r.id      )
            m.put("rptParameter"   , getParameterDetails(p.rptParameter))
            m.put("dataType"       , p.dataType.key      )
            m.put("classCss"       , p.classCss     ?: "")
            m.put("classLabel"     , p.classLabel   ?: "")
            m.put("jsId"           , p.jsId         ?: "")
            m.put("title"          , p.title        ?: "")
            m.put("placeholder"    , p.placeholder  ?: "")
            m.put("dtAddOrLess"    , p.dtAddOrLess  ?: "")
            m.put("defaultValue"   , p.defaultValue ?: "")
            m.put("min"            , p.min          ?: "")
            m.put("max"            , p.max          ?: "")
            m.put("step"           , p.step         ?: "")
            m.put("classResponsive", p.classResponsive   )
            m.put("active"         , p.active            )
            m.put("required"       , p.required          )
            if(p.dataType == DataType.LIST || p.dataType == DataType.SET || p.dataType == DataType.OBJECT){
                if(p.queryType == QueryType.HQL){
                    m.put("dropDownList", utilityService.generateDropDownList(filter(Class.forName(p.collectionPojo), ["orderBy": p.collectionOrderBy, "direction": p.collectionDirection]), p.collectionKey, p.collectionValue))
                }
                else if(p.queryType == QueryType.SQL){
                    if(p.collectionValueNative)
                        m.put("dropDownList", utilityService.generateDropDownList(dbService.getResultSet(p.query), p?.collectionKey ?: "KEY", p?.collectionValue ?: "VALUE", p?.collectionValueNative ?: "VALUE_NATIVE"))
                    else
                        m.put("dropDownList", utilityService.generateDropDownList(dbService.getResultSet(p.query), p?.collectionKey ?: "KEY", p?.collectionValue ?: "VALUE"))
                }
            }

            l.add(m)
        }
        return l
    }

    Map getParameterDetails(RptParameter p){
        if(p){
            Map m = new LinkedHashMap()
            m.put("keyword"     , p.keyword)
            m.put("title"       , p.title)
            m.put("titleNative" , p.titleNative)
            if(p.rptParameter){
                List<Map> lm = new ArrayList()
                for (c in p.rptParameter.sort{it.sortOrder}){
                    Map cm = new LinkedHashMap()
                    cm.put("parent", c.parentId)
                    cm.putAll(getParameterDetails(c))
                    lm.add(cm)
                }
                m.put("rptParameter", lm)
            }
            return m
        }
        else return null
    }

    public <T extends Object> List filter(T, Map params){
        refreshDependencies()

        String orderBy   = params.orderBy   ?: "id",
               direction = params.direction ?: "asc"
        Map    fields    = utilityService.getFields(T)
        Set    k         = fields.keySet()

        List<T> listOfTs = T.createCriteria().list(params) {
            if(T.title == "org.aalaa.adm.AdmOrganization" && currentUserOrg){
                eq('id', currentUserOrg.id)
            }
            if(rootUser || admin){
                if(k.contains("admVendorOrganization") || k.contains("comOrganizationId")){
                    if(rootUser){
                        if(params.admVendorOrganization || params.comOrganizationId){
                            if(params.comOrganizationId){
                                eq("admVendorOrganization", AdmOrganization.get(params.comOrganizationId))
                            }
                            else if(params.admVendorOrganization.getClass() == Class.forName("java.lang.Long") || params.admVendorOrganization.getClass() == Class.forName("java.lang.String")){
                                eq("admVendorOrganization", AdmOrganization.get(params.admVendorOrganization))
                            }
                            else{
                                eq("admVendorOrganization", params.admVendorOrganization)
                            }
                        }
                    }
                    else {
                        eq('admVendorOrganization', currentUserOrg)
                    }
                }
                if(k.contains("active") == true){
                    if(params.active)
                        eq("active", Boolean.valueOf(params.active))
                    else
                        eq("active", true)
                }
                if(k.contains("closed") == true){
                    if(params.closed)
                        eq("closed", Boolean.valueOf(params.closed))
                    else
                        eq("closed", false)
                }
            }
            else {
                if(k.contains("admVendorOrganization"))
                    eq('admVendorOrganization', currentUserOrg)
                if(k.contains("active"))
                    eq("active", true)
                if(k.contains("closed"))
                    eq("closed", false)
            }
            order(orderBy, direction)
        }
        return listOfTs
    }
}
