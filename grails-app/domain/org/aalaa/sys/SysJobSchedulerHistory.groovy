/**
 * @Created_By : AALAA
 * @Date       : 2018.10.27 12:20:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

class SysJobSchedulerHistory implements Serializable {
    private static final long serialVersionUID = 1

    String  schedulerTitle,
            status
    long    elapsedTime
    Date    firedAt = new Date()

    static mapping = {
        version true
        table   'A_SYS_JOB_SCHEDULER_HISTORY'

        sort firedAt: "desc"
        //id generator: 'sequence', params: [sequence: 'S_A_SYS_JOB_SCHEDULER_HISTORY']
        status sqlType: "clob"
    }

    static constraints = {
        firedAt         nullable: false
        elapsedTime     nullable: false
        schedulerTitle  nullable: false, size: 3..50
        status          nullable: false//, size: 1..4000
    }

    @Override
    String toString() {
        return status
    }
}

