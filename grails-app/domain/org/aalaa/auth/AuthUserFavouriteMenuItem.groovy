package org.aalaa.auth

class AuthUserFavouriteMenuItem implements Serializable {

    private static final long serialVersionUID = 1

    AuthUserProfile authUserProfile
    AuthMenu        authMenu

    String          code
    Byte            sortOrder

    static mapping = {
        version true
        cache   true
        table 'A_AUTH_USER_FVRT_MENU_ITEM'

        sort sortOrder: 'asc'
    }

    static constraints = {
        authUserProfile nullable: false, unique: ["authMenu"]
        authMenu        nullable: false, unique: ["authUserProfile"]
        code            nullable: false, unique: ["authUserProfile"], size: 1..30, matches: "[a-zA-Z0-9-.\\s]+"

        sortOrder       nullable: true
    }

    @Override
    String toString() {
        return authMenu
    }
}
