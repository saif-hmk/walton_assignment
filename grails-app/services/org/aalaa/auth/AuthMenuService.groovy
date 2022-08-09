/**
 * @Created_By : AALAA
 * @Date : 2015.09.11 11:20:10 AM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.auth

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.aalaa.sys.MenuType
import org.aalaa.util.UtilityService
import org.codehaus.groovy.grails.web.mapping.LinkGenerator

@Transactional
class AuthMenuService {

    public static final String SK_MAIN_MENU = "USER_MENU"
    LinkGenerator              grailsLinkGenerator
    SpringSecurityService      springSecurityService
    UtilityService             utilityService
    AuthUserService            authUserService

    List<MenuType> getMenuTypeList() {
        return MenuType*.name
    }

    MenuType getMenuType(String name) {
        return MenuType.valueOf(name)
    }

    def getMenu(MenuType menuType) {
        if (springSecurityService.isLoggedIn()) {
            if (utilityService.hasSessionAttribute(SK_MAIN_MENU)) {
                return utilityService.getSessionAttribute(SK_MAIN_MENU)
            } else {
                String menu = generateMenu(menuType)
                utilityService.setSessionAttribute(SK_MAIN_MENU, menu)
                return menu
            }
        } else {
            springSecurityService.clearCachedRequestmaps()
            utilityService.clearSession(SK_MAIN_MENU)
            return null
        }
    }

    AuthMenu getAuthMenu(String code) {
        AuthMenu authMenu = AuthUserFavouriteMenuItem.findByAuthUserProfileAndCode(AuthUserProfile.findByAuthUser(springSecurityService.getCurrentUser()), code)?.authMenu
        if(!authMenu){
            authMenu = AuthMenu.findByCode(code)
        }
        return authMenu
    }

    List<AuthMenu> getMainMenuList(Map params) {
        List<AuthMenu> menuList = AuthMenu.createCriteria().list {
            eq("isActive", true)
            if (params.parentMenu)
                eq("parentMenu", params.parentMenu)
            else
                isNull("parentMenu")
            if (params.menuType)
                eq("menuType", params.menuType)

            order('sortOrder', 'asc')
            order('title', 'asc')
        }
        return menuList
    }

    List<AuthMenu> getPermittedMenuList(List<AuthMenu> parentMenuList) {
        List<AuthMenu> authMenuList = new ArrayList<AuthMenu>()
        for (int i = 0; i < parentMenuList?.size(); i++) {
            AuthMenu parentMenu = parentMenuList?.get(i)
            //println ("" + parentMenuList?.get(i) + " - " + isPermittedUrl(parentMenuList?.get(i).url))
            if (authUserService.isPermittedUrl(parentMenu.url)) {
                if (parentMenu?.childMenu) {
                    parentMenu?.childMenu = getPermittedSubMenuList(parentMenu?.childMenu)
                }
                authMenuList?.add(parentMenu)
            }
        }
        //println menuList.url
        return authMenuList
    }

    List<AuthMenu> getPermittedSubMenuList(Set<AuthMenu> parentMenuList) {
        List<AuthMenu> authMenuList = new ArrayList<AuthMenu>()
        for (int i = 0; i < parentMenuList?.size(); i++) {
            AuthMenu parentMenu = parentMenuList[i]
            //println ("" + parentMenuList?.get(i) + " - " + isPermittedUrl(parentMenuList?.get(i).url))
            if (authUserService.isPermittedUrl(parentMenu.url)) {
                if (parentMenu?.childMenu) {
                    parentMenu?.childMenu = getPermittedSubMenuList(parentMenu?.childMenu)
                }
                authMenuList?.add(parentMenu)
            }
        }
        //println menuList.url
        return authMenuList
    }

    String generateMenu(MenuType menuType) {
        List<AuthMenu> permittedMenuList = getPermittedMenuList(getMainMenuList([menuType: menuType]))
        StringBuilder  sb                = new StringBuilder()
        try {
            if (permittedMenuList?.size() == 1 && permittedMenuList?.get(0)?.childMenu) {
                for (AuthMenu menuItem in permittedMenuList) {
                    sb.append("<li class='header'>${permittedMenuList?.get(0)?.title?.toUpperCase()}</li>")
                    sb.append(getChildMenuCustom(menuItem))
                }
            } else {
                sb.append("<ul class='sidebar-menu' data-widget='tree'>")
                for (AuthMenu menuItem in permittedMenuList) sb.append(getChildMenu(menuItem))
                sb.append("</ul>")
            }
        } catch (Exception e) {
            println "|Sorry, failed to generate user menu!\n|" + e.getMessage()
        }
        return sb.toString()
    }

    String getChildMenuCustom(AuthMenu menuItem) {
        StringBuilder menuString = new StringBuilder()
        for (AuthMenu cm in menuItem?.childMenu?.sort { it.sortOrder }) menuString.append(getChildMenu(cm))
        return menuString.toString()
    }

    String getChildMenu(AuthMenu menuItem) {
        StringBuilder menuString = new StringBuilder()
        String isOpenInNewTab = menuItem.isOpenNewTab ? " target='_blank'" : " target='_self'",
               href           = " href='" + (menuItem.isExternal ? menuItem?.url : grailsLinkGenerator.link(uri: menuItem?.url, absolute: false)) + "'",
               menuIcon       = menuItem?.menuIcon ?: "fa fa-circle-o",
               toolTip        = ""// = menuInstance.toolTip ? " data-toggle='tooltip' title='" + menuInstance.toolTip + "'" : ""
//                println "getCurrentUser : " + springSecurityService.getCurrentUser()
//                println "getCurrentUser.getAuthorities() : " + springSecurityService.getCurrentUser()?.getAuthorities()
//                println "URL : " + menuInstance?.url
//                println "getAuthentication : " + springSecurityService.getAuthentication()
//                println "Is Allowed : " + webInvocationPrivilegeEvaluator.isAllowed(menuInstance?.url, springSecurityService.getAuthentication())
//                public boolean isAllowed(String contextPath, final String uri, final String method, final Authentication authentication)
        if (menuIcon == "header")
            menuString.append("<li class='header'>" + menuItem.title + "</li>")
        else {
            if (menuItem?.childMenu) {
                menuString.append("<li class='treeview'><a " + href + isOpenInNewTab + toolTip + "><i class='" + menuIcon + "'></i><span>" + menuItem.title + "</span><span class='pull-right-container'><i class='fa fa-angle-left pull-right'></i></span></a><ul class='treeview-menu'>")
                for (AuthMenu cm in menuItem?.childMenu?.sort { it.sortOrder }) menuString.append(getChildMenu(cm))
                menuString.append("</ul></li>")
            } else menuString.append("<li><a " + href + isOpenInNewTab + toolTip + "><i class='" + menuIcon + "'></i> <span>" + menuItem.title + "</span></a></li>")
        }
        return menuString.toString()
    }

    def getMenuTree() {
        return getMenuTree(new ArrayList(), null, null)
    }

    def getMenuTree(List menuList, AuthMenu parentMenu, String menuPrefix) {
        List<AuthMenu> menuInstanceList = getMainMenuList([parentMenu: parentMenu])
        /*
        List<AuthMenu> menuInstanceList1 = AuthMenu.createCriteria().list {
            if (parentMenu)
                eq("parentMenu", parentMenu)
            else
                isNull("parentMenu")

            eq("isActive", true)

            order('sortOrder', 'asc')
            order('title', 'asc')
        }
        */
        if (menuInstanceList) {
            for (AuthMenu menuInstance in menuInstanceList) {
                String title = menuPrefix ? menuPrefix + " > " + menuInstance.title : menuInstance.title
                menuList.add([id: menuInstance.id, title: title])
                getMenuTree(menuList, menuInstance, title)
            }
        }
        return menuList
    }

    List<AuthMenu> getPermittedHierarchicalMenuList() {
        return getPermittedHierarchicalMenuList(springSecurityService.getCurrentUser())
    }

    List<AuthMenu> getPermittedHierarchicalMenuList(AuthUser authUser) {
        return getPermittedHierarchicalMenuList(new ArrayList(), null, null)
    }

    List<AuthMenu> getPermittedHierarchicalMenuList(List menuList, AuthMenu parentMenu, String menuPrefix) {
        List<AuthMenu> menuInstanceList  = getMainMenuList([parentMenu: parentMenu])
        if (menuInstanceList) {
            for (AuthMenu menuInstance in menuInstanceList) {
                if (authUserService.isPermittedUrl(menuInstance.url)) {
                    String title = menuPrefix ? menuPrefix + " > " + menuInstance.title : menuInstance.title
                    menuList.add([id: menuInstance.id, title: title, hasChild: menuInstance?.childMenu ? true : false, url: menuInstance.url])

                    if (menuInstance?.childMenu) {
                        getPermittedHierarchicalMenuList(menuList, menuInstance, title)
                    }
                }
            }
        }
        return menuList
    }
}