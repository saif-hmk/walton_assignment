package org.walton.util

import grails.transaction.Transactional
import org.walton.hr.HrCrAttendanceService
import service.org.aalaa.nm.EmailProcessor

import java.text.DateFormat
import java.text.SimpleDateFormat

@Transactional
class WaltonMailSchedulerService {
    HrCrAttendanceService hrCrAttendanceService

    def scheduleToGenerateAttendanceMail() {
        //the Date and time at which you want to execute
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = dateFormatter.parse("2022-08-09 00:11:00");

        //Now create the time and schedule it
        Timer timerTwo = new Timer();

        //Use this if you want to execute it once
        //timerTwo.schedule(new AttendanceMailScheduler(), date);

        //Use this if you want to execute it repeatedly
        //long period = 60000 //1min
        //long period = 1800000;//60000ms = 60secs; 1Hr = 3600000secs; 12Hr = 43200000 secs
        long period = 180000;//60000ms = 60secs; 1Hr = 3600000secs; 12Hr = 43200000 secs
        timerTwo.schedule(new AttendanceMailScheduler(), date, period)
    }

    //The task which you want to execute
    private class AttendanceMailScheduler extends TimerTask {
        void run() {
            resetSchedule()
        }
    }

    void resetSchedule(){
        Date firedAt = new Date()
        println "|Mail Scheduler (For Attendance) Triggered at : " + firedAt

        Map  attendanceSummary = hrCrAttendanceService.getSubmittedAttendanceSummary()

        String recipient = "saif.hmk@gmail.com",
               subject   = "WALTON - Attendance Approval Request.",
               body      = "Dear Sir,\n" +
                           "This is a gentle reminder to approve the employee attendances.\n\n" +
                           "------------------------------------------------------------\n" +
                           "Attendance Summary:\n" +
                           "------------------------------------------------------------\n" +
                           "Period               : " + attendanceSummary.get("prlPeriod"         ) + "\n" +
                           "Total Employee       : " + attendanceSummary.get("totalEmployee"     ) + "\n" +
                           "Total Time Break     : " + attendanceSummary.get("totalTimeBreak"    ) + "\n" +
                           "Total Effective Hour : " + attendanceSummary.get("totalEffectiveHour") + "\n" +
                           "------------------------------------------------------------\n\n" +
                           "Have a nice Day" +
                           "Thank You." +
                           "WALTON IT Team"

        EmailProcessor.sendEmail(recipient, subject, body)
    }
}
