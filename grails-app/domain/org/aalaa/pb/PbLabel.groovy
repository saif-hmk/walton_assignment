package org.aalaa.pb

import org.aalaa.anl.token.AnlToken
import org.aalaa.anl.token.AnlTokenReference

class PbLabel extends AnlTokenReference {
    transient PbContact contact

    String   referenceTable = "A_PB_CONTACT"

    PbLabel(){}

    PbLabel(PbContact contact, String label){
        setToken(label)
        setContact(contact)
    }

    void setToken(String token) {
        this.token = AnlToken.findByKey(token) ?: new AnlToken([token: token])
    }

    void setContact(PbContact contact) {
        this.contact          = contact
        this.referenceTableId = contact.id
    }

    Long getReferenceTableId() {
        return this.contact.id
    }
}
