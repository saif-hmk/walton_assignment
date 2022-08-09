package org.aalaa.auth

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString
import org.springframework.http.HttpMethod

@EqualsAndHashCode(includes = ['configAttribute', 'httpMethod', 'url'])
@ToString(includes = ['configAttribute', 'httpMethod', 'url'], cache = true, includeNames = true, includePackage = false)
class AuthRequestMap implements Serializable {

    private static final long serialVersionUID = 1

    AuthUser   logCreatedBy,
               logModifiedBy
    HttpMethod httpMethod

    String     url,
               configAttribute
    Boolean    isActive        = true
    Date       logCreatedDate  = new Date(),
               logModifiedDate

    AuthRequestMap(String url, String configAttribute, HttpMethod httpMethod = null) {
        this()
        this.configAttribute = configAttribute
        this.httpMethod = httpMethod
        this.url = url
    }

    static mapping = {
        cache        true
        table        'A_AUTH_REQUEST_MAP'

        sort id: 'desc'
        //id generator: 'sequence', params: [sequence: 'S_A_AUTH_REQUEST_MAP']
    }

    static constraints = {
        isActive        nullable: false
        logCreatedBy    nullable: false, display: false
        logCreatedDate  nullable: false, display: false
        url             nullable: false, unique: 'httpMethod'
        configAttribute nullable: false, size: 0..500

        httpMethod      nullable: true
        logModifiedBy   nullable: true, display: false
        logModifiedDate nullable: true, display: false
    }

    AuthRequestMap () {
    }

    @Override
    String toString() {
        return configAttribute
    }
}
