/**
 * @Created_By : AALAA
 * @Date       : 2015.09.11 11:20:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.auth

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.aalaa.adm.AdmBranch
import org.aalaa.adm.AdmOrganization
import org.aalaa.hr.HrEmployee
import org.aalaa.sys.*
import org.codehaus.groovy.grails.commons.GrailsApplication
import org.springframework.security.web.access.WebInvocationPrivilegeEvaluator

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession

@Transactional
class AuthUserService {
    WebInvocationPrivilegeEvaluator webInvocationPrivilegeEvaluator
    GrailsApplication               grailsApplication
    SpringSecurityService           springSecurityService
    TrackerService                  trackerService
    DashboardService                dashboardService
    AuthMenuService                 authMenuService

    static AuthUser           currentUser            = null
    static Set<AuthRole>      authUserRoles          = null
    static AuthUserProfile    authUserProfile        = null
    static AuthUserProperty   authUserProperty       = null
    static AuthLandingPage    authLandingPage        = null
    static AdmOrganization    authUserOrganization   = null
    static AuthUserLkEmployee authUserLkEmployee     = null
    static List<AdmBranch>    authUserBranches       = null
    static Local              local                  = Local.EN
    static Theme              theme                  = Theme.BLUE
    static MenuType           menuType               = MenuType.LEFT
    static SearchBoxMode      searchBoxMode          = SearchBoxMode.TOP
    static Availability       availability           = Availability.ONLINE
    static FirstDayOfWeek     firstDayOfWeek         = FirstDayOfWeek.SATURDAY
    static FormatDateLong     formatDateLong         = FormatDateLong.DDDD_MMMM_D_YYYY
    static FormatDateShort    formatDateShort        = FormatDateShort.YYYY_MM_DD
    static FormatTimeLong     formatTimeLong         = FormatTimeLong.HH_MM_SS_TT
    static FormatTimeShort    formatTimeShort        = FormatTimeShort.H_MM_TT
    static FormatNumber       formatNumber           = FormatNumber.INTERNATIONAL
    static List               dbDataCount            = new ArrayList(),
                              dbDataChart            = new ArrayList(),
                              dbDataTabular          = new ArrayList(),
                              dbDataTabularCt        = new ArrayList()

    static String             authMenu               = "",
                              searchBoxOrientation   = "NONE",
                              bodyClass              = "hold-transition skin-blue sidebar-collapse sidebar-mini",
                              dbComponentCount       = null,
                              dbComponentChart       = null,
                              dbComponentTabular     = null,
                              dbComponentTabularCt   = null
    static Boolean            isActive               = true,
                              openSearchItemInNewTab = true,
                              showFavouriteMenu      = true,
                              showMessage            = false,
                              showNotification       = false,
                              showSearchBar          = false,
                              showTaskList           = false,
                              sidebarExpandOnHover   = true

    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    //  User, Role & Home/Landing Page
    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    static void setCurrentUser(AuthUser currentUser) {
        this.currentUser = currentUser
    }

    static AuthUser getCurrentUser() {
        return currentUser
    }

    static void setAuthUserRoles(Set<AuthRole> currentUserRoles) {
        this.authUserRoles = currentUserRoles
    }

    void setCurrentUserRoles() {
        setAuthUserRoles(getCurrentUser().authorities)
    }

    static Set<AuthRole> getAuthUserRoles() {
        return authUserRoles
    }

    static void setAuthLandingPage(AuthLandingPage currentUserHome) {
        this.authLandingPage = currentUserHome
    }

    AuthLandingPage setCurrentUserHome() {
        AuthUser                currentUser = getCurrentUser()
        LinkedHashSet<AuthRole> authRole    = getAuthUserRoles()
        if (!authRole) {
            println "EX-UserService.getCurrentUserHome() : Sorry you don't have any authorities (Role)...!"
            setAuthLandingPage(null)
        }
        List<AuthLandingPage> landingPageList = AuthLandingPage.createCriteria().list {
            eq("active", true)
            or {
                eq("authUser"    , currentUser)
                inList("authRole", authRole)
            }
            order("priority", "desc")
        }
        setAuthLandingPage(landingPageList ? landingPageList?.get(0) : null)
    }

    static AuthLandingPage getAuthLandingPage() {
        return authLandingPage
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    //  User Profile & Property
    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    static void setAuthUserProfile(AuthUserProfile authUserProfile) {
        this.authUserProfile = authUserProfile
    }

    void setAuthUserProfile() {
        setAuthUserProfile(AuthUserProfile.findByAuthUser(springSecurityService.getCurrentUser()))
    }

    static AuthUserProfile getAuthUserProfile() {
        return authUserProfile
    }

    static void setAuthUserProperty() {
        setAuthUserProperty(getAuthUserProfile()?.getAuthUserProperty())
    }

    static void setAuthUserProperty(AuthUserProperty authUserProperty) {
        this.authUserProperty = authUserProperty
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    //  AuthUser & Employee
    //----------------------------------------------------------------------------------------------------------------------------------------------------------

    static AuthUserLkEmployee getAuthUserLkEmployee() {
        return authUserLkEmployee
    }

    static AuthUserLkEmployee getAuthUserLkEmployee(AuthUser authUser) {
        return AuthUserLkEmployee.findByAuthUser(authUser)
    }

    void setAuthUserLkEmployee(AuthUserLkEmployee authUserLkEmployee) {
        this.authUserLkEmployee = authUserLkEmployee
    }

    void setAuthUserLkEmployee(AuthUser authUser) {
        this.authUserLkEmployee = AuthUserLkEmployee.findByAuthUser(authUser)
    }

    void setAuthUserLkEmployee(HrEmployee hrEmployee) {
        this.authUserLkEmployee = AuthUserLkEmployee.findByHrEmployee(hrEmployee)
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    //  User Organization & Branch
    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    static AdmOrganization getAuthUserOrganization() {
        return authUserOrganization
    }

    static void setAuthUserOrganization(List<AdmBranch> currentUserBranches) {
        if(currentUserBranches){
            this.authUserOrganization = currentUserBranches?.admVendorOrganization?.first()
        }
    }

    static List<AdmBranch> getUserBranches(AuthUser authUser){
        List<AdmBranch> currentUserBranches = null
        try {
            currentUserBranches = AuthUserLkBranch?.findAllByAuthUser(authUser)?.admBranch
        } catch (Exception e) {
            println e
        }
        return currentUserBranches;
    }

    List<AdmBranch> getCurrentUserBranches(){
        List<AdmBranch> currentUserBranches = null
        AuthUser user  = springSecurityService.getCurrentUser()
        String   roles = user?.authorities?.toString()
        try {
            if (roles.contains("DEVELOPER") || roles.contains("ADMIN") || roles.contains("MANAGEMENT")){
                currentUserBranches = AdmBranch?.findAllByActive(true)
            }
            else{
                currentUserBranches = AuthUserLkBranch?.findAllByAuthUser(user)?.admBranch
            }
        } catch (Exception e) {
            println e
        }
        return currentUserBranches.sort{it.sortOrder}
    }

    static void setAuthUserBranches(AuthUser authUser) {
        if(authUser) {
            this.authUserBranches = getUserBranches(authUser)
        }
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    //  User Menu
    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    String getAuthMenu() {
        return authMenu
    }

    void setAuthMenu(String authMenu) {
        this.authMenu = authMenu
    }

    void setAuthMenu(MenuType menuType) {
        this.authMenu = authMenuService.getMenu(menuType)?.toString()
    }

    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    //  User Search Box Mode
    //----------------------------------------------------------------------------------------------------------------------------------------------------------
    static void setSearchBoxOrientation(String searchBoxOrientation) {
        AuthUserService.searchBoxOrientation = searchBoxOrientation
    }

    String getSearchBoxOrientation(){
        return searchBoxOrientation
    }

    void setSearchBoxOrientation(){
        String searchBoxOrientation = "LEFT"
        if(!showSearchBar){
            searchBoxOrientation = "NONE"
        }
        else{
            String        menuType      = getMenuType().getKey()
            SearchBoxMode searchBoxMode = getSearchBoxMode()

            if(menuType == "NONE"){
                searchBoxOrientation = "TOP"
            }
            else if(menuType.contains("TOP") && searchBoxMode.equals(SearchBoxMode.TOP)){
                searchBoxOrientation = "TOP"
            }
            else if(menuType == "LEFT" && searchBoxMode.equals(SearchBoxMode.TOP)){
                searchBoxOrientation = "TOP"
            }
            else if(menuType == "LEFT" && searchBoxMode.equals(SearchBoxMode.LEFT)){
                searchBoxOrientation = "LEFT"
            }
            else if(menuType.contains("TOP") && searchBoxMode.equals(SearchBoxMode.LEFT)){
                searchBoxOrientation = "LEFT"
            }
        }
        this.searchBoxOrientation = searchBoxOrientation
    }
//----------------------------------------------------------------------------------------------------------------------------------------------------------
//  User XXX, XXX
//----------------------------------------------------------------------------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------------------------------------------------------------------------
    Availability getAvailability() {
        return availability
    }

    void setAvailability(Availability availability) {
        this.availability = availability
    }

    FirstDayOfWeek getFirstDayOfWeek() {
        return firstDayOfWeek
    }

    void setFirstDayOfWeek(FirstDayOfWeek firstDayOfWeek) {
        this.firstDayOfWeek = firstDayOfWeek
    }

    FormatDateLong getFormatDateLong() {
        return formatDateLong
    }

    void setFormatDateLong(FormatDateLong formatDateLong) {
        this.formatDateLong = formatDateLong
    }

    FormatDateShort getFormatDateShort() {
        return formatDateShort
    }

    void setFormatDateShort(FormatDateShort formatDateShort) {
        this.formatDateShort = formatDateShort
    }

    FormatTimeLong getFormatTimeLong() {
        return formatTimeLong
    }

    void setFormatTimeLong(FormatTimeLong formatTimeLong) {
        this.formatTimeLong = formatTimeLong
    }

    FormatTimeShort getFormatTimeShort() {
        return formatTimeShort
    }

    void setFormatTimeShort(FormatTimeShort formatTimeShort) {
        this.formatTimeShort = formatTimeShort
    }

    FormatNumber getFormatNumber() {
        return formatNumber
    }

    void setFormatNumber(FormatNumber formatNumber) {
        this.formatNumber = formatNumber
    }

    static void setLocal() {
        setLocal(authUserProperty?.local ?: Local.EN)
    }

    static void setLocal(Local local) {
        this.local = local
    }

    static Local getLocal() {
        return local
    }

    void setMenuType(MenuType menuType) {
        this.menuType = menuType
    }

    void setMenuType(AuthUserProperty authUserProperty) {
        setMenuType(authUserProperty.menuType)
    }

    MenuType getMenuType() {
        return menuType
    }

    void setSearchBoxMode(SearchBoxMode searchBoxMode) {
        this.searchBoxMode = searchBoxMode
    }

    void setSearchBoxMode(AuthUserProperty authUserProperty) {
        setMenuType(authUserProperty.searchBoxMode)
    }

    SearchBoxMode getSearchBoxMode() {
        return searchBoxMode
    }

    void setTheme(Theme theme) {
        this.theme = theme
    }

    Theme getTheme() {
        return theme
    }

    Theme getTheme(String themeName) {
        return Theme.valueOf(themeName)
    }

    void setBodyClass(String bodyClass) {
        this.bodyClass = bodyClass
    }

    void setBodyClass(AuthUserProperty authUserProperty) {
        setBodyClass(authUserProperty.bodyClass)
    }

    String getBodyClass() {
        return bodyClass
    }

    /**
     * @bodyClass = "hold-transition skin-blue sidebar-collapse sidebar-mini"
     **/
    String generateBodyClass(Theme theme, MenuType menuType) {
        String bodyClass = "hold-transition"
        bodyClass += " skin-" + theme?.key?.toLowerCase()
        if (menuType?.equals(MenuType.NONE)) {
            bodyClass += " layout-top-nav"
        } else if (menuType?.equals(MenuType.TOP_TREE) || menuType?.equals(MenuType.TOP_MEGA)) {
            bodyClass += " layout-top-nav"
        } else {    //LEFT
            bodyClass += " sidebar-collapse sidebar-mini"
        }
        return bodyClass
    }

    Boolean getIsActive() {
        return isActive
    }

    void setIsActive(Boolean isActive) {
        this.isActive = isActive
    }

    Boolean getOpenSearchItemInNewTab() {
        return openSearchItemInNewTab
    }

    void setOpenSearchItemInNewTab(Boolean openSearchItemInNewTab) {
        this.openSearchItemInNewTab = openSearchItemInNewTab
    }

    Boolean getShowFavouriteMenu() {
        return showFavouriteMenu
    }

    void setShowFavouriteMenu(Boolean showFavouriteMenu) {
        this.showFavouriteMenu = showFavouriteMenu
    }

    Boolean getShowMessage() {
        return showMessage
    }

    void setShowMessage(Boolean showMessage) {
        this.showMessage = showMessage
    }

    Boolean getShowNotification() {
        return showNotification
    }

    void setShowNotification(Boolean showNotification) {
        this.showNotification = showNotification
    }

    Boolean getShowSearchBar() {
        return showSearchBar
    }

    void setShowSearchBar(Boolean showSearchBar) {
        this.showSearchBar = showSearchBar
    }

    Boolean getShowTaskList() {
        return showTaskList
    }

    void setShowTaskList(Boolean showTaskList) {
        this.showTaskList = showTaskList
    }

    Boolean getSidebarExpandOnHover() {
        return sidebarExpandOnHover
    }

    void setSidebarExpandOnHover(Boolean sidebarExpandOnHover) {
        this.sidebarExpandOnHover = sidebarExpandOnHover
    }

    static void setUserLocalToSession(HttpSession session, String local) {
        try {
            session["org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE"] = new Locale(local)
        } catch (Exception e) {
            println "Exception -->>  AuthUserService.initializeUserProperty(HttpSession session)\n" + e
        }
    }

    static List getDbDataCount() {
        return dbDataCount
    }

    static void setDbDataCount(List dbDataCount) {
        this.dbDataCount = dbDataCount
    }

    static List getDbDataChart() {
        return dbDataChart
    }

    static void setDbDataChart(List dbDataChart) {
        this.dbDataChart = dbDataChart
    }

    static List getDbDataTabular() {
        return dbDataTabular
    }

    static void setDbDataTabular(List dbDataTabular) {
        this.dbDataTabular = dbDataTabular
    }

    static List getDbDataTabularCt() {
        return dbDataTabularCt
    }

    static void setDbDataTabularCt(List dbDataTabularCt) {
        this.dbDataTabularCt = dbDataTabularCt
    }

    static String getDbComponentCount() {
        return dbComponentCount
    }

    static void setDbComponentCount(String dbComponentCount) {
        this.dbComponentCount = dbComponentCount
    }

    static String getDbComponentChart() {
        return dbComponentChart
    }

    static void setDbComponentChart(String dbComponentChart) {
        this.dbComponentChart = dbComponentChart
    }

    static String getDbComponentTabular() {
        return dbComponentTabular
    }

    static void setDbComponentTabular(String dbComponentTabular) {
        this.dbComponentTabular = dbComponentTabular
    }

    static String getDbComponentTabularCt() {
        return dbComponentTabularCt
    }

    static void setDbComponentTabularCt(String dbComponentTabularCt) {
        this.dbComponentTabularCt = dbComponentTabularCt
    }

    Boolean isUserPropertyExist(HttpSession session) {
        return session.getAttribute("USER_PROPERTY_EXIST")
    }

    void initializeUserProperty(HttpSession session, HttpServletRequest request) {
        if(!isUserPropertyExist(session)){
            setCurrentUser(springSecurityService.getCurrentUser())
            setUserProperties(session)
        }
    }

    void setUserProperties(HttpSession session) {
        try {
            setCurrentUserRoles()
            setCurrentUserHome ()
            setAuthUserProfile ()
            setAuthUserProperty()
            setLocal           ()
            setAuthUserBranches(currentUser)
            setAuthUserLkEmployee(currentUser)
            setAuthUserOrganization(authUserBranches)

            setAuthUserProfile ()
            setAuthUserProperty()

            setAvailability           (authUserProperty.availability          )
            setBodyClass              (authUserProperty.bodyClass             )
            setFirstDayOfWeek         (authUserProperty.firstDayOfWeek        )
            setFormatDateLong         (authUserProperty.formatDateLong        )
            setFormatDateShort        (authUserProperty.formatDateShort       )
            setFormatNumber           (authUserProperty.formatNumber          )
            setFormatTimeLong         (authUserProperty.formatTimeLong        )
            setFormatTimeShort        (authUserProperty.formatTimeShort       )
            setIsActive               (authUserProperty.isActive              )
            setLocal                  (authUserProperty.local                 )
            setMenuType               (authUserProperty.menuType              )
            setAuthMenu               (menuType                               )
            setOpenSearchItemInNewTab (authUserProperty.openSearchItemInNewTab)
            setSearchBoxMode          (authUserProperty.searchBoxMode         )
            setShowFavouriteMenu      (authUserProperty.showFavouriteMenu     )
            setShowMessage            (authUserProperty.showMessage           )
            setShowNotification       (authUserProperty.showNotification      )
            setShowSearchBar          (authUserProperty.showSearchBar         )
            setShowTaskList           (authUserProperty.showTaskList          )
            setSidebarExpandOnHover   (authUserProperty.sidebarExpandOnHover  )
            setTheme                  (authUserProperty.theme                 )

            session.setAttribute("CURRENT_USER"                    , currentUser            )
            session.setAttribute("USER_ROLES"                      , authUserRoles          )
            session.setAttribute("USER_PROFILE"                    , authUserProfile        )
            session.setAttribute("USER_PROPERTY"                   , authUserProperty       )
            session.setAttribute("USER_LOCAL"                      , local                  )
            session.setAttribute("USER_HOME"                       , authLandingPage        )
            session.setAttribute("USER_ORGANIZATION"               , authUserOrganization   )
            session.setAttribute("USER_BRANCHES"                   , authUserBranches       )
            session.setAttribute("USER_EMPLOYEE"                   , authUserLkEmployee     )

            session.setAttribute("USER_AVAILABILITY"               , availability           )
            session.setAttribute("USER_BODY_CLASS"                 , bodyClass              )
            session.setAttribute("USER_FIRST_DAY_OF_WEEK"          , firstDayOfWeek         )
            session.setAttribute("USER_FORMAT_DATE_LONG"           , formatDateLong         )
            session.setAttribute("USER_FORMAT_DATE_SHORT"          , formatDateShort        )
            session.setAttribute("USER_FORMAT_NUMBER"              , formatNumber           )
            session.setAttribute("USER_FORMAT_TIME_LONG"           , formatTimeLong         )
            session.setAttribute("USER_FORMAT_TIME_SHORT"          , formatTimeShort        )
            session.setAttribute("USER_IS_ACTIVE"                  , isActive               )
            session.setAttribute("USER_MENU_TYPE"                  , menuType               )
            session.setAttribute("USER_MENU"                       , authMenu               )
            session.setAttribute("USER_OPEN_SEARCH_ITEM_IN_NEW_TAB", openSearchItemInNewTab )
            session.setAttribute("USER_SEARCH_BOX_MODE"            , searchBoxMode          )
            session.setAttribute("USER_SHOW_FAVOURITE_MENU"        , showFavouriteMenu      )
            session.setAttribute("USER_SHOW_SEARCH_BAR"            , showSearchBar          )
            session.setAttribute("USER_SHOW_MESSAGE"               , showMessage            )
            session.setAttribute("USER_SHOW_NOTIFICATION"          , showNotification       )
            session.setAttribute("USER_SHOW_TASK_LIST"             , showTaskList           )
            session.setAttribute("USER_SIDEBAR_EXPAND_ON_HOVER"    , sidebarExpandOnHover   )
            session.setAttribute("USER_THEME"                      , theme                  )

            println "\n---------------------------------------------------------------------------"
            println "|SESSION_STARTED_AT: " + new Date()
            println "|CURRENT_USER      : " + currentUser     + " (" + currentUser?.id + ")"
            println "|USER_ROLES        : " + session.getAttribute("USER_ROLES"        )
            println "|USER_PROFILE_ID   : " + (session.getAttribute("USER_PROFILE"     )?.id ?: "Not yet assigned!")
            println "|USER_PROPERTY_ID  : " + (session.getAttribute("USER_PROPERTY"    )?.id ?: "Not yet assigned!")
            println "|USER_LOCAL        : " + session.getAttribute("USER_LOCAL"        )
            println "|USER_HOME         : " + session.getAttribute("USER_HOME"         )
            println "|USER_ORGANIZATION : " + (session.getAttribute("USER_ORGANIZATION") ?: "Not yet assigned!")
            println "|USER_BRANCHES     : " + (session.getAttribute("USER_BRANCHES"    )?.titleShort ?: "Not yet assigned!")
            println "|USER_EMPLOYEE     : " + (session.getAttribute("USER_EMPLOYEE"    )?.hrEmployee?.code ?: "Not yet assigned!")
            println "---------------------------------------------------------------------------\n"

            setUserLocalToSession(session, local.value);

            session.setAttribute("USER_PROPERTY_EXIST", true)
        } catch (Exception e) {
            println "|Sorry, failed to initialize user properties!\n|" + e.getMessage()
        }
    }

    void resetPassword(AuthUser user, String password) {
        AuthUser currentUser = springSecurityService.getCurrentUser()
        String   hdCode      = trackerService.getHdCode(password ?: "aalaa")
        if (user) {
            user.password        = password ?: "aalaa"
            user.hdCode          = hdCode
            user.logModifiedBy   = currentUser
            user.logModifiedDate = new Date()
            user.save()
        }
    }

    void resetPassword(List<AuthUser> authUserList, String password){
        AuthUser currentUser = springSecurityService.getCurrentUser()
        String hdCode        = trackerService.getHdCode(password ?: "aalaa")
        for (u in authUserList){
            u.password        = password ?: "aalaa"
            u.hdCode          = hdCode
            u.logModifiedBy   = currentUser
            u.logModifiedDate = new Date()
            u.save()
        }
    }

    void resetAllPassword(String password){
        AuthUser currentUser = springSecurityService.getCurrentUser()
        String hdCode        = trackerService.getHdCode(password ?: "aalaa")
        List<AuthUser> authUserList = AuthUser.list()
        for (u in authUserList){
            u.password        = password ?: "aalaa"
            u.hdCode          = hdCode
            u.logModifiedBy   = currentUser
            u.logModifiedDate = new Date()
            u.save()
        }
    }

    String getAvaterSource() {
        AuthUser authUser = springSecurityService.getCurrentUser()
        String usersAvaterSource = ""
        try {
            //todo: validate.
            usersAvaterSource = springSecurityService?.currentUser?.username == "hmk" ? "resources/images/user/saif_khan.jpg" : "resources/images/user/user.jpg"
        } catch (Exception e) {
            println "Exception -->>  AuthUserService.getAvaterSource()\n" + e
        }
    }

    Boolean isPermittedUrl(String url){
        Boolean isPermitted = false
        if (grailsApplication.config.grails.plugin.springsecurity.active == true && webInvocationPrivilegeEvaluator.isAllowed(url, springSecurityService.getAuthentication())){
            isPermitted = true
        }
        return isPermitted
    }
}
