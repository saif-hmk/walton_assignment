/**
 * @Created_By : AALAA
 * @Date       : 2021.12.01 01:03:14 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

import grails.transaction.Transactional

import java.text.DateFormat
import java.text.SimpleDateFormat

@Transactional
class SchedulerService {

    void scheduleRefreshAuthentication() {
        //the Date and time at which you want to execute
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date       startDate     = dateFormatter.parse("2021-12-01 00:05:00");

        //Now create the time and schedule it
        Timer refreshAuthentication = new Timer();

        //Use this if you want to execute it once
        //timer.schedule(new Scheduler(), date);

        //Use this if you want to execute it repeatedly
//        long interval = 60000         //1min
        long interval = 86400000;   //60sec = 60000ms; 30min = 1800000ms; 1Hr = 3600000sec; 12Hr = 43200000 secs; 24Hr = 86400000 sec

        //timer.schedule(new Scheduler("REFRESH_AUTHENTICATION"), startDate, interval)
        refreshAuthentication.schedule(new RefreshAuthenticationScheduler(), startDate, interval)
    }

    private class RefreshAuthenticationScheduler extends TimerTask {
        void run() {
            //refreshAuthentication()
        }
    }

    void refreshAuthentication(){
        Date firedAt = new Date()
        //println "|Task (Refresh Authentication) started at : " + firedAt

        /*
        //println "Authentication Status: " + status
        if((status?.appMessage?.equals("Authentication successful!")) || (status?.access_token) || (status?.appStatus?.equals("SUCCESSFUL") && status?.appStatusCode?.equals(200))){
            SimpleDateFormat dateTimeParseFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm a")

            IdraUmpApiConfig c1 = IdraUmpApiConfig.findByKeyword("TOKEN_TIME")
            c1.setValue(dateTimeParseFormat.format(firedAt))
            c1.logModifiedBy   = null
            c1.logModifiedDate = firedAt
            c1.remarks         = "Modified by system at: " + firedAt
            try {
                c1.save(flush: true)
            } catch (Exception e) {
                println e
            }

            IdraUmpApiConfig c2 = IdraUmpApiConfig.findByKeyword("TOKEN_TYPE")
            c2.setValue(status.get("token_type"))
            c1.logModifiedBy   = null
            c1.logModifiedDate = firedAt
            c1.remarks         = "Modified by system at: " + firedAt
            try {
                c2.save(flush: true, failOnError: true)
            } catch (Exception e) {
                println e
            }

            IdraUmpApiConfig c3 = IdraUmpApiConfig.findByKeyword("ACCESS_TOKEN")
            c3.setValue(status.get("access_token"))
            c1.logModifiedBy   = null
            c1.logModifiedDate = firedAt
            c1.remarks         = "Modified by system at: " + firedAt
            try {
                c3.save(flush: true, failOnError: true)
            } catch (Exception e) {
                println e
            }

            IdraUmpApiConfig c4 = IdraUmpApiConfig.findByKeyword("REFRESH_TOKEN")
            c4.setValue(status.get("refresh_token"))
            c1.logModifiedBy   = null
            c1.logModifiedDate = firedAt
            c1.remarks         = "Modified by system at: " + firedAt
            try {
                c4.save(flush: true, failOnError: true)
            } catch (Exception e) {
                println e
            }
        }
        long elapsedTime = (new Date()?.time - firedAt?.time)
        logScheduledActivity("START_AUTHENTICATION_PROCESS", firedAt, elapsedTime, status.toString())
        */
    }

    void scheduleSystemSync() {
        /*
        //the Date and time at which you want to execute
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date       startDate     = dateFormatter.parse("2021-12-01 00:10:00");

        //Now create the time and schedule it
        Timer dataSync = new Timer();

        //Use this if you want to execute it once
        //timer.schedule(new Scheduler(), date);

        //Use this if you want to execute it repeatedly
        //long interval = 60000 //1min
        long interval = 60000;//60000ms = 60secs; 1800000ms = 30mins; 1Hr = 3600000secs; 12Hr = 43200000 secs
        //timer.schedule(new Scheduler("SYSTEM_SYNC"), startDate, interval)
        dataSync.schedule(new SystemSyncScheduler(), startDate, interval)
        */
    }

    private class SystemSyncScheduler extends TimerTask {
        void run() {
            //syncSystem()
        }
    }

    void syncSystem(){
        /*
        Date firedAt = new Date()
        println "|Task (System Sync) started at : " + firedAt
        Map status       = new LinkedHashMap()  //TODO revoke & generate new access token and get status as map
        long elapsedTime = (new Date()?.time - firedAt?.time)
        logScheduledActivity("START_SYSTEM_SYNC_PROCESS", firedAt, elapsedTime, status.toString())
        */
    }


    void logScheduledActivity(String schedulerTitle, Date firedAt, long elapsedTime, String status) {
        //Trim Status
        /*
        if(status && status.length() > 2000){
            status = status.substring(0, 2000)
        }
        */
        try {
            new SysJobSchedulerHistory([schedulerTitle: schedulerTitle, firedAt: firedAt, elapsedTime: elapsedTime, status: status]).save(flush: true, failOnError: true, errors: true)
        }
        catch (Exception e) {
            println "|EX-SS-LSA-01: " + e
        }
    }


    void startScheduler(String scheduleFor){
        println "Starting Schedule: " + scheduleFor
        if(scheduleFor.equals("INITIALIZER")) {
            scheduleSystemSync()
            //scheduleRefreshAuthentication()
        }
        else if(scheduleFor.equals("SYSTEM_SYNC")) {
            scheduleSystemSync()
        }
        else if(scheduleFor.equals("REFRESH_AUTHENTICATION")) {
            scheduleRefreshAuthentication()
        }
    }

    void startTask(String task){
        println "Starting Task: " + task
        if(task.equals("INITIALIZER")) {
            syncSystem()
            //refreshAuthentication()
        }
        else if(task.equals("SYSTEM_SYNC")) {
            syncSystem()
        }
        else if(task.equals("REFRESH_AUTHENTICATION")) {
            refreshAuthentication()
        }
    }
}
