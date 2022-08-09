/**
 * @Created_By : AALAA
 * @Date       : 2021.10.20 07:15:10 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.auth

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import org.aalaa.com.CommonService
import org.aalaa.sys.DashboardService
import org.aalaa.sys.SystemService
import org.aalaa.sys.TrackerService

import java.text.SimpleDateFormat

class AuthHomeController {
    AuthUserService       authUserService
    SystemService         systemService
    TrackerService        trackerService
    SpringSecurityService springSecurityService
    DashboardService      dashboardService
    CommonService         commonService

    AuthUser              currentUser
    Date                  currentDate
    SimpleDateFormat      dateParseFormat

    def beforeInterceptor = {
        currentDate     = new Date()
        currentUser     = springSecurityService.getCurrentUser()
        dateParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
    }

    def index() {
        try {
            //println "Initializing System Properties..."
            systemService.setSystemProperties(session, request)
            //println "Done."
        } catch (Exception e) {
            println "EX-AH-02: Failed to initialize System Properties!\n" + e
        }
        try {
            //println "Initializing User Properties..."
            authUserService.initializeUserProperty(session, request)
            //println "Done."
        } catch (Exception e) {
            println "EX-AH-01: Failed to initialize User Properties!\n" + e
        }

        if(session.getAttribute("USER_HOME")){
            redirect(uri: session.getAttribute("USER_HOME"))
        }
        else{
            render(view: "index")
        }
    }

    def developer() {
        trackerService.trackRequest([request: request, currentUser: currentUser, params: params])
        [componentTabularCt: session.getAttribute("DB_COMPONENT_TABULAR_CT")]
    }

    def support() {
        [componentTabularCt: session.getAttribute("DB_COMPONENT_TABULAR_CT")]
    }

    def admin() {
        [componentTabularCt: session.getAttribute("DB_COMPONENT_TABULAR_CT")]
    }

    def manager() {
        [componentTabularCt: session.getAttribute("DB_COMPONENT_TABULAR_CT")]
    }

    def user() {
        [componentTabularCt: session.getAttribute("DB_COMPONENT_TABULAR_CT")]
    }

    def management() {
        [componentTabularCt: session.getAttribute("DB_COMPONENT_TABULAR_CT")]
    }

    def getDashboardDatums() {
        if(request.xhr){
            SimpleDateFormat sdfFe     = new SimpleDateFormat("yyyy-MM-dd" ),
                             sdfDe     = new SimpleDateFormat("dd-MMM-yyyy")
            String           admBranch = (params.admBranch ?: null),
                             userId    = (currentUser.id ?: null),
                             fromDate  = null,
                             toDate    = null
            if(params?.fromDate == "01-Jan-1901" || params?.fromDate == "01-Jan-1970"){
                fromDate = sdfDe.format(new Date())
            }
            else if(params.fromDate){
                fromDate = sdfDe.format(sdfFe.parse(params.fromDate))
            }
            if(params?.toDate == "01-Jan-1901" || params?.toDate == "01-Jan-1970"){
                toDate = sdfDe.format(new Date())
            }
            else if(params.toDate){
                toDate = sdfDe.format(sdfFe.parse(params.toDate))
            }
            Map db = new LinkedHashMap()
            try {
                println "Dashboard Params: (" + (admBranch + ',' + userId + ",'${fromDate}','${toDate}'") + ")"
                db = dashboardService.getDashboard(admBranch + ',' + userId + ",'${fromDate}','${toDate}'")
            } catch (Exception e) {
                println "|EX-AHC-GDD-01: " + e
            }
            if (db){
                db.put("COMPONENT_GROUPS", commonService.getDashBoardComponentGroupList())
            }
            render (db as JSON)
        }
    }
}
