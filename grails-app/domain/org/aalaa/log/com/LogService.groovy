package org.aalaa.log.com

class LogService {

    String type
    Float  logTimeElapsed
    Date   logTimeStart = new Date(),
           logTimeEnd

    static mapping = {
        table 'a_log_service'
    }

    static constraints = {
        type           nullable: false, display: false
        logTimeStart   nullable: false

        logTimeEnd     nullable: true
        logTimeElapsed nullable: true
    }

    @Override
    String toString() {
        return logTimeElapsed
    }
}
