package org.aalaa.pb

class PbEmail extends PbContactDetails {
    String type = "email"

    static constraints = {
        contactNo nullable: false, email: true
    }
}
