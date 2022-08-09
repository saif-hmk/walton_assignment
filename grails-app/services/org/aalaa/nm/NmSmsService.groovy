/**
 * @Created_By : AALAA
 * @Date       : 2022.05.10 10:21:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.nm

import com.mashape.unirest.http.HttpResponse
import com.mashape.unirest.http.Unirest
import grails.transaction.Transactional
import org.aalaa.util.UtilityService
import org.aalaa.nm.sms.NmSmsLog
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.transaction.PlatformTransactionManager

@Transactional
class NmSmsService {
    UtilityService utilityService
    JdbcTemplate               jdbcTemplate
    PlatformTransactionManager platformTransactionManager

    /**
     * @Usage:
     *      String messageContent = "Your requisition no: " + strItemRequisition.getCode() + " has been approved successfully!";
     *      smsService.sendSmsSingle(mobileNoEmployee, messageContent, "REQUISITION_APPROVAL_CONSUMER", strItemRequisition.getEmployee().getId(), strItemRequisition.getEmployee().getGovId(), currentUser.getId(), strItemRequisition.getId());
     * @ResponseSample-01: {
     *    "messages":[
     *       {
     *          "to":"8801672036757",
     *          "status":{
     *             "groupId":1,
     *             "groupName":"PENDING",
     *             "id":7,
     *             "title":"PENDING_ENROUTE",
     *             "description":"Message sent to next instance"
     *          },
     *          "messageId":"35544019006033825762",
     *          "smsCount":1
     *       }
     *    ]
     * }
     * @ResponseSample-02: {
     *    "requestError":{
     *        "serviceException":{
     *            "messageId":"UNAUTHORIZED",
     *            "text":"Invalid login details"
     *        }
     *    }
     * }
     **/
    //void sendSmsSingle(String mobileNo, String messageContent, String contentCategory, Long hrEmployeeId, Long employeeCode, Long actionTakenBy, Long requisitionId) {
    void sendSmsSingle(String mobileNo, String messageContent, String contentCategory) {
        String    authorizationKey = "1fc83ca029b38f51eedcfbedc03cc8a4-cc44ba39-eb30-47b4-a93c-9b3132240d1a",
                  apiResponse      = ""
        StatusSms statusSms        = null
        messageContent = messageContent.replaceAll("[\\n\\r]", "")
        if (!mobileNo.startsWith("+88")) {
            mobileNo = "+88" + mobileNo
        }
        Integer messageCount      = null,
                statusId          = null,
                statusGroupId     = null
        String  messageId         = null,
                statusKeyword     = null,
                statusDescription = null,
                statusGroupName   = null

        if(1==2)    //todo remove while SMS service is required!
        if (mobileNo != null && mobileNo.length() == 14) {
            try {
                HttpResponse httpResponse = Unirest.post("https://api.infobip.com/sms/1/text/single")
                        .header("authorization", "App " + authorizationKey)
                        .header("content-type" , "application/json")
                        .header("accept"       , "application/json")
                        .body("{\"from\":\"MOF\",\"to\":\"" + mobileNo + "\",\"text\":\"" + messageContent + "\"}")
                        .asString()

                apiResponse = httpResponse.getBody().toString()
                println "SMS Response: " + apiResponse
                if(apiResponse.contains("\"requestError\":")){
                    Map messages = (Map<String, Map<String, String>>)utilityService.getMapFromJson(apiResponse).get("requestError")
                    statusKeyword     = messages.get("serviceException").get("messageId")
                    statusDescription = messages.get("serviceException").get("text")
                    println ("ER-SSI-SSS-01: " + apiResponse)
                    statusSms = StatusSms.FAILED
                    logSmsHistory(contentCategory, mobileNo, messageContent, statusSms.name(), apiResponse, messageId, messageCount, statusId, statusGroupId, statusGroupName, statusKeyword, statusDescription)
                }
                else {
                    try {
                        List<Map> messages = (List) utilityService.getMapFromJson(apiResponse).get("messages")
                        for (Map message : messages) {
                            Map apiStatus     = (HashMap) (message  ).get("status"     )
                            messageCount      = (Integer) (message  ).get("smsCount"   )
                            messageId         = (String ) (message  ).get("messageId"  )
                            statusId          = (Integer) (apiStatus).get("id"         )
                            statusGroupId     = (Integer) (apiStatus).get("groupId"    )
                            statusKeyword     = (String ) (apiStatus).get("name"       )
                            statusDescription = (String ) (apiStatus).get("description")
                            statusGroupName   = (String ) (apiStatus).get("groupName"  )

                            statusSms = getDeliveryStatus(statusKeyword)
                            logSmsHistory(contentCategory, mobileNo, messageContent, statusSms.name(), apiResponse, messageId, messageCount, statusId, statusGroupId, statusGroupName, statusKeyword, statusDescription)
                        }
                    }
                    catch (Exception e) {
                        e.printStackTrace()
                        println ("EX-SSI-SSS-01: " + e.getMessage())
                        apiResponse = e.getMessage()
                        statusSms = StatusSms.FAILED
                        logSmsHistory(contentCategory, mobileNo, messageContent, statusSms.name(), apiResponse, messageId, messageCount, statusId, statusGroupId, statusGroupName, statusKeyword, statusDescription)
                    }

                    Thread.sleep(300L)
                }
            }
            catch (Exception e) {
                statusSms = StatusSms.ERROR
                println ("EX-SSI-SSS-02: " + e)
                apiResponse = e.getMessage()
                logSmsHistory(contentCategory, mobileNo, messageContent, statusSms.name(), apiResponse, messageId, messageCount, statusId, statusGroupId, statusGroupName, statusKeyword, statusDescription)
            }
        }
        else {
            apiResponse = "Mobile no is not valid!"
            statusSms = StatusSms.FAILED
            logSmsHistory(contentCategory, mobileNo, messageContent, statusSms.name(), apiResponse, messageId, messageCount, statusId, statusGroupId, statusGroupName, statusKeyword, statusDescription)
        }
    }

    private void logSmsHistory(String contentCategory, String mobileNo, String messageContent, String messageStatus, String apiResponse, String apiMessageId, Integer apiMessageCount, Integer apiStatusId, Integer apiStatusGroupId, String  apiStatusGroupName, String apiStatusKeyword, String  apiStatusDescription){
        Map m = new LinkedHashMap()
        m.put("content"             , messageContent)
        m.put("contentCategory"     , contentCategory)
        m.put("mobileNo"            , mobileNo)
        m.put("messageStatus"       , messageStatus)
        m.put("apiResponse"         , apiResponse)
        m.put("apiStatusGroupName"  , apiStatusGroupName)
        m.put("apiStatusKeyword"    , apiStatusKeyword)
        m.put("apiStatusDescription", apiStatusDescription)
        m.put("apiMessageId"        , apiMessageId)
        m.put("apiMessageCount"     , apiMessageCount)
        m.put("apiStatusId"         , apiStatusId)
        m.put("apiStatusGroupId"    , apiStatusGroupId)

        NmSmsLog nmSmsLog = new NmSmsLog(m)
        nmSmsLog.validate(true)
        nmSmsLog.save(flush: true, failOnError: true)
    }

    StatusSms getDeliveryStatus(String statusKeyword){
        StatusSms deliveryStatus = StatusSms.UNHANDLED
        if(statusKeyword.equals("PENDING_ENROUTE")){
            deliveryStatus = StatusSms.SENT
        }
        else if(statusKeyword.equals("REJECTED_NETWORK") || statusKeyword.equals("REJECTED_NOT_ENOUGH_CREDITS")){
            deliveryStatus = StatusSms.FAILED
        }
        else if(statusKeyword.equals("REJECTED_PREFIX_MISSING")){
            deliveryStatus = StatusSms.ERROR
        }
        return deliveryStatus
    }
}
