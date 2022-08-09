/**
 * @Created_By : AALAA
 * @Date       : 2018.10.27 03:31:19 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.proc

import grails.converters.JSON
import org.aalaa.sys.SchedulerService

class SchedulerController {
    SchedulerService schedulerService

    def index() { }

    def takeAction(){
        if(request.xhr){
            Map<String, Object> m = new LinkedHashMap<>()
            if (params.scheduleName == "LIST_ACTIVE_THREADS") {  //List
                m = getActiveThreadList()
            }
            else if (params.scheduleName == "START_SYSTEM_SYNC_PROCESS") {
                m = scheduleSystemSync()
            }
            else if (params.scheduleName == "START_REFRESH_AUTHENTICATION_PROCESS") {
                m = refreshAuthentication()
            }
            render(m as JSON)
        }
    }

    Map<String, Object> getActiveThreadList(){
        Map       r = new LinkedHashMap()
        List<Map> l = new ArrayList()
        try {
            //sb.append("Thread.getAllStackTraces().keySet() : " + Thread.getAllStackTraces().keySet() + "\n")
            for (Thread t : Thread.getAllStackTraces().keySet()?.sort{it.id}) {
                Map m = new LinkedHashMap()
                m.put("ID"      , t.id)
                m.put("NAME"    , t.getName())
                m.put("STATE"   , t.getState())
                m.put("PRIORITY", t.getPriority())
                m.put("GROUP"   , t.getThreadGroup())
                //if (t.getState() == Thread.State.RUNNABLE){
                //t.interrupt();
                //t.stop();
                //}
                l.add(m)
            }
            r.put("STATUS", "OK")
        }
        catch (Exception e) {
            println "EX-01-SJSH-ATL : " + e
            r.put("STATUS" , "ERROR")
            r.put("MESSAGE", e)
        }
        r.put("RESULT", l)
        return r
    }

    Map<String, Object> scheduleSystemSync(){
        Map r = new LinkedHashMap()
        try {
            schedulerService.scheduleSystemSync()
            r.put("STATUS", "OK")
        }
        catch (Exception e) {
            println "|EX @ scheduleSystemSync() : " + e
            r.put("STATUS" , "ERROR")
            r.put("MESSAGE", e)
        }
        return r
    }

    Map<String, Object> refreshAuthentication(){
        Map r = new LinkedHashMap()
        try {
            schedulerService.scheduleRefreshAuthentication()
            r.put("STATUS", "OK")
        }
        catch (Exception e) {
            println "|EX @ scheduleRefreshAuthentication() : " + e
            r.put("STATUS" , "ERROR")
            r.put("MESSAGE", e)
        }
        return r
    }
}
