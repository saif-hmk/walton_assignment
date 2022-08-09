package org.aalaa.sys

class SysThrowableController {
/*
* -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* 4XX Client errors [https://en.wikipedia.org/wiki/List_of_HTTP_status_codes]
* -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

    def _400() {
        flash.warning = ("Ex-400 (Bad Request) : Server understood the request, but request content was invalid...!")
        redirect(action: "error")
    }

    def _401() {
        flash.warning = ("Ex-401 (Unauthorised Access) : Sorry, your session has expired. Please login again to continue.")
        redirect(action: "error")
    }

    def _403() {
        flash.warning = ("Ex-403 (Forbidden) : The request was valid, but the server is refusing action. You might not have the necessary permissions for the resource")
        redirect(action: "error")
    }

    def _404() {
        //flash.warning = ("Ex-404 (Not Found) : The requested resource could not be found but may be available in the future...!")
    }

    def _405() {
        flash.warning = ("Ex-405 (Method Not Allowed) : A request method is not supported for the requested resource...!")
        redirect(action: "error")
    }

    def _407() {
        flash.warning = ("Ex-407 (Proxy Authentication Required) : You must first authenticate yourself with the proxy...!")
        redirect(action: "error")
    }

    def _408() {
        flash.warning = ("Ex-408 (Request Timeout) : The client did not produce a request within the time that the server was prepared to wait. The client MAY repeat the request without modifications at any later time...!")
        redirect(action: "error")
    }

    def _414() {
        flash.error = ("Ex-414 (URI Too Long) : The URI provided was too long for the server to process...!")
        redirect(action: "error")
    }

    def _415() {
        flash.error = ("Ex-415 (Unsupported Media Type) : The request entity has a media type which the server or resource does not support...!")
        redirect(action: "error")
    }

    def _424() {
        flash.error = ("Ex-424 (Failed Dependency) : The request failed due to failure of a previous request...!")
        redirect(action: "error")
    }

    def _423() {
        flash.error = ("Ex-423 (Locked) : The resource that is being accessed is locked...!")
        redirect(action: "error")
    }

    def _426() {
        flash.error = ("Ex-426 (Upgrade Required) : The client should switch to a different protocol...!")
        redirect(action: "error")
    }

    def _429() {
        flash.error = ("Ex-429 (Too Many Requests) : The user has sent too many requests in a given amount of time...!")
        redirect(action: "error")
    }

    def _440() {
        flash.error = ("Ex-440 (Login Time-out) : The client's session has expired and must log in again...!")
        redirect(action: "error")
    }

    def _450() {
        flash.error = ("Ex-450 (Blocked by Windows Parental Controls (Microsoft)) : The Microsoft extension code indicated when Windows Parental Controls are turned on and are blocking access to the requested webpage....!")
        redirect(action: "error")
    }
/*
* -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* 5XX Server errors [https://en.wikipedia.org/wiki/List_of_HTTP_status_codes]
* -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*/

    def _500() {
        //flash.error = ("Ex-500 : Internal server error...!")
    }

    def _502() {
        flash.error = ("Ex-502 (Bad Gateway) : The server was acting as a gateway or proxy and received an invalid response from the upstream server...!")
        redirect(action: "error")
    }

    def _503() {
        flash.error = ("Ex-503 (Service Unavailable) : The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state...!")
        redirect(action: "error")
    }

    def _504() {
        flash.error = ("Ex-504 (Gateway Time-out) : The server was acting as a gateway or proxy and did not receive a timely response from the upstream server...!")
        redirect(action: "error")
    }

    def _505() {
        flash.error = ("Ex-505 (HTTP Version Not Supported) : The server does not support the HTTP protocol version used in the request...!")
        redirect(action: "error")
    }

    def _507() {
        flash.error = ("Ex-507 (Insufficient Storage) : The server is unable to store the representation needed to complete the request...!")
        redirect(action: "error")
    }

    def _508() {
        flash.error = ("Ex-508 (Loop Detected) : The server detected an infinite loop while processing the request...!")
        redirect(action: "error")
    }

    def _509() {
        flash.error = ("Ex-509 (Bandwidth Limit Exceeded) : The server has exceeded the bandwidth specified by the server administrator; this is often used by shared hosting providers to limit the bandwidth of customers...!")
        redirect(action: "error")
    }

    def _511() {
        flash.error = ("Ex-511 (Network Authentication Required) : The client needs to authenticate to gain network access. Intended for use by intercepting proxies used to control access to the network...!")
        redirect(action: "error")
    }

    def _530() {
        flash.error = ("Ex-530 (Site is frozen) : The site has been frozen due to inactivity...!")
        redirect(action: "error")
    }
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

    def error() {}
}
