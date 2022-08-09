package org.aalaa.auth

import org.aalaa.sys.MenuType

class AuthMenu implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser logCreatedBy,
             logModifiedBy
    MenuType menuType        = MenuType.LEFT
    AuthMenu parentMenu

    String   url,
             code,
             title,
             toolTip,
             description,
             menuIcon        = "fa fa-circle-o"
    Integer  sortOrder
    Boolean  isActive        = true,
             isOpenNewTab    = false,
             isExternal      = false
    Date     logCreatedDate  = new Date(),
             logModifiedDate

    static hasMany = [childMenu: AuthMenu]

    static mapping = {
        version true
        table 'A_AUTH_MENU'
        //id generator: 'sequence', params: [sequence: 'S_A_AUTH_MENU']
        sort         sortOrder: "asc" // or "desc"
        //sort         title: "asc"   // or "desc"
        childMenu cascade: 'all'
    }

    static constraints = {
        title           nullable: false
        isExternal      nullable: false
        isOpenNewTab    nullable: false
        isActive        nullable: false
        url             nullable: false, unique : true
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false

        parentMenu      nullable: true
        toolTip         nullable: true
        sortOrder       nullable: true
        menuType        nullable: true
        code            nullable: true, size: 1..10, unique: true
        menuIcon        nullable: true, size: 1..50
        description     nullable: true, size: 1..250
        logModifiedBy   nullable: true, display: false
        logModifiedDate nullable: true, display: false
    }

    @Override
    String toString() {
        return title
    }
}
