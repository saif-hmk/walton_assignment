/**
 * @Created_By : AALAA
 * @Date       : 2021.05.08 02:08:11 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

import org.aalaa.auth.AuthUser

class SysScript {

    AuthUser          logCreatedBy,
                      logModifiedBy
    SysScript         parent
    ScriptType        scriptType
    AggregateFunction aggregateFunctionRow,
                      aggregateFunctionCol

    String            hashCode,
                      keyword,
                      title,
                      titleNative,
                      scriptText,   //"script" is a keyword
                      scriptParams,
                      description
    Integer           sortOrder
    Boolean           hasParam,
                      active
    Date              logCreatedDate  = new Date(),
                      logModifiedDate
    
    static hasMany = [
        sysScript: SysScript
    ]

    static mapping = {
        version true
        table 'A_SYS_SCRIPT'
        //scriptText sqlType: "varchar2"

        //id generator: 'sequence', params: [sequence: 'S_A_SYS_SCRIPT']
        sort        sortOrder: "asc" // or "desc"
    }

    static constraints = {
        active               nullable: false
        scriptType           nullable: false
        keyword              nullable: false, size: 1..30, unique: true
        title                nullable: false, size: 1..50
        titleNative          nullable: false, size: 1..100
        scriptText           nullable: false, size: 1..4000
        logCreatedBy         nullable: false, display: false
        logCreatedDate       nullable: false, display: false

        parent               nullable: true
        sysScript            nullable: true
        scriptParams         nullable: true
        sortOrder            nullable: true
        description          nullable: true
        aggregateFunctionRow nullable: true
        aggregateFunctionCol nullable: true
        hashCode             nullable: true, size: 1..30, unique: true

        logModifiedBy        nullable: true, display: false
        logModifiedDate      nullable: true, display: false
    }

    @Override
    String toString() {
        return title
    }
}
