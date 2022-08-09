package org.aalaa.auth

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes = 'authority')
@ToString(includes = 'authority', includeNames = true, includePackage = false)
class AuthRole implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser logCreatedBy,
             logModifiedBy

    String   authority = "ROLE_",
             remarks
    Integer  rank
    Boolean  isActive       = true
    Date     logCreatedDate = new Date(),
             logModifiedDate

    static mapping = {
        cache   true
        version  true
        table  'A_AUTH_ROLE'
        logCreatedBy    column: 'LOG_CREATED_BY_ID'
        logCreatedDate  column: 'LOG_CREATED_DATE'
        logModifiedBy   column: 'LOG_MODIFIED_BY_ID'
        logModifiedDate column: 'LOG_MODIFIED_DATE'

        sort id: 'desc'
        //id generator: 'sequence', params: [sequence: 'S_A_AUTH_ROLE']
        sort rank: "asc" // or "desc"
    }

    static constraints = {
        isActive        nullable: false
        authority       nullable: false, unique : true, size: 7..30, matches: "ROLE_+([A-Z_]{1,25})+"
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false

        rank            nullable: true, min    : 1, max: 999
        remarks         nullable: true, size   : 0..255
        logModifiedBy   nullable: true, display: false
        logModifiedDate nullable: true, display: false
    }

    AuthRole () {
    }

    AuthRole(String authority) {
        this()
        this.authority = authority
    }

    @Override
    String toString() {
        return authority
    }
}
