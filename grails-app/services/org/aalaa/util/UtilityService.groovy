/**
 * @Created_By : AALAA
 * @Date       : 2015.09.11 11:20:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.util

import com.fasterxml.jackson.core.type.TypeReference
import com.fasterxml.jackson.databind.ObjectMapper
import grails.transaction.Transactional
import org.aalaa.auth.AuthUserService
import org.aalaa.sys.Local
import org.codehaus.groovy.grails.commons.GrailsApplication
import org.springframework.web.context.request.RequestContextHolder

import javax.servlet.http.HttpSession
import java.lang.reflect.Field
import java.security.SecureRandom
import java.text.SimpleDateFormat

@Transactional
class   UtilityService {
    AuthUserService   authUserService
    SimpleDateFormat  dateParseFormat
    GrailsApplication grailsApplication

    static final ObjectMapper MAPPER = new ObjectMapper()
    static final String       AB     = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    static SecureRandom       rnd    = new SecureRandom();

    String getRandomAlphaNumericString( int length ){
        StringBuilder sb = new StringBuilder( length );
        for( int i = 0; i < length; i++ )
            sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
        return sb.toString();
    }

    Map getFields(Map m){
        Map<String, Object> fields = new LinkedHashMap()
        for (Field f in m.get("declaredFields")){
            String n = f.name
            if(n && !f.toString().contains("static") && !f.type.toString().contains("interface") && !f.toString().contains("errors") && !f.toString().contains("metaClass") && !f.toString().contains("\$") && !f.type.toString().startsWith("class [") && !n.startsWith("_")){
                fields[n] = f.type
            }
        }
        return fields?.sort()
    }

    public <T extends Object> Map getFields(T){
        return getFields(T.getProperties())
    }

    Map<String, Object> getMapFromJson(File jsonFile) {
        return getMapFromJson(new BufferedReader(new FileReader(jsonFile)).getText())
    }

    Map<String, Object> getMapFromJson(String jsonString) {
        Map<String, String> map = new HashMap<String, Object>()
        try {
//            ObjectMapper mapper = new ObjectMapper()
//            map = mapper.readValue(jsonString, new TypeReference<Map<String, Object>>() {})

            map = MAPPER.readValue(jsonString, new TypeReference<Map<String, Object>>() {})
        } catch (Exception e) {
            println "|EX-US-GMFJ: " + e
        }
        return map
    }

    /**
     * @value value could be found using a dot (.)
     * @example "authUser.userName"
     **/
    String generateDropDownList(List list, String key, String value) {
        StringBuilder sb = new StringBuilder()
        sb.append("<option value=''>Select One</option>")
        for (option in list){
            if(value.contains(".")){
                sb.append("<option value='" + option[key] + "'>" + option[value.split("[.]")[0]][value.split("[.]")[1]] + "</option>")
            }
            else {
                sb.append("<option value='" + option[key] + "'>" + option[value] + "</option>")
            }
        }
        return sb.toString()
    }

    String generateDropDownList(Set set, String key, String value) {
        return generateDropDownList(set.asList(), key, value)
    }

    /**
     * @value value could be found using a dot (.)
     * @example "authUser.userName"
     **/
    String generateDropDownList(List list, String key, String property, String propertyNative) {
        Local local = authUserService.getLocal()
        StringBuilder sb = new StringBuilder()
        sb.append("<option value=''>Select One</option>")
        for (option in list){
            String field = (local.equals(Local.EN) ? property : propertyNative), value = field.contains(".") ? (option[field.split("[.]")[0]][field.split("[.]")[1]] ?: option[field]) : option[field]
            sb.append("<option value='" + option[key] + "'>" + value + "</option>")
        }
        return sb.toString()
    }

    String generateDropDownList(List list, Object optionKey, Object optionValue) {
        StringBuilder sb = new StringBuilder()
        sb.append("<option value=''>Select One</option>")
        for (options in list)
            sb.append("<option value='" + options[optionKey] + "'>" + options[optionValue] + "</option>")
        return sb.toString()
    }

    HttpSession getSession() {
        return RequestContextHolder.currentRequestAttributes().getSession()
    }

    Object getSessionAttribute(String sessionKey) {
        Object sessionAttribute = null
        HttpSession session = getSession()
        sessionAttribute = session.getAttribute(sessionKey)
        return sessionAttribute
    }

    void setSessionAttribute(String sessionKey, Object sessionValue) {
        HttpSession session = getSession()
        session.setAttribute(sessionKey, sessionValue)
    }

    Boolean hasSessionAttribute(String sessionKey) {
        return getSessionAttribute(sessionKey) ? true : false
    }

    Boolean clearSession(String sessionKey) {
        HttpSession session = getSession()
        return session.removeAttribute(sessionKey)
    }

    String getCsvFromArrayList(Object arrayList) {
        String csv = ""
        try {
            csv = arrayList.toString().replace("[", "").replace("]", "").replaceAll(", ",",")
        } catch (Exception e) {
            println e
        }
        return csv
    }

    void printDetails(Map<String, Object> params) {
        int maxKeySize = 0
        try {
            maxKeySize = params?.keySet()?.max { it.length() }?.length()
        } catch (Exception e) {
            println e
        }
        println "\n======================================================================================================================================================"
        for (p in params) {
            println("\t" +  p.key.padRight(maxKeySize, " ") + " : " + p.value.toString())
        }
        println "======================================================================================================================================================\n"
    }

    String validateName(String name) {
        return name?.replaceAll("[^a-zA-Z\\s]", "")?.trim().toUpperCase()
    }

    String validateAddress(String address) {
        return address?.replaceAll("[^a-zA-Z0-9.,\\-\\s]+", "")?.trim()?.toUpperCase()
    }

    Date validateDob(String dob) {
        Date     r = null;
        if(!dob) r = null;
        else{
            dateParseFormat = new SimpleDateFormat("dd/MM/yyyy");
            try {
                r = dateParseFormat.parse(dob);
            }
            catch (Exception e) {
                println e;
            }
        }
        return r;
    }

    Boolean isValidNid(String nid) {
        return nid?.matches("([1-9]{1})+([0-9]{9,9})|([0-9]{12,12})|([0-9]{16,16})");
    }

    Boolean isValidMobileNo(String mobileNo) {
        /*
        if (!mobileNo) {
            return false
        }
        if (mobileNo.startsWith("0")) {
            mobileNo = "+88" + mobileNo
        }
        else if (mobileNo.startsWith("880")) {
            mobileNo = "+" + mobileNo
        }
        if (!mobileNo.startsWith("+8801")) {
            return false
        }
        if (!mobileNo?.matches("([+]{1})+8801+([3-9]{1})+([0-9]{8,8})")) {
            return false
        }
        return true
        */
        return (getMobileNoFull(mobileNo) ? true : false);
    }

    String getMobileNo(String mobileNo) {
        if (!mobileNo) {
            return null;
        }
        if (mobileNo.startsWith("0")) {
            mobileNo = "+88" + mobileNo;
        }
        else if (mobileNo.startsWith("880")) {
            mobileNo = "+" + mobileNo;
        }
        if (!mobileNo.startsWith("+8801")) {
            return null;
        }
        if (!mobileNo?.matches("([+]{1})+8801+([3-9]{1})+([0-9]{8,8})")) {
            mobileNo = null;
        }
        mobileNo = mobileNo.replaceAll("\\+880", "0")
        if (mobileNo.length() != 11) {
            return null;
        }
        return mobileNo;
    }

    String getMobileNoFull(String mobileNo) {
        if (!mobileNo) {
            return null
        }
        if (mobileNo.startsWith("0")) {
            mobileNo = "+88" + mobileNo
        }
        else if (mobileNo.startsWith("880")) {
            mobileNo = "+" + mobileNo
        }

        if (!mobileNo.startsWith("+8801")) {
            return null
        }
        if (mobileNo.length() != 14) {
            return null
        }
        if (!mobileNo?.matches("([+]{1})+8801+([3-9]{1})+([0-9]{8,8})")) {
            return null
        }
        return mobileNo
    }

    String formatAsEnumKey(String value){
        return value?.replaceAll(" ", "_")?.replaceAll("-", "_")?.replaceAll("__", "_")?.replaceAll("[^a-zA-Z_]", "")?.trim().toUpperCase()
    }

    String formatAsEnumValue(String value){
        return value?.replaceAll("[^a-zA-Z\\s]", " ")?.replaceAll("  ", " ")?.trim().toUpperCase()
    }

    String convertDecimalNoToUnicodeNo(String decimalNo) {
        String uniCodeNo = decimalNo
        if (decimalNo) {
            uniCodeNo = uniCodeNo.replace('0', '০')
            uniCodeNo = uniCodeNo.replace('1', '১')
            uniCodeNo = uniCodeNo.replace('2', '২')
            uniCodeNo = uniCodeNo.replace('3', '৩')
            uniCodeNo = uniCodeNo.replace('4', '৪')
            uniCodeNo = uniCodeNo.replace('5', '৫')
            uniCodeNo = uniCodeNo.replace('6', '৬')
            uniCodeNo = uniCodeNo.replace('7', '৭')
            uniCodeNo = uniCodeNo.replace('8', '৮')
            uniCodeNo = uniCodeNo.replace('9', '৯')
        }
        return uniCodeNo
    }

    Map getPaginateDetails(Map params) {
        Map paginateDetails = new LinkedHashMap()
        Integer min         = params.min ? Integer.parseInt(params.min) : grailsApplication.config.show.item.min,
                max         = params.max ? Integer.parseInt(params.max) : grailsApplication.config.show.item.max
        paginateDetails.put("max", Math.min(min, max))
        if(params.offset)
            paginateDetails.put("offset", Math.max(max, Integer.parseInt(params.offset)))
        return paginateDetails
    }

    public <T extends Object> List<T> getHierarchicalList(T) {
        return getHierarchicalList(T, new ArrayList(), null, null)
    }

    public <T extends Object> List<T> getHierarchicalList(T, List<T> list, T parent, String prefix) {
        List<T> instanceList = T.createCriteria().list {
            if (parent)
                eq("parent", parent)
            else
                isNull("parent")
            eq("isActive", true)

            order('parent'   , 'asc')
            order('sortOrder', 'asc')
            order('title'    , 'asc')
        }
        if (instanceList) {
            int sl = 1
            for (T instance in instanceList) {
                String title = prefix ? prefix + " > " + instance.title : instance.title

                list.add([id: instance.id, title: title])

                getHierarchicalList(T, list, instance, title)
                sl += 1
            }
        }
        return list
    }

    public <T extends Object> List<T> getHierarchicalListWithSlNo(T) {
        return getHierarchicalListWithSlNo(T, new ArrayList(), null, null, null)
    }

    public <T extends Object> List<T> getHierarchicalListWithSlNo(T, List<T> list, T parent, String prefix, String parentSl) {
        List<T> instanceList = T.createCriteria().list {
            if (parent)
                eq("parent", parent)
            else
                isNull("parent")
            eq("isActive", true)

            order('parent'   , 'asc')
            order('sortOrder', 'asc')
            order('title'    , 'asc')
        }
        if (instanceList) {
            int sl = 1
            for (T instance in instanceList) {
                String slNo        = (parentSl ? parentSl + "." : "") + (sl ?: ""),
                       title       = prefix ? prefix + " > " + instance.title : instance.title

                list.add([id: instance.id, title: slNo + " : " + title, parent: instance?.parent])

                getHierarchicalListWithSlNo(T, list, instance, title, slNo)
                sl += 1
            }
        }
        return list
    }

    /*todo complete: generate hierarchicalOptions from backend*/
    public <T extends Object> List<T> generateHierarchicalOptionsWithSlNo(T, List list, T parent, String prefix, String parentSl) {
        List<T> instanceList = T.createCriteria().list {
            if (parent)
                eq("parent", parent)
            else
                isNull("parent")
            eq("isActive", true)

            order('parent'   , 'asc')
            order('sortOrder', 'asc')
            order('title'    , 'asc')
        }
        if (instanceList) {
            int sl = 1
            for (T instance in instanceList) {
                Integer childCount = instance?.children?.size()
                String slNo        = (parentSl ? parentSl + "." : "") + (sl ?: ""),
                       title       = prefix ? prefix + " > " + instance.title : instance.title,
                       titleNative = prefix ? prefix + " > " + instance.titleNative : instance.titleNative,
                       optGroup    = childCount > 0 ? title : ""
                list.add([id: instance.id, title: slNo + " : " + title, titleNative: slNo + " : " + titleNative, childCount: childCount, optGroup: optGroup])

                getHierarchicalListWithSlNo(T, list, instance, title, slNo)

                sl += 1
            }
        }
        return list
    }
}
