/**
 * @Created_By : AALAA
 * @Date       : 2015.09.11 11:20:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

import grails.transaction.Transactional
import grails.util.Environment
import grails.util.GrailsUtil
import grails.util.Metadata
import org.aalaa.auth.AuthUser
import org.aalaa.com.CalendarService
import org.apache.commons.codec.binary.Hex
import org.apache.commons.net.whois.WhoisClient
import org.springframework.beans.factory.annotation.Autowired
import service.org.aalaa.util.Aes256

import javax.servlet.http.HttpServletRequest
import java.text.SimpleDateFormat

@Transactional
class TrackerService {
    CalendarService calendarService
    //ok
    static String getAllIpAddress (String host) {
        StringBuilder response = new StringBuilder()
        try {
            response.append("\r\n\tIP address for host '" + host + "' are : ")
            InetAddress[] address = InetAddress.getAllByName(host);
            for(InetAddress h:address){
                response.append("\r\n\t" + h.getHostAddress());
            }
            System.out.println(response.toString());
            return response.toString()
        } catch ( UnknownHostException e ) {
            System.out.println("Could not find IP address for: " + host);
            return "Could not find IP address for: " + host
        }
    }

    //ok
    static String getHeaderInfo(String url) {
        /*
        * --------------------------------------------
        * Input: https://www.facebook.com/
        * --------------------------------------------
        * Output:
        * --------------------------------------------
        * 	Transfer-Encoding           : [chunked]
	    * 	null                        : [HTTP/1.1 200 OK]
	    * 	X-Content-Type-Options      : [nosniff]
	    * 	Connection                  : [keep-alive]
	    * 	Pragma                      : [no-cache]
	    * 	Date                        : [Tue, 24 Jul 2018 19:04:23 GMT]
	    * 	X-Frame-Options             : [DENY]
	    * 	Strict-Transport-Security   : [max-age=15552000; preload]
	    * 	Cache-Control               : [private, no-cache, no-store, must-revalidate]
	    * 	Vary                        : [Accept-Encoding]
	    * 	Set-Cookie                  : [sb=NnhXW6MoIAioRdSVyQCiK8cF; expires=Thu, 23-Jul-2020 19:04:22 GMT; Max-Age=63071999; path=/; domain=.facebook.com; secure; httponly, fr=01sZTVXmYPXpxSQYm..BbV3g2.ql.AAA.0.0.BbV3g2.AWVLref5; expires=Mon, 22-Oct-2018 19:04:22 GMT; Max-Age=7775999; path=/; domain=.facebook.com; secure; httponly]
	    * 	Expires                     : [Sat, 01 Jan 2000 00:00:00 GMT]
	    * 	X-FB-Debug                  : [7/MlwCMCNDLn600FwT6HPJmx4htfQGr6ZZr+8Yu6Nd0Q2jVL9faVywPP9b33OnRZm0NSc6aPsSkNxKXnlwtQcg==]
	    * 	X-XSS-Protection            : [0]
	    * 	Content-Type                : [text/html; charset="utf-8"]
        * --------------------------------------------
        */
        StringBuilder response = new StringBuilder()
        try {
            URL obj = new URL(url);
            URLConnection conn = obj.openConnection();
            Map<String, List<String>> map = conn.getHeaderFields();

            for (Map.Entry<String, List<String>> entry : map.entrySet()) {
                response.append("\r\n\t" + entry.getKey() + " : " + entry.getValue());
            }
        } catch (Exception e) {
        }
        System.out.println(response);
        return response
    }

    //ok
    String getWhoIsDetails(String domainName) {
        StringBuilder sb = new StringBuilder("");
        WhoisClient wic = new WhoisClient();
        try {
            wic.connect(WhoisClient.DEFAULT_HOST);
            sb.append(wic.query("=" + domainName));
            wic.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(sb.toString());
        return sb.toString()
    }

    //ok
    def getMacAddress(){
        InetAddress ip;
        StringBuilder macAddress = new StringBuilder();
        try {
            ip = InetAddress.getLocalHost();
            System.out.println("Current IP address : " + ip.getHostAddress());
            NetworkInterface network = NetworkInterface.getByInetAddress(ip);
            byte[] mac = network.getHardwareAddress();
            System.out.print("Current MAC address : ");
            for (int i = 0; i < mac.length; i++) {
                macAddress.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));
            }
            System.out.println(macAddress.toString());
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (SocketException e){
            e.printStackTrace();
        }
        return macAddress
    }

    //ok
    String getMACAddressWindows() {
        try {
            Process p = Runtime.getRuntime().exec("getmac /fo csv /nh");
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = br.readLine();
            String[] result = line.split(",");
            String MAC = result[0].replace('"', ' ').trim();
            return MAC;
        } catch (Exception var6) {
            var6.printStackTrace();
            return null;
        }
    }

    Map getHeaderInfo(HttpServletRequest request) throws Exception {
        Map hi = new LinkedHashMap()
        hi.put("via"              , request.getHeader("VIA"))                //RETURNS GATEWAY
        hi.put("forwardedFor"     , request.getHeader("X-FORWARDED-FOR"))    //RETURNS IP ADDRESS OF CLIENT SYSTEM (is client behind something...?)
        hi.put("proxyClientIp"    , request.getHeader("Proxy-Client-IP"))
        hi.put("proxyClientIpWl"  , request.getHeader("WL-Proxy-Client-IP"))
        hi.put("httpForwardedForX", request.getHeader("HTTP_X_FORWARDED_FOR"))
        hi.put("httpClientIp"     , request.getHeader("HTTP_CLIENT_IP"))
        return hi
    }

    @Autowired
    Map getHostInformation(){
        Map m = new LinkedHashMap()
        m.put("localHostAddress" , InetAddress.getLocalHost().getHostAddress())
        m.put("localHostName"    , InetAddress.getLocalHost().getHostName())
        m.put("remoteHostAddress", InetAddress.getLoopbackAddress().getHostAddress())
        m.put("remoteHostName"   , InetAddress.getLoopbackAddress().getHostName())
        return m
    }

    Map getRequestInfo(javax.servlet.http.HttpServletRequest request) throws UnknownHostException {
        Map hi = getHeaderInfo(request)
        hi.put("ipAddress", request.getRemoteAddr())
        if (hi.forwardedFor) {
            hi.ipAddress = hi.forwardedFor
        }
        Map<String, Object> ipInfo = new LinkedHashMap()
        //ipInfo.macAddressWindows = getMACAddressWindows()
        ipInfo.hostInformation   = getHostInformation()
        ipInfo.headerInfo        = hi
        ipInfo.ipAddress         = hi.ipAddress
        ipInfo.remoteAddress     = hi.ipAddress
        ipInfo.remoteHost        = request.getRemoteHost()
        ipInfo.remotePort        = request.getRemotePort()
        if (ipInfo.remoteAddress == "0:0:0:0:0:0:0:1") {
            InetAddress localHost = java.net.InetAddress.getLocalHost()
            ipInfo.localHost      = localHost
            ipInfo.localAddress   = localHost.getHostAddress()
            ipInfo.localHostName  = localHost.getHostName()
        }
        return ipInfo
    }

    void trackRequest(Map params){
        log.error "\r\n\tRequestInfo : " + getRequestInfo(params.request) + ";" +
                  "\r\n\tUserId      : " + params.currentUser?.id         + ";" +
                  "\r\n\tUserName    : " + params.currentUser?.username   + ";" +
                  "\r\n\tParameters  : " + params.params                  + ";"
    }

    void logError(Map params){
        log.error "\r\n\tRequestInfo : " + getRequestInfo(params.request) + ";" +
                  "\r\n\tUserId      : " + params.currentUser?.id         + ";" +
                  "\r\n\tUserName    : " + params.currentUser?.username   + ";" +
                  "\r\n\tParameters  : " + params.params                  + ";" +
                  "\r\n\tErrorMessage: " + params.errorMessage
    }

    Properties getSystemProperties(){
        return System.properties
    }

    Metadata getMetaInformation(){
        return Metadata.getCurrent()
    }

    String getGrailsVersion(){
        return GrailsUtil.grailsVersion
    }

    Environment getCurrentEnvironment(){
        return Environment.getCurrent()
    }

    String getHdCodeHex(String dcCode) {
        return String.format("%040x", new BigInteger(1, dcCode.getBytes("UTF8")))
    }

    String getHdCode(String dcCode) {
        return Aes256.encrypt(dcCode)
    }

    String getHdCode(String dcCode, Long saltId) {
        return Aes256.encrypt(dcCode, saltId)
    }

    def getHdCodeForUpdate(AuthUser authUser){
        String hdCode = authUser.hdCode
        try {
            hdCode = Aes256.encrypt(getDcCodeHex(hdCode))
        }
        catch (Exception e) {
            println e
        }
        return hdCode
    }

    String getDcCodeHex(String hdCode) {
        return new String(Hex.decodeHex(hdCode?.toCharArray()), "UTF8")
    }

    String getDcCode(String hdCode) {
        return Aes256.decrypt(hdCode)
    }

    String getDcCode(String hdCode, Long saltId) {
        return Aes256.decrypt(hdCode, saltId)
    }

    def getDcCode(AuthUser authUser){
        String dcCode = ""
        try {
            dcCode = (getDcCode(authUser?.hdCode) ?: getDcCode(authUser?.hdCode, authUser.id)) ?: getDcCodeHex(authUser?.hdCode)
        } catch (Exception e) {
            println e
        }
        return dcCode
    }

    void checkLicense(Long id, String licenseKey){
        try {
            SimpleDateFormat sdf      = new SimpleDateFormat("yyyy-MM-dd")
            Date             ed       = sdf.parse(getDcCode(licenseKey, id))
            BigDecimal       duration = calendarService.getDuration(new Date(), ed)
            Integer          rd       = (duration / 1000 / 60 / 60 / 24)

            if(duration <= 864000026){  //10 Days
                println "\n\n| This is a gentle reminder, Your License Will Expire Within ${rd} Days! Please, Renew Your License, As Soon As Possible.\n" +
                        "| Cell: +8801787651562\n" +
                        "| Have a nice day.\n" +
                        "| Thank You." +
                        "| Walton.\n\n"
            }
            else if(duration <= 0){     //Expired / 0 Days
                println "\n\n| Sorry, Your License Has Been Expired Please Contact With Walton Authority!\n" +
                        "| Cell: +8801787651562\n" +
                        "| Have a nice day.\n" +
                        "| Thank You.\n\n"
                System.exit(0)
            }
        }
        catch (Exception e) {}
    }
}
