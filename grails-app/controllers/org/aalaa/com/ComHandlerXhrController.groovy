/**
 * @Created_By : AALAA
 * @Date : 2017.11.25 11:15:15 PM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.com

import grails.converters.JSON
import org.aalaa.auth.AuthMenuService
import org.aalaa.auth.AuthUserService

class ComHandlerXhrController {
    IoUtilService   ioUtilService
    AuthMenuService authMenuService
    AuthUserService authUserService
    CommonService   commonService

    def downloadDoc(String moduleName, String subModuleName, String fileName) {
        return ioUtilService.downloadDoc(moduleName, subModuleName, fileName, response)
    }

    String getAuthMenu() {
        if(request.xhr){
            try {
                render authMenuService.getAuthMenu(params.code) as JSON
            }
            catch (Exception e){
                render([url: null] as JSON)
            }
        }
    }

    def openSearchItemInNewTab() {
        if(request.xhr){
            render authUserService.getAuthUserProperty() as JSON
        }
    }

    String deleteIt() {
        if (request.xhr) {
            if (params.dn && params.id) { //dn = domainName
                render(commonService.deleteIt(params.dn, params.id) as JSON)
            }
        }
    }
}
