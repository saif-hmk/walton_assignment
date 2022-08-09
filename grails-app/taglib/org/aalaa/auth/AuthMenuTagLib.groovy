package org.aalaa.auth

class AuthMenuTagLib {
    AuthMenuService authMenuService
    static namespace = "menu"
    def loadMenu = { m ->
        out << authMenuService.getMenu(m.type)
    }
}
