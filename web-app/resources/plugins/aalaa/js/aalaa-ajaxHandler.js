/**
 * @Created_By  : AALAA Technology
 * @Date        : 2017.09.27 01:00:55 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Handle-Ajax.js
 * @Dependencies: Jquery.js, aalaa.js, aalaa-confirm.js
 * @LastModified: 21.05.06
 * @version     : 5.1
 **/
/*==================================================================================================================================================*/

//----------------------------------------------------------------------------------------------------------------------------------
//  Spinner Icon (Window.onLoad(), AJAX Request fire)
//----------------------------------------------------------------------------------------------------------------------------------
/*
 * Global Ajax Event Handlers (https://api.jquery.com/category/ajax/global-ajax-event-handlers/)
 * ["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"]
 *
 * .ajaxComplete() //Register a handler to be called when Ajax requests complete. This is an AjaxEvent.
 * .ajaxError()    //Register a handler to be called when Ajax requests complete with an error. This is an Ajax Event.
 * .ajaxSend()     //Attach a function to be executed before an Ajax request is sent. This is an Ajax Event.
 * .ajaxStart()    //Register a handler to be called when the first Ajax request begins. This is an Ajax Event.
 * .ajaxStop()     //Register a handler to be called when all Ajax requests have completed. This is an Ajax Event.
 * .ajaxSuccess()  //Attach a function to be executed whenever an Ajax request completes successfully. This is an Ajax Event.
 *
 */
//----------------------------------------------------------------------------------------------------------------------------------
$(document).ajaxStart(function () {
    Pace.restart();
}).ajaxStop(function () {
    Pace.stop();
}).ajaxError(function (x, y) {
    /*
    * -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    * 4XX Client errors [https://en.wikipedia.org/wiki/List_of_HTTP_status_codes]
    * -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */
    if (y.status == 400) {
        aalaaAlert({type: "ERROR", content: "Ex-400 (Bad Request) : Server understood the request, but request content was invalid...!"});
    }
    else if (y.status == 401) {
        aalaaAlert({type: "ERROR", content: "Ex-401 (Unauthorised Access) : Sorry, your session has expired. Please login again to continue."});
    }
    else if (y.status == 403) {
        aalaaAlert({type: "ERROR", content: "Ex-403 (Forbidden) : The request was valid, but the server is refusing action. You might not have the necessary permissions for the resource"});
    }
    else if (y.status == 404) {
        aalaaAlert({type: "ERROR", content: "Ex-404 (Not Found) : The requested resource could not be found but may be available in the future...!"});
    }
    else if (y.status == 405) {
        aalaaAlert({type: "ERROR", content: "Ex-405 (Method Not Allowed) : A request method is not supported for the requested resource...!"});
    }
    else if (y.status == 407) {
        aalaaAlert({type: "ERROR", content: "Ex-407 (Proxy Authentication Required) : You must first authenticate yourself with the proxy...!"});
    }
    else if (y.status == 408) {
        aalaaAlert({type: "ERROR", content: "Ex-408 (Request Timeout) : The client did not produce a request within the time that the server was prepared to wait. The client MAY repeat the request without modifications at any later time...!"});
    }
    else if (y.status == 414) {
        aalaaAlert({type: "ERROR", content: "Ex-414 (URI Too Long) : The URI provided was too long for the server to process...!"});
    }
    else if (y.status == 415) {
        aalaaAlert({type: "ERROR", content: "Ex-415 (Unsupported Media Type) : The request entity has a media type which the server or resource does not support...!"});
    }
    else if (y.status == 401) {
        aalaaAlert({type: "ERROR", content: "Ex-424 (Failed Dependency) : The request failed due to failure of a previous request...!"});
    }
    else if (y.status == 423) {
        aalaaAlert({type: "ERROR", content: "Ex-423 (Locked) : The resource that is being accessed is locked...!"});
    }
    else if (y.status == 426) {
        aalaaAlert({type: "ERROR", content: "Ex-426 (Upgrade Required) : The client should switch to a different protocol...!"});
    }
    else if (y.status == 429) {
        aalaaAlert({type: "ERROR", content: "Ex-429 (Too Many Requests) : The user has sent too many requests in a given amount of time...!"});
    }
    else if (y.status == 440) {
        aalaaAlert({type: "ERROR", content: "Ex-440 (Login Time-out) : The client's session has expired and must log in again...!"});
    }
    else if (y.status == 450) {
        aalaaAlert({type: "ERROR", content: "Ex-450 (Blocked by Windows Parental Controls (Microsoft)) : The Microsoft extension code indicated when Windows Parental Controls are turned on and are blocking access to the requested webpage....!"});
    }
    /*
    * -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    * 5XX Server errors [https://en.wikipedia.org/wiki/List_of_HTTP_status_codes]
    * -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    */
    else if (y.status == 500) {
        //alert(getStringFromJson(x));
        aalaaAlert({type: "ERROR", content: "Ex-500 : Internal server error...!"});
    }
    else if (y.status == 502) {
        aalaaAlert({type: "ERROR", content: "Ex-502 (Bad Gateway) : The server was acting as a gateway or proxy and received an invalid response from the upstream server...!"});
    }
    else if (y.status == 503) {
        aalaaAlert({type: "ERROR", content: "Ex-503 (Service Unavailable) : The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state...!"});
    }
    else if (y.status == 504) {
        aalaaAlert({type: "ERROR", content: "Ex-504 (Gateway Time-out) : The server was acting as a gateway or proxy and did not receive a timely response from the upstream server...!"});
    }
    else if (y.status == 505) {
        aalaaAlert({type: "ERROR", content: "Ex-505 (HTTP Version Not Supported) : The server does not support the HTTP protocol version used in the request...!"});
    }
    else if (y.status == 507) {
        aalaaAlert({type: "ERROR", content: "Ex-507 (Insufficient Storage) : The server is unable to store the representation needed to complete the request...!"});
    }
    else if (y.status == 508) {
        aalaaAlert({type: "ERROR", content: "Ex-508 (Loop Detected) : The server detected an infinite loop while processing the request...!"});
    }
    else if (y.status == 509) {
        aalaaAlert({type: "ERROR", content: "Ex-509 (Bandwidth Limit Exceeded) : The server has exceeded the bandwidth specified by the server administrator; this is often used by shared hosting providers to limit the bandwidth of customers...!"});
    }
    else if (y.status == 511) {
        aalaaAlert({type: "ERROR", content: "Ex-511 (Network Authentication Required) : The client needs to authenticate to gain network access. Intended for use by intercepting proxies used to control access to the network...!"});
    }
    else if (y.status == 530) {
        aalaaAlert({type: "ERROR", content: "Ex-530 (Site is frozen) : The site has been frozen due to inactivity...!"});
    }
    /*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
    else if (y.status == "timeout") {
        alert("Ex-" + y.status + " : Request timeout...!");
    }
    else {
        //println("Error Code : " + y.status);
        //println(getStringFromJson(x));
        //alert(getStringFromJson(x));
        //println(getStringFromJson(y));
        aalaaAlert({type: "ERROR", content: "Ex-" + y.status + " :An error occurred please contact with your admin."});
    }
});

function getResponseByXhr(params) {
    var response = {};
    $.ajax({async: false, type: params.type ? type.type : "POST", dataType: params.dataType ? type.dataType : "JSON", url: params.url ? params.url : (contextPath + "/" + params.controller + "/" + params.action), data: params.data ? params.data : {}, success: function (r) {response = r;}});
    return response;
}
/*======================================================================================================================================================*/
