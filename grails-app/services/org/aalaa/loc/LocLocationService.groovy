/**
 * @Created_By : AALAA
 * @Date       : 2015.09.11 11:20:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.loc

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.aalaa.auth.AuthUser
import org.aalaa.auth.AuthUserLkLoc
import org.aalaa.util.UtilityService
import org.codehaus.groovy.grails.web.util.WebUtils

import javax.servlet.http.HttpSession

@Transactional
class LocLocationService {
    SpringSecurityService springSecurityService
    UtilityService utilityService
    Date                       currentDate
    AuthUser currentUser
    public static final String SK_LAH       = "LAH",
                               SK_SP        = "SEARCH_PERMISSION"

    public beforeInterceptor = {
        currentDate = new Date()
    }

    String getLah(){
        currentUser = springSecurityService.getCurrentUser()
        if (!currentUser) {
            return ""
        }
        String lah = "",
               //locAdmAreaType = utilityService.getCsvFromArrayList(getCurrentUserLocationTypeList()?.key),
               locAdmAreaType = "COUNTRY"
        if (locAdmAreaType) {
            if (locAdmAreaType.contains(LocAdmAreaType.WARD?.key?.toString())) {
                lah = "WARD"
            } else if (locAdmAreaType.contains(LocAdmAreaType.UNION_COUNCIL?.key?.toString())) {
                lah = "WARD_UNION_COUNCIL"
            } else if (locAdmAreaType.contains(LocAdmAreaType.MUNICIPALITY?.key?.toString())) {
                lah = "WARD_MUNICIPALITY"
            } else if (locAdmAreaType.contains(LocAdmAreaType.SUB_DISTRICT?.key?.toString())) {
                lah = "WARD_UNION_COUNCIL_MUNICIPALITY_SUB_DISTRICT"
            } else if (locAdmAreaType.contains(LocAdmAreaType.DISTRICT?.key?.toString())) {
                lah = "WARD_UNION_COUNCIL_MUNICIPALITY_SUB_DISTRICT_DISTRICT"
            } else if (locAdmAreaType.contains(LocAdmAreaType.CITY_CORPORATION?.key?.toString())) {
                lah = "WARD_UNION_COUNCIL_MUNICIPALITY_SUB_DISTRICT_DISTRICT_CITY_CORPORATION"
            } else if (locAdmAreaType.contains(LocAdmAreaType.DIVISION?.key?.toString())) {
                lah = "WARD_UNION_COUNCIL_MUNICIPALITY_SUB_DISTRICT_DISTRICT_CITY_CORPORATION_DIVISION"
            } else if (locAdmAreaType.contains(LocAdmAreaType.PROVINCE_STATE?.key?.toString())) {
                lah = "WARD_UNION_COUNCIL_MUNICIPALITY_SUB_DISTRICT_DISTRICT_CITY_CORPORATION_DIVISION_PROVINCE_STATE"
            } else if (locAdmAreaType.contains(LocAdmAreaType.COUNTRY?.key?.toString())) {
                lah = "WARD_UNION_COUNCIL_MUNICIPALITY_SUB_DISTRICT_DISTRICT_CITY_CORPORATION_DIVISION_PROVINCE_STATE_COUNTRY"
            } else if (locAdmAreaType.contains(LocAdmAreaType.CONTINENT?.key?.toString())) {
                lah = "WARD_UNION_COUNCIL_MUNICIPALITY_SUB_DISTRICT_DISTRICT_CITY_CORPORATION_DIVISION_PROVINCE_STATE_COUNTRY_CONTINENT"
            } else if (locAdmAreaType.contains(LocAdmAreaType.WORLD?.key?.toString())) {
                lah = "WARD_UNION_COUNCIL_MUNICIPALITY_SUB_DISTRICT_DISTRICT_CITY_CORPORATION_DIVISION_PROVINCE_STATE_COUNTRY_CONTINENT_WORLD"
            }
        }
        return lah
    }

    String getLocationAccessibilityHierarchy() {
        HttpSession session = WebUtils.retrieveGrailsWebRequest().getSession()
        String lah = null
        if(session.getAttribute(SK_LAH)){
            lah = session.getAttribute(SK_LAH)
        }
        else{
            lah = getLah()
            session.setAttribute(SK_LAH, lah)
        }
        return lah
    }

    String removeLocationFromAccessibilityHierarchy(String locAdmAreaType) {
        String lah = getLocationAccessibilityHierarchy()
        !lah.contains(locAdmAreaType) ?: (lah = lah.replace(locAdmAreaType, ""))
        return lah
    }

    List<AuthUserLkLoc> getUserLkLocList() {
        currentUser = springSecurityService.getCurrentUser()
        if (!currentUser) return null
        List<AuthUserLkLoc> userLkLocList = AuthUserLkLoc.createCriteria().list {
            eq("locationId", LocCountry.findByCode("BGD")?.id)
            eq("isActive"  , true)
        }
        return userLkLocList
    }

    @Deprecated
    List<AuthUserLkLoc> getUserLkLocListOld() {
        currentUser = springSecurityService.getCurrentUser()
        if (!currentUser) return null
        List<AuthUserLkLoc> userLkLocList = AuthUserLkLoc.createCriteria().list {
            eq("authUser", currentUser)
            eq("isActive", true)
        }
        return userLkLocList
    }

    LocLocation getLocLocation(Map params) {
        LocLocation locLocation = null
             if(params.locWard           ) locLocation = getLocLocation(params.locWard           )
        else if(params.locUnionCouncil   ) locLocation = getLocLocation(params.locUnionCouncil   )
        else if(params.locMunicipality   ) locLocation = getLocLocation(params.locMunicipality   )
        else if(params.locSubDistrict    ) locLocation = getLocLocation(params.locSubDistrict    )
        else if(params.locDistrict       ) locLocation = getLocLocation(params.locDistrict       )
        else if(params.locCityCorporation) locLocation = getLocLocation(params.locCityCorporation)
        else if(params.locDivision       ) locLocation = getLocLocation(params.locDivision       )
        else if(params.locProvinceState  ) locLocation = getLocLocation(params.locProvinceState  )
        else if(params.locCountry        ) locLocation = getLocLocation(params.locCountry        )
        else if(params.locContinent      ) locLocation = getLocLocation(params.locContinent      )
        else
            locLocation = getCurrentUserLocationList() ? getCurrentUserLocationList()[0] : null
        return locLocation
    }

    LocLocation getCurrentUserLocation() {
        return (LocLocation) LocCountry.findByCode("BGD")
    }

    @Deprecated
    LocLocation getCurrentUserLocationOld() {
        return getCurrentUserLocationList() ? getCurrentUserLocationList()[0] : null
    }

    List<LocLocation> getCurrentUserLocationList() {
        List<LocLocation> locationList = new ArrayList()
        locationList.add(LocCountry.findByCode("BGD"))
        return locationList
    }

    @Deprecated
    List<LocLocation> getCurrentUserLocationListOld() {
        return getUserLkLocList()?.locLocation
    }

    List<LocLocation> getPermittedLocationList() {
        List<LocLocation> locLocationList = LocLocation.createCriteria().list {
            eq("isActive", true)
            if (getCurrentUserLocationList()) {
                or {
                    inList("id", getCurrentUserLocationList()?.id)
                    inList("parent", getCurrentUserLocationList())
                }
            }
            order("name", "asc")
        }
        return locLocationList
    }

    List<LocLocation> getLocationList(LocAdmAreaType locAdmAreaType) {
        List<LocLocation> locationList = LocLocation.createCriteria().list {
            eq("locAdmAreaType", locAdmAreaType)
            inList("id", getPermittedLocationList()?.id)
            order("name", "asc")
        }
        return locationList
    }

    List<LocLocation> getLocationList(LocAdmAreaType locAdmAreaType, LocLocation parent) {
        List<LocLocation> locationList = LocLocation.createCriteria().list {
            eq("locAdmAreaType", locAdmAreaType)
            eq("parent", parent)
            order("name", "asc")
        }
        return locationList
    }

    List<LocLocation> getLocationList(LocLocation parent) {
        List<LocLocation> locationList = LocLocation.createCriteria().list {
            eq("parent", parent)
            order("name", "asc")
        }
        return locationList
    }

    List<LocLocation> getCountryList() {
        return LocCountry.createCriteria().list {
            eq("isActive", true)
            order("name", "asc")
        }
    }

    List<LocLocation> getProvinceStateList() {
        return LocProvinceState.createCriteria().list {
            eq("isActive", true)
            order("name", "asc")
        }
    }

    List<LocLocation> getDivisionList() {
        return LocDivision.createCriteria().list {
            eq("isActive", true)
            order("name", "asc")
        }
    }

    List<LocLocation> getDistrictList() {
        return LocDistrict.createCriteria().list {
            eq("isActive", true)
            order("name", "asc")
        }
    }

    List<LocLocation> getCityCorporationList() {
        return LocCityCorporation.createCriteria().list {
            eq("isActive", true)
            order("name", "asc")
        }
    }

    List<LocLocation> getSubDistrictList() {
        return LocSubDistrict.createCriteria().list {
            eq("isActive", true)
            order("name", "asc")
        }
    }

    List<LocLocation> getMunicipalityList() {
        return LocMunicipality.createCriteria().list {
            eq("isActive", true)
            order("name", "asc")
        }
    }

    List<LocLocation> getUnionCouncilList() {
        return LocUnionCouncil.createCriteria().list {
            eq("isActive", true)
            order("name", "asc")
        }
    }

    List<LocLocation> getWardList() {
        return LocWard.createCriteria().list {
            eq("isActive", true)
            order("name", "asc")
        }
    }

    List<LocLocation> getDivisionList(LocLocation locCountry) {
        return getLocationList(LocAdmAreaType.DIVISION, locCountry)
    }

    List<LocLocation> getProvinceStateList(LocLocation locLocation) {
        return getLocationList(LocAdmAreaType.PROVINCE_STATE, locLocation)
    }

    List<LocLocation> getDistrictList(LocLocation locDivision) {
        return getLocationList(LocAdmAreaType.DISTRICT, locDivision)
    }

    List<LocLocation> getSubDistrictList(LocLocation locDistrict) {
        return getLocationList(LocAdmAreaType.SUB_DISTRICT, locDistrict)
    }

    List<LocLocation> getUnionParishadList(LocLocation locSubDistrict) {
        return getLocationList(LocAdmAreaType.UNION_COUNCIL, locSubDistrict)
    }

    List<LocLocation> getWardList(LocLocation locUnionCouncil) {
        return getLocationList(LocAdmAreaType.WARD, locUnionCouncil)
    }

    List<LocLocation> getLocationList(Map params) {
        List<LocLocation> locationList = new ArrayList()
        if(params.locUnionCouncil){
            locationList = getWardList(LocLocation.get(params.locUnionCouncil))
        }
        else if(params.locSubDistrict){
            locationList = getUnionParishadList(LocLocation.get(params.locSubDistrict))
        }
        else if(params.locDistrict){
            locationList = getSubDistrictList(LocLocation.get(params.locDistrict))
        }
        else if(params.locDivision){
            locationList = getDistrictList(LocLocation.get(params.locDivision))
        }
        else{
            locationList = getDivisionList()
        }
        return locationList
    }

    String getOptions(LocAdmAreaType locAdmAreaType, def parentId) {
        return utilityService.generateDropDownList(getLocationList(locAdmAreaType, getLocLocation(parentId)), "id", "name")
    }

    String getOptions(def parentId) {
        return utilityService.generateDropDownList(getLocationList(getLocLocation(parentId)), "id", "name")
    }

    String getDistrictOptionsForDdl(String locDivision) {
        return utilityService.generateDropDownList(getLocationList(LocAdmAreaType.DISTRICT, getLocLocation(locDivision)), "id", "name")
    }

    String getUpazilaOptionsForDdl(String locDistrict) {
        return utilityService.generateDropDownList(getLocationList(LocAdmAreaType.SUB_DISTRICT, getLocLocation(locDistrict)), "id", "name")
    }

    String getUnionParishadOptionsForDdl(String locSubDistrict) {
        return utilityService.generateDropDownList(getLocationList(LocAdmAreaType.UNION_COUNCIL, getLocLocation(locSubDistrict)), "id", "name")
    }

    String getWardOptionsForDdl(String locUnionCouncil) {
        return utilityService.generateDropDownList(getLocationList(LocAdmAreaType.WARD, getLocLocation(locUnionCouncil)), "id", "name")
    }

    List<LocAdmAreaType> getLocationTypeList() {
        return LocAdmAreaType.findAll()
    }

    LocAdmAreaType getLocationType(String name) {
        return LocAdmAreaType.valueOf(name)
    }

    LocLocation getLocLocation(String locationId) {
        LocLocation location = null
        if (locationId)
            try {
                location = LocLocation.get(Long.valueOf(locationId))
            } catch (Exception e) {
                println "Exception : " + e
            }
        return location
    }

    LocLocation getLocLocation(Long locationId) {
        LocLocation location = null
        if (locationId)
            try {
                location = LocLocation.get(locationId)
            } catch (Exception e) {
                println "Exception : " + e
            }
        return location
    }

    LocLocation getCountry() {
        LocLocation locLocation = null
        try {
            locLocation = LocLocation.findByLocAdmAreaType(LocAdmAreaType.COUNTRY.key)
        } catch (Exception e) {
            println "Exception : " + e
        }
        return locLocation
    }

    List getLocationAsList(LocLocation locLocation){
        List<LocLocation> locLocationList = new ArrayList()
        if (locLocation) locLocationList = LocLocation.findAllById(locLocation?.id)
        return locLocationList
    }

    List getLocationSiblings(LocLocation locLocation){
        List<LocLocation> locLocationList = new ArrayList()
        if (locLocation)  locLocationList = getChildLocationList(locLocation?.parent)
        return locLocationList
    }

    List getChildLocationList(LocLocation parent) {
        return LocLocation.findAllByParent(parent)
    }

    Map getSelectedLocations(Map params) throws Exception {
        Map<String, LocLocation> selectedLocations = new LinkedHashMap()
        Map parents   = getParents(getLocLocation(params))
        if (parents?.locContinent     || params?.locContinent    ) selectedLocations.put('locContinent'    , parents?.locContinent      ?: getLocLocation(params.locContinent       ))
        if (parents?.locCountry       || params?.locCountry      ) selectedLocations.put('locCountry'      , parents?.locCountry        ?: getLocLocation(params.locCountry         ))
        if (parents?.locProvinceState || params?.locProvinceState) selectedLocations.put('locProvinceState', parents?.locProvinceState  ?: getLocLocation(params.locProvinceState   ))
        if (parents?.locDivision      || params?.locDivision     ) selectedLocations.put('locDivision'     , parents?.locDivision       ?: getLocLocation(params.locDivision        ))
        if (parents?.locDistrict      || params?.locDistrict     ) selectedLocations.put('locDistrict'     , parents?.locDistrict       ?: getLocLocation(params.locDistrict        ))
        if (parents?.locSubDistrict   || params?.locSubDistrict  ) selectedLocations.put('locSubDistrict'  , parents?.locSubDistrict    ?: getLocLocation(params.locSubDistrict     ))
        if (parents?.locMunicipality  || params?.locMunicipality ) selectedLocations.put('locMunicipality' , parents?.locMunicipality   ?: getLocLocation(params.locMunicipality    ))
        if (parents?.locUnionCouncil  || params?.locUnionCouncil ) selectedLocations.put('locUnionCouncil' , parents?.locUnionCouncil   ?: getLocLocation(params.locUnionCouncil    ))
        if (parents?.locWard          || params?.locWard         ) selectedLocations.put('locWard'         , parents?.locWard           ?: getLocLocation(params.locWard            ))
        return selectedLocations
    }

    Map getSearchPermission() throws Exception {
        HttpSession session = WebUtils.retrieveGrailsWebRequest().getSession()
        Map<String, Integer> permission = null
        if(session.getAttribute(SK_SP)){
            permission = session.getAttribute(SK_SP)
        }
        else{
            permission = getSearchPermission(getCurrentUserLocation())
            session.setAttribute(SK_SP, permission)
        }
        return permission
    }

    Map getSearchPermission(LocLocation locLocation) throws Exception {
        Map<String, Integer> permission = new LinkedHashMap()
        if (locLocation) {
            if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.COUNTRY)) {
                permission.put("locCountry"        , 1)
                permission.put("locProvinceState"  , 0)
                permission.put("locDivision"       , 0)
                permission.put("locDistrict"       , 0)
                permission.put("locCityCorporation", 0)
                permission.put("locSubDistrict"    , 0)
                permission.put("locMunicipality"   , 0)
                permission.put("locUnionCouncil"   , 0)
                permission.put("locWard"           , 0)
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.PROVINCE_STATE)) {
                permission.put("locCountry"        , 1)
                permission.put("locProvinceState"  , 1)
                permission.put("locDivision"       , 0)
                permission.put("locDistrict"       , 0)
                permission.put("locCityCorporation", 0)
                permission.put("locSubDistrict"    , 0)
                permission.put("locMunicipality"   , 0)
                permission.put("locUnionCouncil"   , 0)
                permission.put("locWard"           , 0)
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.DIVISION)) {
                permission.put("locCountry"        , 1)
                permission.put("locProvinceState"  , 1)
                permission.put("locDivision"       , 1)
                permission.put("locDistrict"       , 0)
                permission.put("locCityCorporation", 0)
                permission.put("locSubDistrict"    , 0)
                permission.put("locMunicipality"   , 0)
                permission.put("locUnionCouncil"   , 0)
                permission.put("locWard"           , 0)
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.DISTRICT)) {
                permission.put("locCountry"        , 1)
                permission.put("locProvinceState"  , 1)
                permission.put("locDivision"       , 1)
                permission.put("locDistrict"       , 1)
                permission.put("locCityCorporation", 0)
                permission.put("locSubDistrict"    , 0)
                permission.put("locMunicipality"   , 0)
                permission.put("locUnionCouncil"   , 0)
                permission.put("locWard"           , 0)
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.SUB_DISTRICT)) {
                permission.put("locCountry"        , 1)
                permission.put("locProvinceState"  , 1)
                permission.put("locDivision"       , 1)
                permission.put("locDistrict"       , 1)
                permission.put("locCityCorporation", 1)
                permission.put("locSubDistrict"    , 1)
                permission.put("locMunicipality"   , 0)
                permission.put("locUnionCouncil"   , 0)
                permission.put("locWard"           , 0)
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.MUNICIPALITY)) {
                permission.put("locCountry"        , 1)
                permission.put("locProvinceState"  , 1)
                permission.put("locDivision"       , 1)
                permission.put("locDistrict"       , 1)
                permission.put("locCityCorporation", 1)
                permission.put("locSubDistrict"    , 1)
                permission.put("locMunicipality"   , 1)
                permission.put("locUnionCouncil"   , 0)
                permission.put("locWard"           , 0)
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.UNION_COUNCIL)) {
                permission.put("locCountry"        , 1)
                permission.put("locProvinceState"  , 1)
                permission.put("locDivision"       , 1)
                permission.put("locDistrict"       , 1)
                permission.put("locCityCorporation", 1)
                permission.put("locSubDistrict"    , 1)
                permission.put("locMunicipality"   , 0)
                permission.put("locUnionCouncil"   , 1)
                permission.put("locWard"           , 0)
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.WARD)) {
                permission.put("locCountry"        , 1)
                permission.put("locProvinceState"  , 1)
                permission.put("locDivision"       , 1)
                permission.put("locDistrict"       , 1)
                permission.put("locCityCorporation", 1)
                permission.put("locSubDistrict"    , 1)
                permission.put("locMunicipality"   , 1)
                permission.put("locUnionCouncil"   , 1)
                permission.put("locWard"           , 1)
            }
        }
        return permission
    }

    Map getParentsList() throws Exception {
        return getParentsList(getCurrentUserLocation())
    }

    Map getParentsList(LocLocation locLocation) throws Exception {
        Map<String, ArrayList> locationList = new LinkedHashMap()
        Map parents = getParents(locLocation)
        if (locLocation) {
            if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.WORLD)) {
                locationList.put("locCountryList", getCountryList())
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.CONTINENT)) {
                locationList.put("locCountryList", getCountryList())
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.COUNTRY)) {
                locationList.put("locDivisionList"      , getDivisionList     ())
                locationList.put("locProvinceStateList" , getProvinceStateList())
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.PROVINCE_STATE)) {
                locationList.put("locDivisionList", getDivisionList())
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.DIVISION)) {
                //locationList.put("locDivisionList"       , getLocationAsList(locLocation               ))
                //locationList.put("locDistrictList"       , getDistrictList  (locLocation               ))

                locationList.put("locContinentList"      , getLocationAsList(parents.locContinent      ))
                locationList.put("locCountryList"        , getLocationAsList(parents.locCountry        ))
                locationList.put("locProvinceStateList"  , getLocationAsList(parents.locProvinceState  ))
                locationList.put("locDivisionList"       , getLocationAsList(parents.locDivision       ))
                locationList.put("locDistrictList"       , getLocationAsList(parents.locDistrict       ))
                locationList.put("locCityCorporationList", getLocationAsList(parents.locCityCorporation))
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.DISTRICT)) {
                locationList.put("locContinentList"      , getLocationAsList(parents.locContinent      ))
                locationList.put("locCountryList"        , getLocationAsList(parents.locCountry        ))
                locationList.put("locProvinceStateList"  , getLocationAsList(parents.locProvinceState  ))
                locationList.put("locDivisionList"       , getLocationAsList(parents.locDivision       ))
                locationList.put("locDistrictList"       , getLocationAsList(parents.locDistrict       ))
                locationList.put("locCityCorporationList", getLocationAsList(parents.locCityCorporation))

                locationList.put("locSubDistrictList"    , getSubDistrictList(locLocation              ))
                locationList.put("locMunicipalityList"   , getMunicipalityList(locLocation             ))
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.SUB_DISTRICT)) {
                locationList.put("locContinentList"      , getLocationAsList(parents.locContinent      ))
                locationList.put("locCountryList"        , getLocationAsList(parents.locCountry        ))
                locationList.put("locProvinceStateList"  , getLocationAsList(parents.locProvinceState  ))
                locationList.put("locDivisionList"       , getLocationAsList(parents.locDivision       ))
                locationList.put("locDistrictList"       , getLocationAsList(parents.locDistrict       ))
                locationList.put("locCityCorporationList", getLocationAsList(parents.locCityCorporation))
                locationList.put("locSubDistrictList"    , getLocationAsList(parents.locSubDistrict    ))

                locationList.put("locUnionCouncilList"   , getUnionParishadList(locLocation            ))
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.MUNICIPALITY)) {
                locationList.put("locContinentList"      , getLocationAsList(parents.locContinent      ))
                locationList.put("locCountryList"        , getLocationAsList(parents.locCountry        ))
                locationList.put("locProvinceStateList"  , getLocationAsList(parents.locProvinceState  ))
                locationList.put("locDivisionList"       , getLocationAsList(parents.locDivision       ))
                locationList.put("locDistrictList"       , getLocationAsList(parents.locDistrict       ))
                locationList.put("locCityCorporationList", getLocationAsList(parents.locCityCorporation))
                locationList.put("locSubDistrictList"    , getLocationAsList(parents.locSubDistrict    ))
                locationList.put("locMunicipalityList"   , getLocationAsList(parents.locMunicipality   ))

                locationList.put("locWardList"           , getWardList(locLocation                     ))
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.UNION_COUNCIL)) {
                locationList.put("locContinentList"      , getLocationAsList(parents.locContinent      ))
                locationList.put("locCountryList"        , getLocationAsList(parents.locCountry        ))
                locationList.put("locProvinceStateList"  , getLocationAsList(parents.locProvinceState  ))
                locationList.put("locDivisionList"       , getLocationAsList(parents.locDivision       ))
                locationList.put("locDistrictList"       , getLocationAsList(parents.locDistrict       ))
                locationList.put("locSubDistrictList"    , getLocationAsList(parents.locSubDistrict    ))
                locationList.put("locUnionCouncilList"   , getLocationAsList(parents.locUnionCouncil   ))

                locationList.put("locWardList"           , getWardList(locLocation                     ))
            } else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.WARD)) {
                locationList.put("locContinentList"      , getLocationAsList(parents.locContinent      ))
                locationList.put("locCountryList"        , getLocationAsList(parents.locCountry        ))
                locationList.put("locProvinceStateList"  , getLocationAsList(parents.locProvinceState  ))
                locationList.put("locDivisionList"       , getLocationAsList(parents.locDivision       ))
                locationList.put("locDistrictList"       , getLocationAsList(parents.locDistrict       ))
                locationList.put("locCityCorporationList", getLocationAsList(parents.locCityCorporation))
                locationList.put("locSubDistrictList"    , getLocationAsList(parents.locSubDistrict    ))
                locationList.put("locMunicipalityList"   , getLocationAsList(parents.locMunicipality   ))
                locationList.put("locUnionCouncilList"   , getLocationAsList(parents.locUnionCouncil   ))
                locationList.put("locWardList"           , getLocationAsList(parents.locWard           ))
                //todo add: village list
                //locationList.put("locWardList"           , getVillageList(locLocation                     ))
            }
        }
        return locationList
    }

    Map getChilds() throws Exception {
        return getChilds(getCurrentUserLocation())
    }

    Map getChilds(LocLocation locLocation) throws Exception {
        println locLocation
        Map<String, ArrayList> locationList = new LinkedHashMap()
        Map parents = getParents(locLocation)
        if (locLocation) {
            if (
                locLocation?.locAdmAreaType.equals(LocAdmAreaType.COUNTRY)// || getCurrentUserLocation()?.locAdmAreaType.equals(LocAdmAreaType.COUNTRY)
            ){
//                locationList.put("locDivisionList"    , getDivisionList     ())
//                locationList.put("locProvinceStateLis", getProvinceStateList())
                locationList.put("locCountryList"     , getCountryList())
//                locationList.put("locDivisionList"    , getDivisionList(locLocation))
//                locationList.put("locProvinceStateLis", getProvinceStateList(locLocation))
//                locationList.put("locDivisionList"    , getLocationSiblings(locLocation))
//                locationList.put("locProvinceStateLis", getLocationSiblings(locLocation))
                locationList.put("locDivisionList"    , getChildLocationList(locLocation))
                locationList.put("locProvinceStateLis", getChildLocationList(locLocation))
            }
            else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.PROVINCE_STATE)) {
                locationList.put("locDivisionList", getLocationSiblings(locLocation))
                locationList.put("locDistrictList", getDistrictList(locLocation))
            }
            else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.DIVISION)) {
                locationList.put("locDivisionList", getLocationSiblings(locLocation))
                locationList.put("locDistrictList", getDistrictList(locLocation))
            }
            else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.CITY_CORPORATION)) {
                locationList.put("locDivisionList", getLocationSiblings(parents.locDivision))
                locationList.put("locDistrictList", getLocationSiblings(parents.locDistrict))
            }
            else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.DISTRICT)) {
                locationList.put("locDivisionList", getLocationSiblings(parents.locDivision))
                locationList.put("locDistrictList", getLocationSiblings(parents.locDistrict))
                locationList.put("locSubDistrictList", getSubDistrictList(locLocation))
            }
            else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.SUB_DISTRICT)) {
                locationList.put("locDivisionList", getLocationSiblings(parents.locDivision))
                locationList.put("locDistrictList", getLocationSiblings(parents.locDistrict))
                locationList.put("locSubDistrictList" , getLocationSiblings(parents.locSubDistrict))
                locationList.put("locUnionCouncilList", getUnionParishadList(locLocation))
            }
            else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.MUNICIPALITY)) {
                locationList.put("locDivisionList", getLocationSiblings(parents.locDivision))
                locationList.put("locDistrictList", getLocationSiblings(parents.locDistrict))
                locationList.put("locSubDistrictList" , getLocationSiblings(parents.locSubDistrict))
                locationList.put("locWardList"       , getLocationSiblings(parents.locWard))
            }
            else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.UNION_COUNCIL)) {
                locationList.put("locDivisionList", getLocationSiblings(parents.locDivision))
                locationList.put("locDistrictList", getLocationSiblings(parents.locDistrict))
                locationList.put("locSubDistrictList" , getLocationSiblings(parents.locSubDistrict))
                locationList.put("locUnionCouncilList" , getLocationSiblings(parents.locUnionCouncil))
                locationList.put("locWardList", getWardList(locLocation))
            }
            else if (locLocation?.locAdmAreaType.equals(LocAdmAreaType.WARD)) {
                locationList.put("locDivisionList", getLocationSiblings(parents.locDivision))
                locationList.put("locDistrictList", getLocationSiblings(parents.locDistrict))
                locationList.put("locSubDistrictList" , getLocationSiblings(parents.locSubDistrict))
                locationList.put("locUnionCouncilList" , getLocationSiblings(parents.locUnionCouncil))
                locationList.put("locWardList" , getLocationSiblings(parents.locWard))
            }
        }
        return locationList
    }

    Map getParents(){
        return getParents(getCurrentUserLocation())
    }

    Map getParents(LocLocation location) throws Exception {
        Map parents = new LinkedHashMap()
        if(location){
            if (location?.locAdmAreaType.equals(LocAdmAreaType.WARD)) {
                parents.put("locWard", location)
                parents.putAll(getParents(location?.parent))
            } else if (location?.locAdmAreaType.equals(LocAdmAreaType.UNION_COUNCIL)) {
                parents.put("locUnionCouncil", location)
                parents.putAll(getParents(location?.parent))
            } else if (location?.locAdmAreaType.equals(LocAdmAreaType.MUNICIPALITY)) {
                parents.put("locMunicipality", location)
                parents.putAll(getParents(location?.parent))
            } else if (location?.locAdmAreaType.equals(LocAdmAreaType.SUB_DISTRICT)) {
                parents.put("locSubDistrict", location)
                parents.putAll(getParents(location?.parent))
            } else if (location?.locAdmAreaType.equals(LocAdmAreaType.DISTRICT)) {
                parents.put("locDistrict", location)
                parents.putAll(getParents(location?.parent))
            } else if (location?.locAdmAreaType.equals(LocAdmAreaType.DIVISION)) {
                parents.put("locDivision", location)
                parents.putAll(getParents(location?.parent))
            } else if (location?.locAdmAreaType.equals(LocAdmAreaType.PROVINCE_STATE)) {
                parents.put("locProvinceState", location)
                //parents.put("locCountry", location?.parent)
                parents.putAll(getParents(location?.parent))
            } else if (location?.locAdmAreaType.equals(LocAdmAreaType.COUNTRY)) {
                parents.put("locCountry"  , location)
                parents.put("locContinent", location?.parent)
            }
        }
        return parents
    }

    void printUserLocationInfo(AuthUser user){
        Set<AuthUserLkLoc> userLkLocList = user?.userLkLoc
        String locationDetails = "Location Details : "
        for (ul in userLkLocList){
            if (!user?.userLkLoc?.locLocationType?.toString().contains("COUNTRY")) {
                def loc = getParents(ul?.locLocation)
                if (loc?.locUnionCouncil) {
                    locationDetails += "\n\t" + (loc?.locDivision.name + " > " + loc?.locDistrict.name + " > " + loc?.locSubDistrict.name + " > " + loc?.locUnionCouncil.name)
                } else if (loc?.locSubDistrict) {
                    locationDetails += "\n\t" + (loc?.locDivision.name + " > " + loc?.locDistrict.name + " > " + loc?.locSubDistrict.name)
                } else if (loc?.locDistrict) {
                    locationDetails += "\n\t" + (loc?.locDivision.name + " > " + loc?.locDistrict.name)
                } else if (loc?.locDivision) {
                    locationDetails += "\n\t" + (loc?.locDivision.name)
                }
            } else {
                locationDetails += "\n\t" + ul.locLocation.title
            }
        }
        println locationDetails
    }

    Map getParentsOfUnionParishad(LocLocation location) throws Exception {
        Map parents = new LinkedHashMap()
        if (location && location?.locAdmAreaType.equals(LocAdmAreaType.UNION_COUNCIL)) {
            parents.put("locUnionCouncil", location)
            parents.putAll(getParentsOfUpazila(location?.parent))
        }
        return parents
    }

    Map getParentsOfUpazila(LocLocation location) throws Exception {
        Map parents = new LinkedHashMap()
        if (location && location?.locAdmAreaType.equals(LocAdmAreaType.SUB_DISTRICT)) {
            parents.put("locSubDistrict", location)
            parents.putAll(getParentsOfDistrict(location?.parent))
        }
        return parents
    }

    Map getParentsOfDistrict(LocLocation location) throws Exception {
        Map parents = new LinkedHashMap()
        if (location && location?.locAdmAreaType.equals(LocAdmAreaType.DISTRICT)) {
            parents.put("locDistrict", location)
            parents.put("locDivision", location?.parent)
        }
        return parents
    }
}
