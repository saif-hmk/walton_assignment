/**
 * @Created_By : AALAA
 * @Date       : 2015.09.11 11:20:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.auth

import org.aalaa.sys.*

class AuthUserProperty implements Serializable {

    private static final long serialVersionUID = 1

    AuthUserProfile authUserProfile
    Availability    availability           = Availability.ONLINE
    FirstDayOfWeek  firstDayOfWeek         = FirstDayOfWeek.SATURDAY
    FormatDateLong  formatDateLong         = FormatDateLong.DDDD_MMMM_D_YYYY
    FormatDateShort formatDateShort        = FormatDateShort.YYYY_MM_DD
    FormatTimeLong  formatTimeLong         = FormatTimeLong.HH_MM_SS_TT
    FormatTimeShort formatTimeShort        = FormatTimeShort.H_MM_TT
    FormatNumber    formatNumber           = FormatNumber.INTERNATIONAL
    Local           local                  = Local.EN
    MenuType        menuType               = MenuType.LEFT
    SearchBoxMode   searchBoxMode          = SearchBoxMode.TOP
    Theme           theme                  = Theme.BLUE

    String          bodyClass              = "hold-transition skin-blue sidebar-collapse sidebar-mini",
                    remarks
    Boolean         isActive               = true,
                    openSearchItemInNewTab = true,
                    showFavouriteMenu      = true,
                    showMessage            = false,
                    showNotification       = false,
                    showSearchBar          = false,
                    showTaskList           = false,
                    sidebarExpandOnHover   = true

    static mapping = {
        version true
        cache   true
        table 'A_AUTH_USER_PROPERTY'
        //id generator: 'sequence', params: [sequence: 'S_A_AUTH_USER_PROPERTY']
    }

    static constraints = {
        availability            nullable: false//, inList: ['AWAY', 'BUSY', 'INVISIBLE', 'LEAVE', 'ONLINE']
        local                   nullable: false//, inList: ['EN', 'BN']
        menuType                nullable: false//, inList: ['NONE', 'LEFT', 'TOP_TREE', 'TOP_MEGA']
        isActive                nullable: false
        showMessage             nullable: false
        showNotification        nullable: false
        showTaskList            nullable: false
        showSearchBar           nullable: false
        searchBoxMode           nullable: false
        sidebarExpandOnHover    nullable: false
        openSearchItemInNewTab  nullable: false
        showFavouriteMenu       nullable: false
        formatNumber            nullable: false
        formatTimeShort         nullable: false
        formatTimeLong          nullable: false
        formatDateLong          nullable: false
        formatDateShort         nullable: false
        firstDayOfWeek          nullable: false
        theme                   nullable: false
        bodyClass               nullable: false
        authUserProfile         nullable: false, unique: true

        remarks                 nullable: true, size: 0..500
    }
}
