package org.aalaa.sys

import org.aalaa.auth.AuthUser

class SysProperty implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser logCreatedBy,
             logModifiedBy

    String   propertyKey,
             propertyValue,
             remarks
    Boolean  isActive       = true
    Date     logCreatedDate = new Date(),
             logModifiedDate

    static mapping = {
        version true
        table   'A_SYS_PROPERTY'

        sort id: 'desc'
        //id generator: 'sequence', params: [sequence: 'S_A_SYS_PROPERTY']
    }

    static constraints = {
        isActive        nullable: false
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false
        propertyKey     nullable: false, size   : 0..100, unique: true
        propertyValue   nullable: false, size   : 0..2000

        logModifiedBy   nullable: true, display: false
        logModifiedDate nullable: true, display: false
        remarks         nullable: true, blank  : true, size: 0..255
    }

    @Override
    String toString() {
        return propertyValue
    }
}
