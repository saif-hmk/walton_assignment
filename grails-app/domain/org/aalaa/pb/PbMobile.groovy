package org.aalaa.pb

class PbMobile extends PbContactDetails {
    String type = "mobileNo"

    static constraints = {
        contactNo nullable: false, blank  : false, minSize: 14, maxSize: 14,  matches: "([+]{1})+8801+([3-9]{1})+([0-9]{8,8})"
    }
}
