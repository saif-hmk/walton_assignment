import grails.util.Environment
import org.aalaa.util.DataUploadService
import org.walton.util.WaltonDataUploadService
//import org.walton.util.WaltonMailSchedulerService

class BootStrap {
    DataUploadService          dataUploadService
    WaltonDataUploadService    WaltonDataUploadService
    //WaltonMailSchedulerService waltonMailSchedulerService

    def init = { servletContext ->

        if(1==2 && Environment.current == Environment.DEVELOPMENT){

            try {
                dataUploadService.uploadData()
                System.out.println("|Data Upload Has Been Completed Successfully!");
            }
            catch (Exception e) {
                println "|EX-BS-03-scheduleRefreshAuthentication() : " + e
            }

            try {
                waltonDataUploadService.uploadData()
                System.out.println("|Data Upload Has Been Completed Successfully!");
            }
            catch (Exception e) {
                println "|EX-BS-03-scheduleRefreshAuthentication() : " + e
            }
        }

        try {
            //waltonMailSchedulerService.scheduleToGenerateAttendanceMail()
        }
        catch (Exception e) {
            println "|EX @ scheduleToGenerateAttendanceMail() : " + e
        }

        println "------------------------------------------------------------------------------------------------------------------------------------------------------"
        println "|Server Started @ " + new Date()
        println "|Current environment is: ${Environment.current}"
        println "------------------------------------------------------------------------------------------------------------------------------------------------------"
    }
    def destroy = {
        println "|Server Stopped @ " + new Date()
    }
}
