package org.aalaa.sys

import org.aalaa.auth.AuthUser

class SysConfigDomain implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser logCreatedBy,
             logModifiedBy

    String   nameDomain,
             nameTable,
             nameClass,
             allowedRoles,
             remarks
    Date     logCreatedDate = new Date(),
             logModifiedDate

    static mapping = {
        version true
        table   'A_SYS_CONFIG_DOMAIN'

        sort id: 'desc'
        //id generator: 'sequence', params: [sequence: 'S_A_SYS_CONFIG_DOMAIN']
    }

    static constraints = {
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false
        nameDomain      nullable: false, size   : 0..100, unique: true
        nameClass       nullable: false, size   : 0..100, unique: true
        nameTable       nullable: false, size   : 0..30 , unique: true
        allowedRoles    nullable: false, size   : 0..255

        logModifiedBy   nullable: true, display: false
        logModifiedDate nullable: true, display: false
        remarks         nullable: true, blank  : true, size: 0..255
    }

    @Override
    String toString() {
        return nameTable
    }
}
