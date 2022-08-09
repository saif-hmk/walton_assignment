/**
 * @Created_By : AALAA
 * @Date       : 2015.09.11 11:20:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.aalaa.auth.AuthUser
import org.aalaa.auth.AuthUserLkRole
import org.aalaa.sys.SysConfigDomain
import org.aalaa.sys.SysDashboardComponentGroup

@Transactional
class CommonService {
    SpringSecurityService springSecurityService
    DbService             dbService

    Religion getReligion(String name) {
        Religion religion = null
        if (name)
            try {
                religion = Religion.valueOf(name)
            } catch (Exception e) {
                println "Exception ## CommonService.getReligion(String title) : " + e
            }
        return religion
    }

    List<Religion> getReligionList() {
        List<Religion> religionList = null
        religionList = Religion.values()*.value
        return religionList
    }

    ComLookup getLookup(String keyword) {
        return ComLookup.findByKeywordAndActive(keyword, true)
    }

    List<ComLookup> getLookupList() {
        return ComLookup.findAllByActive(true)
    }

    List<ComLookup> getLookupList(String parentKeyword) {
        return ComLookup.findAllByParentAndActive(ComLookup.findByKeyword(parentKeyword),true)
    }

    List<Map> getDashBoardComponentGroupList(){
        List l = new ArrayList()
        for (g in SysDashboardComponentGroup.findAllByActive(true).sort{it.sortOrder}){
            Map m = new LinkedHashMap()
            m.put("id"         , g.id         )
            m.put("parentId"   , g?.parent?.id)
            m.put("keyword"    , g.keyword    )
            m.put("title"      , g.title      )
            m.put("titleNative", g.titleNative)
            m.put("sortOrder"  , g.sortOrder  )
            l.add(m)
        }
        return l
    }

    Boolean isAuthorisedToDelete(SysConfigDomain sysConfigDomain, AuthUser authUser){
        Boolean isAuthorisedToDelete = false
        for (r in AuthUserLkRole.findAllByAuthUser(authUser)?.authRole?.authority){
            if(sysConfigDomain?.allowedRoles?.contains(r)){
                isAuthorisedToDelete = true
                break
            }
        }
        return isAuthorisedToDelete
    }

    Boolean isAuthorisedToDelete(SysConfigDomain sysConfigDomain){
        return isAuthorisedToDelete(sysConfigDomain, springSecurityService.getCurrentUser())
    }

    Map deleteIt(String domainName, String id) {
        Map<String, Object> m = new LinkedHashMap<String, Object>()
        String status = "DELETED", errorMessage = ""
        if (!springSecurityService.isLoggedIn()) {
            status = "SESSION_OUT"
            m.put("status", status)
            return m
        }
        SysConfigDomain sysConfigDomain = SysConfigDomain.findByNameDomain(domainName)
        if (!sysConfigDomain) {
            status = "NOT_CONFIGURED"
            m.put("status", status)
            return m
        }
        if (!isAuthorisedToDelete(sysConfigDomain)) {
            status = "NOT_AUTHORISED"
            m.put("status", status)
            return m
        }
        try {
            dbService.executeQuery("DELETE FROM ${sysConfigDomain?.nameTable} WHERE ID = ${id}")
            status = "SUCCESSFUL"
            m.put("status", status)
        }
        catch (Exception e) {
            status       = "FAILED"
            errorMessage = e?.getMessage()
            m.put("status"      , status)
            m.put("errorMessage", errorMessage)
            println "EX-DI-01-(${domainName}, ${id}) : " + e
        }
        //println "Response: " + (m as JSON)
        return m
    }
}
