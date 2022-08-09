package org.walton.util

import grails.transaction.Transactional
import org.aalaa.adm.*
import org.aalaa.auth.*
import org.aalaa.com.*
import org.aalaa.rpt.*
import org.aalaa.sys.*
import org.aalaa.util.UtilityService
import org.codehaus.groovy.grails.commons.GrailsApplication

import java.text.SimpleDateFormat

@Transactional
class WaltonDataUploadService {
    GrailsApplication grailsApplication
    IoUtilService     ioUtilService
    UtilityService    utilityService
    DbService         dbService
    TrackerService    trackerService

    final String      FS                  = File.separator
    SimpleDateFormat  formatDtpDate       = new SimpleDateFormat(),
                      formatDtpDateTime12 = new SimpleDateFormat(),
                      formatDtpDateTime24 = new SimpleDateFormat()
    def               logCreatedBy        = AuthUser.findByUsername("hmk") ?: 1L
    String            scriptPath,
                      datasource,
                      remarks             = "System Generated"

    static final String replaceY(String code){
        String $y = new SimpleDateFormat("yy").format(new Date())
        return code.replace("\$Y", $y)
    }

    static final String replaceM(String code){
        String $m = new SimpleDateFormat("MM").format(new Date())
        return code.replace("\$M", $m)
    }

    static final String replaceD(String code){
        String $d = new SimpleDateFormat("dd").format(new Date())
        return code.replace("\$D", $d)
    }

    static final String replaceYm(String code){
        return replaceM(replaceY(code))
    }

    static final String replaceYmd(String code){
        return replaceD(replaceM(replaceY(code)))
    }

    private void uploadSqlScripts(){
        scriptPath = "D:\\9.0_repo\\1.0_hmk\\WALTON\\a_g_rnd_p_walton\\src\\dev\\setupData" + FS + ioUtilService.getModuleSubModule("walton", "sql")

        aExecuteScriptDropTables()
        aExecuteScriptOfViews()
    }

    private void aExecuteScriptDropTables(){
        println "waltonExecuteScriptDropTables"
        //ArrayList waltonAuthUserList = utilityService.getMapFromJson(new File(datasource + "AuthUser.json")).get("jsonKey")
        //for (Map m in waltonAuthUserList) {
        String script = scriptPath + FS + "WALTON-DROP-TABLE.SQL"
        Object o = dbService.executeSqlFile(new File(script))
        println o
        //}
    }

    private void aExecuteScriptOfViews(){
        println "waltonExecuteScriptOfViews"
        //ArrayList waltonAuthUserList = utilityService.getMapFromJson(new File(datasource + "AuthUser.json")).get("jsonKey")
        //for (Map m in waltonAuthUserList) {
        String script = scriptPath + FS + "WALTON-VIEWS.SQL"
        Object o      = dbService.executeSqlFile(new File(script))
        println o
        //}
    }

    private void uploadData(){
        println "------------------------------------------------------------------------------------------------------------------------------------------------------"
        println "Starting data upload process for the componentGroup : AALAA"
        println "------------------------------------------------------------------------------------------------------------------------------------------------------"
        formatDtpDate       = new SimpleDateFormat(grailsApplication.config.format.dtp.date      )
        formatDtpDateTime12 = new SimpleDateFormat(grailsApplication.config.format.dtp.dateTime12)
        formatDtpDateTime24 = new SimpleDateFormat(grailsApplication.config.format.dtp.dateTime24)
        //datasource          = ioUtilService.getRepository() + FS + ioUtilService.getModuleSubModule("setupData", "walton")
        datasource          = "D:\\9.0_repo\\1.0_hmk\\WALTON\\a_g_rnd_p_walton\\src\\dev\\setupData" + FS + ioUtilService.getModuleSubModule("walton", "json")

        aAuthUser()
        logCreatedBy = AuthUser.findByUsername("hmk")

        //aAuthRole()
        aAuthUserLkRole()
        //aAuthLandingPage()
        aAuthUserProfile()
        aAuthUserProperty()

        //aAuthMenu()
        aAuthRequestMap()
        aAuthRequestMapController()

        aAdmVendorOrganization()
        aAdmBranch()
        aAuthUserLkBranch()
        aAdmDepartment()
        aAdmDesignation()

        aComUnitOfMeasurementCategory()
        aComUnitOfMeasurement()

//        aRptParameter()
//        aRptParameter()
//        aRptReport()
//        aRptReportLkParam()
//        aReportLkFormat()
//        aRptReportLkRole()
    }

    private void uploadData(ArrayList<String> arrayList){
        println "------------------------------------------------------------------------------------------------------------------------------------------------------"
        println "Starting data upload process for the componentGroup : AALAA"
        println "------------------------------------------------------------------------------------------------------------------------------------------------------"
        formatDtpDate       = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
        formatDtpDateTime12 = new SimpleDateFormat(grailsApplication.config.format.dtp.dateTime12)
        formatDtpDateTime24 = new SimpleDateFormat(grailsApplication.config.format.dtp.dateTime24)
        datasource          = ioUtilService.getRepository() + FS + ioUtilService.getModuleSubModule("setupData", "walton")

        for (a in arrayList){
                 if (a.equals("A_AUTH_USER"))                  {aAuthUser()}
            else if (a.equals("A_AUTH_ROLE"))                  {aAuthRole()}
            else if (a.equals("A_AUTH_USER_LK_ROLE"))          {aAuthUserLkRole()}
            else if (a.equals("A_AUTH_REQUEST_MAP"))           {aAuthRequestMap()}
            else if (a.equals("A_AUTH_REQUEST_MAP_CONTROLLER")){aAuthRequestMapController()}
            else if (a.equals("A_AUTH_LANDING_PAGE"))          {aAuthLandingPage()}
            else if (a.equals("A_AUTH_USER_PROFILE"))          {aAuthUserProfile()}
            else if (a.equals("A_AUTH_USER_PROPERTY"))         {aAuthUserProperty()}
            else if (a.equals("A_AUTH_USER_PROPERTY"))         {aAuthUserProperty()}
            else if (a.equals("A_AUTH_USER_PROPERTY"))         {aAuthUserProperty()}
            else if (a.equals("A_AUTH_MENU"))                  {aAuthMenu()}
            else if (a.equals("A_RPT_REPORT"))                 {aRptReport()}
            else if (a.equals("A_RPT_PARAMETER"))              {aRptParameter()}
            else if (a.equals("A_RPT_REPORT_LK_ROLE"))         {aRptReportLkRole()}
            else if (a.equals("R_REPORT_LK_FORMAT"))           {aReportLkFormat()}
            else if (a.equals("A_RPT_REPORT_LK_PARAM"))        {aRptReportLkParam()}
        }
    }


    private void aAuthUser(){
        println "waltonAuthUser"
        ArrayList waltonAuthUserList = utilityService.getMapFromJson(new File(datasource + "AuthUser.json")).get("jsonKey")
        for (Map m in waltonAuthUserList) {
            m.logCreatedBy = logCreatedBy
            m.version      = 0
            m.password     = "123"
            m.hdCode       = trackerService.getHdCode("123")
            m.remarks      = remarks
            AuthUser.findByUsername(m.username) ?: new AuthUser(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aAuthRole(){
        println "waltonAuthRole"
        ArrayList waltonAuthRoleList = utilityService.getMapFromJson(new File(datasource + "AuthRole.json")).get("jsonKey")
        for (Map m in waltonAuthRoleList) {
            m.logCreatedBy = logCreatedBy
            m.remarks      = remarks
            AuthRole.findByAuthority(m.authority) ?: new AuthRole(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aAuthUserLkRole(){
        println "waltonAuthUserLkRole"
        ArrayList waltonAuthUserLkRoleList = utilityService.getMapFromJson(new File(datasource + "AuthUserLkRole.json")).get("jsonKey")
        for (Map m in waltonAuthUserLkRoleList) {
            m.authUser = AuthUser.findByUsername(m.authUser)
            m.authRole = AuthRole.findByAuthority(m.authRole)
            AuthUserLkRole.findByAuthUserAndAuthRole(m.authUser, m.authRole) ?: new AuthUserLkRole(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aAuthLandingPage(){
        println "waltonAuthLandingPage"
        ArrayList waltonAuthLandingPageList = utilityService.getMapFromJson(new File(datasource + "AuthLandingPage.json")).get("jsonKey")
        for (Map m in waltonAuthLandingPageList) {
            m.logCreatedBy = logCreatedBy
            m.remarks      = remarks
            m.authRole     = AuthRole.findByAuthority(m.authRole)
            AuthLandingPage.findByAuthRole(m.authRole) ?: new AuthLandingPage(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aAuthUserProfile(){
        println "waltonAuthUserProfile"
        ArrayList waltonAuthUserProfileList = utilityService.getMapFromJson(new File(datasource + "AuthUserProfile.json")).get("jsonKey")
        for (Map m in waltonAuthUserProfileList) {
            m.logCreatedBy  = logCreatedBy
            m.authUser      = AuthUser.findByUsername(m.authUser)
            m.maritalStatus = MaritalStatus.valueOf(m.maritalStatus)
            m.gender        = Gender.valueOf(m.gender)
            m.honorific     = Honorific.valueOf(m.honorific)
            m.religion      = Religion.valueOf(m.religion)
            m.dateOfBirth   = m.dateOfBirth ? formatDtpDate.parse(m.dateOfBirth) : null
            try {
                AuthUserProfile.findByAuthUser(m.authUser) ?: new AuthUserProfile(m).save(flush: true, failOnError: true, errors: true)
            } catch (Exception e) {
                println e
            }
        }
    }

    private void aAuthUserProperty(){
        println "waltonAuthUserProperty"
        ArrayList waltonAuthUserPropertyList = utilityService.getMapFromJson(new File(datasource + "AuthUserProperty.json")).get("jsonKey")
        for (Map m in waltonAuthUserPropertyList) {
            m.authUserProfile = AuthUserProfile.findByAuthUser(AuthUser.findByUsername(m.authUser))
            m.menuType        = MenuType.valueOf(m.menuType)
            m.local           = Local.valueOf(m.local)
            m.availability    = Availability.valueOf(m.availability)
            m.firstDayOfWeek  = FirstDayOfWeek.valueOf(m.firstDayOfWeek)
            AuthUserProperty.findByAuthUserProfile(m.authUserProfile) ?: new AuthUserProperty(m).save(flush: true, failOnError: true, errors: true)
        }
    }


    private void aAuthMenu() {
        println "waltonAuthMenu"

        //Menu : "/#systemOverview"
        AuthMenu _0100000000 = AuthMenu.findByUrl("/#systemOverview"            ) ?: new AuthMenu(["code": "0100000000", parentMenu:        null, url: "/#systemOverview"           , title: "System Overview"          , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-desktop'                ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0101000000 = AuthMenu.findByUrl("/#sysReport"                 ) ?: new AuthMenu(["code": "0101000000", parentMenu: _0100000000, url: "/#sysReport"                , title: "Report"                   , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: "fa fa-pie-chart text-purple"  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0101010000 = AuthMenu.findByUrl("/sysReport/overview"         ) ?: new AuthMenu(["code": "0101010000", parentMenu: _0101000000, url: "/sysReport/overview"        , title: "Report - Overview"        , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0101020000 = AuthMenu.findByUrl("/sysReport/index"            ) ?: new AuthMenu(["code": "0101020000", parentMenu: _0101000000, url: "/sysReport/index"           , title: "Report - Index"           , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0102000000 = AuthMenu.findByUrl("/#sysLog"                    ) ?: new AuthMenu(["code": "0102000000", parentMenu: _0100000000, url: "/#sysLog"                   , title: "Log"                      , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: "fa fa-file text-purple"       ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0102010000 = AuthMenu.findByUrl("/sysLog"                     ) ?: new AuthMenu(["code": "0102010000", parentMenu: _0102000000, url: "/sysLog"                    , title: "System Log"               , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-file-text text-primary' ]).save(flush: true, failOnError: true, errors: true)

        //Menu : "/#systemSetup"
        AuthMenu _0200000000 = AuthMenu.findByUrl('/#systemSetup'               ) ?: new AuthMenu(["code": "0200000000", parentMenu:        null, url: '/#systemSetup'              , title: 'System Setup'             , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-cog'                    ]).save(flush: true, failOnError: true, errors: true)

        //Menu : "/#accessControl"
        AuthMenu _0201000000 = AuthMenu.findByUrl("/#accessControl"             ) ?: new AuthMenu(["code": "0201000000", parentMenu: _0200000000, url: "/#accessControl"            , title: "Access Control"           , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-sliders text-purple'    ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0201010000 = AuthMenu.findByUrl('/#authRole'                  ) ?: new AuthMenu(["code": "0201010000", parentMenu: _0201000000, url: '/#authRole'                 , title: 'Role'                     , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201010100 = AuthMenu.findByUrl('/authRole/index'             ) ?: new AuthMenu(["code": "0201010100", parentMenu: _0201010000, url: '/authRole/index'            , title: 'Role - List'              , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201010200 = AuthMenu.findByUrl('/authRole/create'            ) ?: new AuthMenu(["code": "0201010200", parentMenu: _0201010000, url: '/authRole/create'           , title: 'Role - Create'            , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0201020000 = AuthMenu.findByUrl('/#authUser'                  ) ?: new AuthMenu(["code": "0201020000", parentMenu: _0201000000, url: '/#authUser'                 , title: 'User'                     , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201020100 = AuthMenu.findByUrl('/authUser/index'             ) ?: new AuthMenu(["code": "0201020100", parentMenu: _0201020000, url: '/authUser/index'            , title: 'User - List'              , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201020200 = AuthMenu.findByUrl('/authUser/create'            ) ?: new AuthMenu(["code": "0201020200", parentMenu: _0201020000, url: '/authUser/create'           , title: 'User - Create'            , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0201030000 = AuthMenu.findByUrl('/#authMenu'                  ) ?: new AuthMenu(["code": "0201030000", parentMenu: _0201000000, url: '/#authMenu'                 , title: 'Menu'                     , sortOrder: 15, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-sitemap text-red'       ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201030100 = AuthMenu.findByUrl('/authMenu/index'             ) ?: new AuthMenu(["code": "0201030100", parentMenu: _0201030000, url: '/authMenu/index'            , title: 'Menu - List'              , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201030200 = AuthMenu.findByUrl('/authMenu/create'            ) ?: new AuthMenu(["code": "0201030200", parentMenu: _0201030000, url: '/authMenu/create'           , title: 'Menu - Create'            , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0201040000 = AuthMenu.findByUrl('/#authLandingPage'           ) ?: new AuthMenu(["code": "0201040000", parentMenu: _0201000000, url: '/#authLandingPage'          , title: 'Landing Page'             , sortOrder: 20, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201040100 = AuthMenu.findByUrl('/authLandingPage/index'      ) ?: new AuthMenu(["code": "0201040100", parentMenu: _0201040000, url: '/authLandingPage/index'     , title: 'Landing Page - List'      , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201040200 = AuthMenu.findByUrl('/authLandingPage/create'     ) ?: new AuthMenu(["code": "0201040200", parentMenu: _0201040000, url: '/authLandingPage/create'    , title: 'Landing Page - Create'    , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0201050000 = AuthMenu.findByUrl('/#authUserLkRole'            ) ?: new AuthMenu(["code": "0201050000", parentMenu: _0201000000, url: '/#authUserLkRole'           , title: 'User & Role'              , sortOrder: 25, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201050100 = AuthMenu.findByUrl('/authUserLkRole/index'       ) ?: new AuthMenu(["code": "0201050100", parentMenu: _0201050000, url: '/authUserLkRole/index'      , title: 'User & Role - List'       , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201050200 = AuthMenu.findByUrl('/authUserLkRole/create'      ) ?: new AuthMenu(["code": "0201050200", parentMenu: _0201050000, url: '/authUserLkRole/create'     , title: 'User & Role - Create'     , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0201060000 = AuthMenu.findByUrl('/#authRequestMap'            ) ?: new AuthMenu(["code": "0201060000", parentMenu: _0201000000, url: '/#authRequestMap'           , title: 'Request & Role'           , sortOrder: 30, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201060100 = AuthMenu.findByUrl('/authRequestMap/index'       ) ?: new AuthMenu(["code": "0201060100", parentMenu: _0201060000, url: '/authRequestMap/index'      , title: 'Request & Role - List'    , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201060200 = AuthMenu.findByUrl('/authRequestMap/create'      ) ?: new AuthMenu(["code": "0201060200", parentMenu: _0201060000, url: '/authRequestMap/create'     , title: 'Request & Role - Crete'   , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0201070000 = AuthMenu.findByUrl('/#authUserLkBranch'          ) ?: new AuthMenu(["code": "0201070000", parentMenu: _0201000000, url: '/#authUserLkBranch'         , title: 'User & Branch'            , sortOrder: 35, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201070100 = AuthMenu.findByUrl('/authUserLkBranch/index'     ) ?: new AuthMenu(["code": "0201070100", parentMenu: _0201070000, url: '/authUserLkBranch/index'    , title: 'User & Branch - List'     , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0201070200 = AuthMenu.findByUrl('/authUserLkBranch/create'    ) ?: new AuthMenu(["code": "0201070200", parentMenu: _0201070000, url: '/authUserLkBranch/create'   , title: 'User & Branch - Crete'    , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        //Menu : "/#masterData"
        AuthMenu _0202000000 = AuthMenu.findByUrl("/#masterData"                        ) ?: new AuthMenu(["code": "0202000000", parentMenu: _0200000000, url: "/#masterData"                        , title: "Master Data"              , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-database text-purple'    ]).save(flush: true, failOnError: true, errors: true)

        //Menu : "/#locLocation"
        AuthMenu _0202010000 = AuthMenu.findByUrl("/#locLocation"                       ) ?: new AuthMenu(["code": "0202010000", parentMenu: _0202000000, url: "/#locLocation"                       , title: "Location"                 , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: "fa fa-map text-warning"        ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202010100 = AuthMenu.findByUrl('/#locCountry'                        ) ?: new AuthMenu(["code": "0202010100", parentMenu: _0202010000, url: '/#locCountry'                        , title: 'Country'                  , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'       ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010101 = AuthMenu.findByUrl('/locCountry/index'                   ) ?: new AuthMenu(["code": "0202010101", parentMenu: _0202010100, url: '/locCountry/index'                   , title: 'Country - List'           , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'   ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010102 = AuthMenu.findByUrl('/locCountry/create'                  ) ?: new AuthMenu(["code": "0202010102", parentMenu: _0202010100, url: '/locCountry/create'                  , title: 'Country - Create'         , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'   ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202010200 = AuthMenu.findByUrl('/#locProvinceState'                  ) ?: new AuthMenu(["code": "0202010200", parentMenu: _0202010000, url: '/#locProvinceState'                  , title: 'Province-State'           , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'       ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010201 = AuthMenu.findByUrl('/locProvinceState/index'             ) ?: new AuthMenu(["code": "0202010201", parentMenu: _0202010200, url: '/locProvinceState/index'             , title: 'Province-State - List'    , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'   ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010202 = AuthMenu.findByUrl('/locProvinceState/create'            ) ?: new AuthMenu(["code": "0202010202", parentMenu: _0202010200, url: '/locProvinceState/create'            , title: 'Province-State - Create'  , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'   ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202010300 = AuthMenu.findByUrl('/#locDivision'                       ) ?: new AuthMenu(["code": "0202010300", parentMenu: _0202010000, url: '/#locDivision'                       , title: 'Division'                 , sortOrder: 15, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'       ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010301 = AuthMenu.findByUrl('/locDivision/index'                  ) ?: new AuthMenu(["code": "0202010301", parentMenu: _0202010300, url: '/locDivision/index'                  , title: 'Division - List'          , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'   ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010302 = AuthMenu.findByUrl('/locDivision/create'                 ) ?: new AuthMenu(["code": "0202010302", parentMenu: _0202010300, url: '/locDivision/create'                 , title: 'Division - Create'        , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'   ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202010400 = AuthMenu.findByUrl('/#locDistrict'                       ) ?: new AuthMenu(["code": "0202010400", parentMenu: _0202010000, url: '/#locDistrict'                       , title: 'District'                 , sortOrder: 20, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'       ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010401 = AuthMenu.findByUrl('/locDistrict/index'                  ) ?: new AuthMenu(["code": "0202010401", parentMenu: _0202010400, url: '/locDistrict/index'                  , title: 'District - List'          , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'   ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010402 = AuthMenu.findByUrl('/locDistrict/create'                 ) ?: new AuthMenu(["code": "0202010402", parentMenu: _0202010400, url: '/locDistrict/create'                 , title: 'District - Create'        , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'   ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202010500 = AuthMenu.findByUrl('/#locCityCorporation'                ) ?: new AuthMenu(["code": "0202010500", parentMenu: _0202010000, url: '/#locCityCorporation'                , title: 'City Corporation'         , sortOrder: 25, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'       ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010501 = AuthMenu.findByUrl('/locCityCorporation/index'           ) ?: new AuthMenu(["code": "0202010501", parentMenu: _0202010500, url: '/locCityCorporation/index'           , title: 'City Corporation - List'  , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'   ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010502 = AuthMenu.findByUrl('/locCityCorporation/create'          ) ?: new AuthMenu(["code": "0202010502", parentMenu: _0202010500, url: '/locCityCorporation/create'          , title: 'City Corporation - Create', sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'   ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202010600 = AuthMenu.findByUrl('/#locSubDistrict'                    ) ?: new AuthMenu(["code": "0202010600", parentMenu: _0202010000, url: '/#locSubDistrict'                    , title: 'Sub District'             , sortOrder: 30, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'       ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010601 = AuthMenu.findByUrl('/locSubDistrict/index'               ) ?: new AuthMenu(["code": "0202010601", parentMenu: _0202010600, url: '/locSubDistrict/index'               , title: 'Sub District - List'      , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'   ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010602 = AuthMenu.findByUrl('/locSubDistrict/create'              ) ?: new AuthMenu(["code": "0202010602", parentMenu: _0202010600, url: '/locSubDistrict/create'              , title: 'Sub District - Create'    , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'   ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202010700 = AuthMenu.findByUrl('/#locMunicipality'                   ) ?: new AuthMenu(["code": "0202010700", parentMenu: _0202010000, url: '/#locMunicipality'                   , title: 'Municipality'             , sortOrder: 35, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'       ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010701 = AuthMenu.findByUrl('/locMunicipality/index'              ) ?: new AuthMenu(["code": "0202010701", parentMenu: _0202010700, url: '/locMunicipality/index'              , title: 'Municipality - List'      , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'   ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010702 = AuthMenu.findByUrl('/locMunicipality/create'             ) ?: new AuthMenu(["code": "0202010702", parentMenu: _0202010700, url: '/locMunicipality/create'             , title: 'Municipality - Create'    , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'   ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202010800 = AuthMenu.findByUrl('/#locUnionCouncil'                   ) ?: new AuthMenu(["code": "0202010800", parentMenu: _0202010000, url: '/#locUnionCouncil'                   , title: 'Union Council'            , sortOrder: 40, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'       ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010801 = AuthMenu.findByUrl('/locUnionCouncil/index'              ) ?: new AuthMenu(["code": "0202010801", parentMenu: _0202010800, url: '/locUnionCouncil/index'              , title: 'Union Council - List'     , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'   ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010802 = AuthMenu.findByUrl('/locUnionCouncil/create'             ) ?: new AuthMenu(["code": "0202010802", parentMenu: _0202010800, url: '/locUnionCouncil/create'             , title: 'Union Council - Create'   , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'   ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202010900 = AuthMenu.findByUrl('/#locWard'                           ) ?: new AuthMenu(["code": "0202010900", parentMenu: _0202010000, url: '/#locWard'                           , title: 'Ward'                     , sortOrder: 45, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'       ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010901 = AuthMenu.findByUrl('/locWard/index'                      ) ?: new AuthMenu(["code": "0202010901", parentMenu: _0202010900, url: '/locWard/index'                      , title: 'Ward - List'              , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'   ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202010902 = AuthMenu.findByUrl('/locWard/create'                     ) ?: new AuthMenu(["code": "0202010902", parentMenu: _0202010900, url: '/locWard/create'                     , title: 'Ward - Create'            , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'   ]).save(flush: true, failOnError: true, errors: true)

        //Menu : "/#administration"
        AuthMenu _0202020000 = AuthMenu.findByUrl('/#administration'                    ) ?: new AuthMenu(["code": "0202020000", parentMenu: _0202000000, url: '/#administration'                    , title: 'Administration'           , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-sliders text-warning'   ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202020100 = AuthMenu.findByUrl("/#comLookup"                         ) ?: new AuthMenu(["code": "0202020100", parentMenu: _0202020000, url: "/#comLookup"                         , title: "Lookup"                   , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020101 = AuthMenu.findByUrl("/comLookup/index"                    ) ?: new AuthMenu(["code": "0202020101", parentMenu: _0202020100, url: "/comLookup/index"                    , title: "Lookup - Index"           , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020102 = AuthMenu.findByUrl("/comLookup/create"                   ) ?: new AuthMenu(["code": "0202020102", parentMenu: _0202020100, url: "/comLookup/create"                   , title: "Lookup - Create"          , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202020200 = AuthMenu.findByUrl('/#admOrganization'                   ) ?: new AuthMenu(["code": "0202020200", parentMenu: _0202020000, url: '/#admOrganization'                   , title: 'Organization'             , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202020210 = AuthMenu.findByUrl('/#admVendorOrganization'             ) ?: new AuthMenu(["code": "0202020210", parentMenu: _0202020200, url: '/#admVendorOrganization'             , title: 'Vendor Organization'      , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020211 = AuthMenu.findByUrl('/admVendorOrganization/index'        ) ?: new AuthMenu(["code": "0202020211", parentMenu: _0202020210, url: '/admVendorOrganization/index'        , title: 'Vendor Org - List'        , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020212 = AuthMenu.findByUrl('/admVendorOrganization/create'       ) ?: new AuthMenu(["code": "0202020212", parentMenu: _0202020210, url: '/admVendorOrganization/create'       , title: 'Vendor Org - Create'      , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202020220 = AuthMenu.findByUrl('/#admClientOrganization'             ) ?: new AuthMenu(["code": "0202020220", parentMenu: _0202020200, url: '/#admClientOrganization'             , title: 'Client Organization'      , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020221 = AuthMenu.findByUrl('/admClientOrganization/index'        ) ?: new AuthMenu(["code": "0202020221", parentMenu: _0202020220, url: '/admClientOrganization/index'        , title: 'Client Org - List'        , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020222 = AuthMenu.findByUrl('/admClientOrganization/create'       ) ?: new AuthMenu(["code": "0202020222", parentMenu: _0202020220, url: '/admClientOrganization/create'       , title: 'Client Org - Create'      , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)


        AuthMenu _0202020300 = AuthMenu.findByUrl('/#admDepartment'                     ) ?: new AuthMenu(["code": "0202020300", parentMenu: _0202020000, url: '/#admDepartment'                     , title: 'Department'               , sortOrder: 15, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020301 = AuthMenu.findByUrl('/admDepartment/index'                ) ?: new AuthMenu(["code": "0202020301", parentMenu: _0202020300, url: '/admDepartment/index'                , title: 'Department - List'        , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020302 = AuthMenu.findByUrl('/admDepartment/create'               ) ?: new AuthMenu(["code": "0202020302", parentMenu: _0202020300, url: '/admDepartment/create'               , title: 'Department - Create'      , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202020400 = AuthMenu.findByUrl('/#admDesignation'                    ) ?: new AuthMenu(["code": "0202020400", parentMenu: _0202020000, url: '/#admDesignation'                    , title: 'Designation'              , sortOrder: 20, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020401 = AuthMenu.findByUrl('/admDesignation/index'               ) ?: new AuthMenu(["code": "0202020401", parentMenu: _0202020400, url: '/admDesignation/index'               , title: 'Designation - List'       , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020402 = AuthMenu.findByUrl('/admDesignation/create'              ) ?: new AuthMenu(["code": "0202020402", parentMenu: _0202020400, url: '/admDesignation/create'              , title: 'Designation - Create'     , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202020500 = AuthMenu.findByUrl('/#comUnitOfMeasurementCategory'      ) ?: new AuthMenu(["code": "0202020500", parentMenu: _0202020000, url: '/#comUnitOfMeasurementCategory'      , title: 'UOM Category'             , sortOrder: 25, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020501 = AuthMenu.findByUrl('/comUnitOfMeasurementCategory/index' ) ?: new AuthMenu(["code": "0202020501", parentMenu: _0202020500, url: '/comUnitOfMeasurementCategory/index' , title: 'UOM Category - List'      , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020502 = AuthMenu.findByUrl('/comUnitOfMeasurementCategory/create') ?: new AuthMenu(["code": "0202020502", parentMenu: _0202020500, url: '/comUnitOfMeasurementCategory/create', title: 'UOM Category - Create'    , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202020600 = AuthMenu.findByUrl('/#comUnitOfMeasurement'              ) ?: new AuthMenu(["code": "0202020600", parentMenu: _0202020000, url: '/#comUnitOfMeasurement'              , title: 'UOM'                      , sortOrder: 30, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020601 = AuthMenu.findByUrl('/comUnitOfMeasurement/index'         ) ?: new AuthMenu(["code": "0202020601", parentMenu: _0202020600, url: '/comUnitOfMeasurement/index'         , title: 'UOM - List'               , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020602 = AuthMenu.findByUrl('/comUnitOfMeasurement/create'        ) ?: new AuthMenu(["code": "0202020602", parentMenu: _0202020600, url: '/comUnitOfMeasurement/create'        , title: 'UOM - Create'             , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202020700 = AuthMenu.findByUrl('/#accCurrency'                       ) ?: new AuthMenu(["code": "0202020700", parentMenu: _0202020000, url: '/#accCurrency'                       , title: 'Currency'                 , sortOrder: 35, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020701 = AuthMenu.findByUrl('/accCurrency/index'                  ) ?: new AuthMenu(["code": "0202020701", parentMenu: _0202020700, url: '/accCurrency/index'                  , title: 'Currency - List'          , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202020702 = AuthMenu.findByUrl('/accCurrency/create'                 ) ?: new AuthMenu(["code": "0202020702", parentMenu: _0202020700, url: '/accCurrency/create'                 , title: 'Currency - Create'        , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        //Menu : "/#configuration"
        AuthMenu _0202030000 = AuthMenu.findByUrl('/#configuration'                     ) ?: new AuthMenu(["code": "0202030000", parentMenu: _0202000000, url: '/#configuration'                     , title: 'Configuration'            , sortOrder: 15, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-cogs text-warning'      ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202030100 = AuthMenu.findByUrl("/#hrEmployee"                        ) ?: new AuthMenu(["code": "0202030100", parentMenu: _0202030000, url: "/#hrEmployee"                        , title: "Employee"                 , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202030110 = AuthMenu.findByUrl('/#hrManagementStaff'                 ) ?: new AuthMenu(["code": "0202030110", parentMenu: _0202030100, url: '/#hrManagementStaff'                 , title: 'Mgt Staff'                , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202030111 = AuthMenu.findByUrl('/hrManagementStaff/index'            ) ?: new AuthMenu(["code": "0202030111", parentMenu: _0202030110, url: '/hrManagementStaff/index'            , title: 'Mgt Staff - List'         , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202030112 = AuthMenu.findByUrl('/hrManagementStaff/create'           ) ?: new AuthMenu(["code": "0202030112", parentMenu: _0202030110, url: '/hrManagementStaff/create'           , title: 'Mgt Staff - Create'       , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202030120 = AuthMenu.findByUrl('/#hrGeneralEmployee'                 ) ?: new AuthMenu(["code": "0202030120", parentMenu: _0202030100, url: '/#hrGeneralEmployee'                 , title: 'General Employee'         , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202030121 = AuthMenu.findByUrl('/hrGeneralEmployee/index'            ) ?: new AuthMenu(["code": "0202030121", parentMenu: _0202030120, url: '/hrGeneralEmployee/index'            , title: 'General Employee - List'  , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202030122 = AuthMenu.findByUrl('/hrGeneralEmployee/create'           ) ?: new AuthMenu(["code": "0202030122", parentMenu: _0202030120, url: '/hrGeneralEmployee/create'           , title: 'General Employee - Create', sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202030130 = AuthMenu.findByUrl('/#hrStaff'                           ) ?: new AuthMenu(["code": "0202030130", parentMenu: _0202030100, url: '/#hrStaff'                           , title: 'Staff'                    , sortOrder: 15, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202030131 = AuthMenu.findByUrl('/hrStaff/index'                      ) ?: new AuthMenu(["code": "0202030131", parentMenu: _0202030130, url: '/hrStaff/index'                      , title: 'Staff - List'             , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202030132 = AuthMenu.findByUrl('/hrStaff/create'                     ) ?: new AuthMenu(["code": "0202030132", parentMenu: _0202030130, url: '/hrStaff/create'                     , title: 'Staff - Create'           , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)


        AuthMenu _0202030200 = AuthMenu.findByUrl('/#accSupplier'                       ) ?: new AuthMenu(["code": "0202030200", parentMenu: _0202030000, url: '/#accSupplier'                       , title: 'Supplier'                 , sortOrder: 35, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202030201 = AuthMenu.findByUrl('/accSupplier/index'                  ) ?: new AuthMenu(["code": "0202030201", parentMenu: _0202030200, url: '/accSupplier/index'                  , title: 'Supplier - List'          , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202030202 = AuthMenu.findByUrl('/accSupplier/create'                 ) ?: new AuthMenu(["code": "0202030202", parentMenu: _0202030200, url: '/accSupplier/create'                 , title: 'Supplier - Create'        , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)

        AuthMenu _0202030300 = AuthMenu.findByUrl('/#admClient'                         ) ?: new AuthMenu(["code": "0202030300", parentMenu: _0202030000, url: '/#admClient'                         , title: 'Client'                   , sortOrder: 40, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-red'      ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202030301 = AuthMenu.findByUrl('/admClient/index'                    ) ?: new AuthMenu(["code": "0202030301", parentMenu: _0202030300, url: '/admClient/index'                    , title: 'Client - List'            , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0202030302 = AuthMenu.findByUrl('/admClient/create'                   ) ?: new AuthMenu(["code": "0202030302", parentMenu: _0202030300, url: '/admClient/create'                   , title: 'Client - Create'          , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)


        //AALAA - Report's
        AuthMenu _0901000000 = AuthMenu.findByUrl("/#rptReport"                         ) ?: new AuthMenu(["code": "0901000000", parentMenu:        null, url: "/#rptReport"                        , title: "Report"                   , sortOrder: 99, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-pie-chart'              ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0901010000 = AuthMenu.findByUrl("/rptReport/index"                    ) ?: new AuthMenu(["code": "0901010000", parentMenu: _0901000000, url: "/rptReport/index"                   , title: "Report - Index"           , sortOrder: 05, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-primary'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0901020000 = AuthMenu.findByUrl("/rptReport/create"                   ) ?: new AuthMenu(["code": "0901020000", parentMenu: _0901000000, url: "/rptReport/create"                  , title: "Report - Create"          , sortOrder: 10, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)
        AuthMenu _0901030000 = AuthMenu.findByUrl("/rptReport/download"                 ) ?: new AuthMenu(["code": "0901030000", parentMenu: _0901000000, url: "/rptReport/download"                , title: "Report - Download"        , sortOrder: 15, logCreatedBy: logCreatedBy, menuIcon: 'fa fa-circle-o text-success'  ]).save(flush: true, failOnError: true, errors: true)
    }

    private void aAuthRequestMap(){
        println "waltonAuthRequestMap"
        ArrayList waltonAuthRequestMapAalaaList = utilityService.getMapFromJson(new File(datasource + "AuthRequestMap.json")).get("jsonKey")
        for (Map m in waltonAuthRequestMapAalaaList) {
            m.logCreatedBy = logCreatedBy
            AuthRequestMap.findByUrl(m.url) ?: new AuthRequestMap(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aAuthRequestMapController(){
        println "waltonAuthRequestMapController "
        ArrayList waltonAuthRequestMapControllerList = utilityService.getMapFromJson(new File(datasource + "AuthRequestMapController.json")).get("jsonKey")
        for (Map m in waltonAuthRequestMapControllerList) {
            for (String method in ["/index", "/create", "/save", "/show/**", "/edit/**", "/update/**", "/delete/**"]) {
                AuthRequestMap.findByUrl("/" + m.controller + method) ?: new AuthRequestMap([configAttribute: m.configAttribute, url: "/" + m.controller + method, logCreatedBy: logCreatedBy]).save(flush: true, failOnError: true, errors: true)
            }
        }
    }


    private void aAdmVendorOrganization(){
        println "waltonAdmVendorOrganization"
        ArrayList waltonAuthLandingPageList = utilityService.getMapFromJson(new File(datasource + "AdmVendorOrganization.json")).get("jsonKey")
        for (Map m in waltonAuthLandingPageList) {
            m.logCreatedBy      = logCreatedBy
            m.establishmentDate = m.establishmentDate ? formatDtpDate.parse(m.establishmentDate) : null
            AdmVendorOrganization.findByCode(m.code) ?: new AdmVendorOrganization(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aAdmBranch(){
        println "waltonAdmBranch"
        ArrayList waltonAdmBranchList = utilityService.getMapFromJson(new File(datasource + "AdmBranch.json")).get("jsonKey")
        for (Map m in waltonAdmBranchList) {
            m.logCreatedBy          = logCreatedBy
            m.admVendorOrganization = AdmVendorOrganization.findByCode(m.admOrganization)
            AdmBranch.findByKeyword(m.keyword) ?: new AdmBranch(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aAuthUserLkBranch(){
        println "waltonAuthUserLkBranch"
        ArrayList authUserLkBranchList = utilityService.getMapFromJson(new File(datasource + "AuthUserLkBranch.json")).get("jsonKey")
        for (Map m in authUserLkBranchList) {
            m.authUser  = AuthUser.findByUsername(m.authUser)
            m.admBranch = AdmBranch.findByKeyword(m.admBranch)
            AuthUserLkBranch.findByAuthUserAndAdmBranch(m.authUser, m.admBranch) ?: new AuthUserLkBranch(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aAdmDepartment(){
        println "waltonAdmDepartment"
        ArrayList waltonAdmDepartmentList = utilityService.getMapFromJson(new File(datasource + "AdmDepartment.json")).get("jsonKey")
        for (Map m in waltonAdmDepartmentList) {
            m.admVendorOrganization = AdmVendorOrganization.findByCode(m.admVendorOrganization)
            m.logCreatedBy    = logCreatedBy
            m.remarks         = remarks
            AdmDepartment.findByAdmVendorOrganizationAndKeyword(m.admVendorOrganization, m.keyword) ?: new AdmDepartment(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aAdmDesignation(){
        println "waltonAdmDesignation"
        ArrayList waltonAdmDesignationList = utilityService.getMapFromJson(new File(datasource + "AdmDesignation.json")).get("jsonKey")
        for (Map m in waltonAdmDesignationList) {
            m.admVendorOrganization = AdmVendorOrganization.findByCode(m.admVendorOrganization)
            m.admDepartment         = AdmDepartment.findByAdmVendorOrganizationAndKeyword(m.admVendorOrganization, m.admDepartment)
            m.logCreatedBy          = logCreatedBy
            m.remarks               = remarks
            AdmDesignation.findByAdmVendorOrganizationAndAdmDepartmentAndKeyword(m.admVendorOrganization, m.admDepartment, m.keyword) ?: new AdmDesignation(m).save(flush: true, failOnError: true, errors: true)
        }
    }


    private void aComUnitOfMeasurementCategory(){
        println "waltonComUnitOfMeasurementCategory"
        ArrayList waltonComUnitOfMeasurementCategoryList = utilityService.getMapFromJson(new File(datasource + "ComUnitOfMeasurementCategory.json")).get("jsonKey")
        for (Map m in waltonComUnitOfMeasurementCategoryList) {
            m.admVendorOrganization = AdmVendorOrganization.findByCode(m.admVendorOrganization)
            m.logCreatedBy          = logCreatedBy
            m.remarks               = remarks
            ComUnitOfMeasurementCategory.findByAdmVendorOrganizationAndKeyword(m.admVendorOrganization, m.keyword) ?: new ComUnitOfMeasurementCategory(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aComUnitOfMeasurement(){
        println "waltonComUnitOfMeasurement"
        ArrayList waltonComUnitOfMeasurementList = utilityService.getMapFromJson(new File(datasource + "ComUnitOfMeasurement.json")).get("jsonKey")
        for (Map m in waltonComUnitOfMeasurementList) {
            m.measurementCategory = ComUnitOfMeasurementCategory.findByKeyword(m.measurementCategory)
            m.parent              = m.measurementCategory
            m.logCreatedBy        = logCreatedBy
            m.remarks             = remarks
            ComUnitOfMeasurement.findByMeasurementCategoryAndKeyword(m.measurementCategory , m.keyword) ?: new ComUnitOfMeasurement(m).save(flush: true, failOnError: true, errors: true)
        }
    }


    private void aRptReport(){
        println "waltonRptReport"
        ArrayList waltonRptReportList = utilityService.getMapFromJson(new File(datasource + "RptReport.json")).get("jsonKey")
        for (Map m in waltonRptReportList) {
            m.logCreatedBy  = logCreatedBy
            m.remarks       = remarks
            m.defaultFormat = ReportFormat.valueOf(m.defaultFormat)
            RptReport.findByCode(m.code) ?: new RptReport(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aRptParameter(){
        println "waltonRptParameter"
        ArrayList waltonRptParameterList = utilityService.getMapFromJson(new File(datasource + "RptParameter.json")).get("jsonKey")
        for (Map m in waltonRptParameterList) {
            m.version      = 0
            m.logCreatedBy = logCreatedBy
            m.parent       = RptParameter.findByKeyword(m.parent)
            RptParameter.findByKeyword(m.keyword) ?: new RptParameter(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aRptReportLkParam(){
        println "waltonRptReportLkParam"
        ArrayList waltonRptReportLkParamList = utilityService.getMapFromJson(new File(datasource + "RptReportLkParam.json")).get("jsonKey")
        for (Map m in waltonRptReportLkParamList) {
            m.rptReport    = RptReport.findByCode(m.rptReport)
            m.rptParameter = RptParameter.findByKeyword(m.rptParameter)
            m.dataType     = DataType.valueOf(m.dataType)
            m.queryType    = m.queryType ? QueryType.valueOf(m.queryType) : null
            RptReportLkParam.findByRptReportAndRptParameter(m.rptReport, m.rptParameter) ?: new RptReportLkParam(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aReportLkFormat(){
        println "waltonReportLkFormat"
        ArrayList waltonRptReportLkFormatList = utilityService.getMapFromJson(new File(datasource + "RptReportLkFormat.json")).get("jsonKey")
        for (Map m in waltonRptReportLkFormatList) {
            m.rptReport    = RptReport.findByCode(m.rptReport)
            m.reportFormat = ReportFormat.valueOf(m.reportFormat)
            RptReportLkFormat.findByRptReportAndReportFormat(m.rptReport, m.reportFormat) ?: new RptReportLkFormat(m).save(flush: true, failOnError: true, errors: true)
        }
    }

    private void aRptReportLkRole(){
        println "waltonRptReportLkRole"
        ArrayList waltonRptReportLkRoleList = utilityService.getMapFromJson(new File(datasource + "RptReportLkRole.json")).get("jsonKey")
        for (Map m in waltonRptReportLkRoleList) {
            m.rptReport = RptReport.findByCode(m.rptReport)
            m.authRole  = AuthRole.findAllByAuthority(m.authRole)
            RptReportLkRole.findByRptReportAndAuthRole(m.rptReport, m.authRole) ?: new RptReportLkRole(m).save(flush: true, failOnError: true, errors: true)
        }
    }
}
