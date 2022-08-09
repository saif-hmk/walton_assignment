package org.aalaa.pb

class PbContactDetails {
    PbContact contact

    String    type,
              contactNo,
              label = "Office"

    static mapping = {
        table  'a_pb_contact_details'
    }

    static constraints = {
        contact   nullable: false
        type      nullable: false
        contactNo nullable: false
        label     nullable: false
    }

    @Override
    String toString() {
        return contactNo
    }
}
