package org.aalaa.com

import grails.transaction.Transactional
import org.aalaa.adm.AdmContentCategory
import org.aalaa.adm.AdmDepartment
import org.aalaa.adm.AdmDesignation
import org.aalaa.adm.AdmVendorOrganization
import org.aalaa.util.UtilityService

@Transactional
class ComLookupService {
    UtilityService utilityService

    ComLookup getLookup(String keyword) {
        return ComLookup.findByKeyword(keyword)
    }

    ComLookup getLookup(String parentKeyword, String keyword) {
        return ComLookup.findByParentAndKeyword(getLookup(parentKeyword), keyword)
    }

    AdmContentCategory getContentCategory(String keyword) {
        return AdmContentCategory.findByKeyword(keyword)
    }

    ComLookup getLookup(ComLookup parent, String keyword) {
        return ComLookup.findByParentAndKeyword(parent, keyword)
    }

    List<ComLookup> getLookupList(ComLookup parent) {
        return ComLookup.findAllByParent(parent)
    }

    List<ComLookup> getLookupList(ComLookup parent, String keyword) {
        return ComLookup.findAllByParentAndKeyword(parent, keyword)
    }

    List<ComLookup> getLookupList(String keyword) {
        return ComLookup.findAllByKeyword(keyword)
    }

    public <T extends Object> List filter(T, Map params){
        //refreshDependencies()

        String orderBy   = params.orderBy   ?: "id",
               direction = params.direction ?: "asc"
//        Map    fields    = utilityService.getFields(T)
//        Set    k         = fields.keySet()

        List<T> listOfTs = T.createCriteria().list(params) {
            /*
            if(rootUser || admin){
                if(rootUser){
                    if(params.comOrganization || params.comOrganizationId){
                        if(params.comOrganizationId){
                            eq("comOrganization", ComOrganization.get(params.comOrganizationId))
                        }
                        else if(params.comOrganization.getClass() == Class.forName("java.lang.Long") || params.comOrganization.getClass() == Class.forName("java.lang.String")){
                            eq("comOrganization", ComOrganization.get(params.comOrganization))
                        }
                        else{
                            eq("comOrganization", params.comOrganization)
                        }
                    }
                }
                else {
                    eq('comOrganization', currentUserOrg)
                }
                if(k.contains("comModule") && (params.comModule || params.comModuleId)){
                    if(params.comModuleId){
                        eq('comModule', ComModule.get(params.comModuleId))
                    }
                    else if(params.comModule.getClass() == Class.forName("java.lang.Long") || params.comModule.getClass() == Class.forName("java.lang.String")){
                        eq('comModule', ComModule.get(params.comModule))
                    }
                    else{
                        eq("comModule", params.comModule)
                    }
                }
                if(params.active)
                    eq("active", Boolean.valueOf(params.active))
            }
            else {
                eq('comOrganization', currentUserOrg)
                if(k.contains("comModule")) {
                    inList("comModule", currentUserModules)
                }
                if(k.contains("active")) {
                    eq("active", true)
                }
            }

            if(params.lookupGroup){
                eq("lookupGroup", params.lookupGroup)
            }
            if(params.parent){
                eq("parent", params.parent)
            }
            if(params.keyword){
                eq("code", params.keyword)
            }

            if(params.gender && k.contains("gender"))
                eq('gender', Gender.valueOf(params.gender))
            if(params.bloodGroup && k.contains("bloodGroup"))
                eq('bloodGroup', BloodGroup.valueOf(params.bloodGroup))

            if(params.religion)
                eq('religion', Religion.valueOf(params.religion))
            if(params.qualification)
                eq('qualification', Qualification.valueOf(params.qualification))
            if(params.eduGroup)
                eq('eduGroup', EduGroup.valueOf(params.eduGroup))
            if(params.comProfession)
                eq('comProfession', ComProfession.get(params.comProfession))
            if(params.approvalStage)
                eq('approvalStage', ApprovalStage.valueOf(params.approvalStage))
            if(params.accountStatus)
                eq('accountStatus', AccountStatus.valueOf(params.accountStatus))
            if(params.presentCountry)
                ilike('presentCountry', '%' + params.presentCountry + '%')
            if(params.registrationNo)
                ilike('registrationNo', '%' + params.registrationNo + '%')
            if(params.title){
                or{
                    ilike('title'      , '%' + params.title       + '%')
                    ilike('nameNative', '%' + params.nameNative + '%')
                    ilike('nameFather', '%' + params.nameFather + '%')
                    ilike('nameMother', '%' + params.nameMother + '%')
                    ilike('nameSpouse', '%' + params.nameSpouse + '%')
                }
            }
            if(params.phone){
                or{
                    ilike('phoneOne', '%' + params.phoneOne + '%')
                    ilike('phoneTwo', '%' + params.phoneTwo + '%')
                }
            }
            if(params.nIdOrBin)
                or{
                    ilike('nId', '%' + params.nId + '%')
                    ilike('bin', '%' + params.bin + '%')
                }
            if(params.email)
                ilike('email', '%' + params.email + '%')
            if(params.dob){
                ge('dob', dateParseFormat.parse(params.dob))
                lt('dob', dateParseFormat.parse(params.dob) + 1)
            }
            */

            order(orderBy, direction)
        }
        return listOfTs
    }

    String getDepartments(AdmVendorOrganization admVendorOrganization){
        return utilityService.generateDropDownList(AdmDepartment.findAllByAdmVendorOrganizationAndActive(admVendorOrganization, true), "id", "title")
    }

    String getDesignations(AdmVendorOrganization admVendorOrganization, AdmDepartment admDepartment){
        return utilityService.generateDropDownList(AdmDesignation.findAllByAdmVendorOrganizationAndAdmDepartmentAndActive(admVendorOrganization, admDepartment, true), "id", "title")
    }
}
