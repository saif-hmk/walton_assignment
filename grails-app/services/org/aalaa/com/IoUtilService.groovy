/**
 * @Created_By : AALAA
 * @Date       : 2015.09.11 11:20:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import grails.util.Environment
import org.aalaa.sys.TrackerService
import org.aalaa.util.UtilityService
import org.apache.commons.io.IOUtils
import org.codehaus.groovy.grails.commons.GrailsApplication
import org.aalaa.auth.AuthUser
import org.aalaa.sys.MeasurementUnitMemory
import org.aalaa.sys.SysProperty
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.imageio.ImageIO
import javax.servlet.ServletContext
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import java.awt.image.BufferedImage
import java.awt.image.RenderedImage
import java.nio.ByteBuffer
import java.nio.channels.FileChannel
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths
import java.text.SimpleDateFormat
import java.util.stream.Stream

@Transactional
class IoUtilService {
    GrailsApplication          grailsApplication
    SpringSecurityService      springSecurityService
    TrackerService             trackerService
    UtilityService             utilityService
    ServletContext             servletContext
    AuthUser                   currentUser
    public static final String ROOT_PATH_DEV            = "PATH_ROOT_DEVELOPMENT",
                               ROOT_PATH_TEST           = "PATH_ROOT_TEST",
                               ROOT_PATH_PROD           = "PATH_ROOT_PRODUCTION",
                               REPO_PATH_DEV            = "PATH_REPO_DEVELOPMENT",
                               REPO_PATH_TEST           = "PATH_REPO_TEST",
                               REPO_PATH_PROD           = "PATH_REPO_PRODUCTION",
                               IMAGE_PATH_DEVELOPMENT   = "PATH_IMAGE_DEVELOPMENT",
                               IMAGE_PATH_TEST          = "PATH_IMAGE_TEST",
                               IMAGE_PATH_PRODUCTION    = "PATH_IMAGE_PRODUCTION",
                               FILE_PATH_DEVELOPMENT    = "PATH_FILE_DEVELOPMENT",
                               FILE_PATH_TEST           = "PATH_FILE_TEST",
                               FILE_PATH_PRODUCTION     = "PATH_FILE_PRODUCTION",
                               REPORT_PATH_DEVELOPMENT  = "PATH_REPORT_DEVELOPMENT",
                               REPORT_PATH_TEST         = "PATH_REPORT_TEST",
                               REPORT_PATH_PRODUCTION   = "PATH_REPORT_PRODUCTION",
                               LOG_PATH_DEV             = "PATH_LOG_DEVELOPMENT",
                               LOG_PATH_TEST            = "PATH_LOG_TEST",
                               LOG_PATH_PROD            = "PATH_LOG_PRODUCTION",
                               FS                       = File.separator
    //----------------------------------------------------------------------------------------------------------------------------------------
    //      General : File / Folder Identification
    //----------------------------------------------------------------------------------------------------------------------------------------

    String getPrintPrefix(){
        return new SimpleDateFormat(grailsApplication.config.format.printDate).format(new Date()) + "_" + grailsApplication.config.app.code + "_"
    }

    Path getPath(String filePath) throws FileNotFoundException{
        return Paths.get(filePath)
    }

    File getDirectory(String path){
        File requestedPath = null
        try {
            File f = new File(path)
            if(!f.isFile())
                requestedPath = f
        } catch (FileNotFoundException e) {
            log.error("EX-01_IoUtilService.getDirectory(String path) :\n\t" + e)
            println  ("EX-01_IoUtilService.getDirectory(String path) :\n\t" + e)
        } catch (Exception e) {
            log.error("EX-02_IoUtilService.getDirectory(String path) :\n\t" + e)
            println  ("EX-02_IoUtilService.getDirectory(String path) :\n\t" + e)
        }
        return requestedPath
    }

    String getDirectory(File file) throws FileNotFoundException{
        return file.getParent()
    }

    File getFile(String filePath){
        File requestedFile = null
        try {
            File f = new File(filePath)
            if(f.isFile())
                requestedFile = f
        } catch (FileNotFoundException e) {
            log.error("EX-01_IoUtilService.getFile(String filePath) :\n\t" + e)
            println  ("EX-01_IoUtilService.getFile(String filePath) :\n\t" + e)
        }
        return requestedFile
    }

    File getFile(String moduleName, String subModuleName, String fileName) throws FileNotFoundException, Exception {
        return getFile(getRepository(moduleName, subModuleName) + fileName)
    }

    String getFilesDirectory(File file) throws Exception{
        return file.parent
    }

    List getFileList(File directory){
        return directory.listFiles()
    }

    List getFileList(String directory){
        return new File(directory).listFiles()
    }

    List getFileList(File folder, String extension) throws IOException, FileNotFoundException {
        //File   file      = new File("C:/Script_folder")
        //String extension = ".sql"
        File[] filesArray = folder.listFiles(new FileFilter() {
            boolean accept(File f) {
                if (f.getName().toLowerCase().endsWith(extension))
                    return true
                return false
            }
        })
        return filesArray.toList()
    }

    Boolean isFolder(File file){
        return !file.isFile()
    }

    Boolean isFileExist(String file){
        return new File(file).exists()
    }

    String getModuleSubModule(String moduleName, String subModuleName){
        return (moduleName ? moduleName + FS : "") + (subModuleName ? subModuleName + FS : "")
    }

    //----------------------------------------------------------------------------------------------------------------------------------------
    //      File Properties
    //----------------------------------------------------------------------------------------------------------------------------------------

    Long getLineCount(File file) throws FileNotFoundException{
        return Files.lines(file.toPath()).count()
    }

    Long getFileLength(File file) throws FileNotFoundException{
        return file.length()
    }

    String getFileName(File file) throws FileNotFoundException{
        return file.getName()
    }

    long getBytes(int qty, MeasurementUnitMemory measurementUnit){
             if(measurementUnit.equals(MeasurementUnitMemory.BYTES))       return qty * 1L
        else if(measurementUnit.equals(MeasurementUnitMemory.KILO_BYTES))  return qty * 1024L
        else if(measurementUnit.equals(MeasurementUnitMemory.MEGA_BYTES))  return qty * 1048576L
        else if(measurementUnit.equals(MeasurementUnitMemory.GIGA_BYTES))  return qty * 1073741824L
        else if(measurementUnit.equals(MeasurementUnitMemory.TERA_BYTES))  return qty * 1099511627776L
        else if(measurementUnit.equals(MeasurementUnitMemory.PETA_BYTES))  return qty * 1125899906842624L
        else if(measurementUnit.equals(MeasurementUnitMemory.EXA_BYTES))   return qty * 1152921504606846976L
        else if(measurementUnit.equals(MeasurementUnitMemory.ZETTA_BYTES)) return qty * 1180591620717411303424L
        else if(measurementUnit.equals(MeasurementUnitMemory.YOTTA_BYTES)) return qty * 1208925819614629174706176L
    }

    Map getFileSize(File file){
        return file.length() ? getFileSize(file.length()) : null
    }

    Map getFileSize(Long bytes){
        Map map = new LinkedHashMap()
        long kiloBytes  = (bytes      / 1024)
        long megaBytes  = (kiloBytes  / 1024)
        long gigaBytes  = (megaBytes  / 1024)
        long teraBytes  = (gigaBytes  / 1024)
        long petaBytes  = (teraBytes  / 1024)
        long exaBytes   = (petaBytes  / 1024)
        long zettaBytes = (exaBytes   / 1024)
        long yottaBytes = (zettaBytes / 1024)

        map.put("byte", bytes)
        map.put("kb"  , kiloBytes )
        map.put("mb"  , megaBytes )
        map.put("gb"  , gigaBytes )
        map.put("tb"  , teraBytes )
        map.put("pb"  , petaBytes )
        map.put("eb"  , exaBytes  )
        map.put("zb"  , zettaBytes)
        map.put("yb"  , yottaBytes)

        return map
    }

    String getFileExtension(CommonsMultipartFile file) throws Exception {
        String fileName = file.getOriginalFilename()
        return fileName.substring(fileName.lastIndexOf('.'), fileName.length())
    }

    String getFileExtension(String fileName) throws Exception {
        return fileName.substring(fileName.lastIndexOf('.'), fileName.length())
    }

    //----------------------------------------------------------------------------------------------------------------------------------------
    //      System
    //----------------------------------------------------------------------------------------------------------------------------------------

    SysProperty getSysProperty(String propertyKey) throws Exception{
        return SysProperty.findByPropertyKeyAndIsActive(propertyKey, true)
    }

    //----------------------------------------------------------------------------------------------------------------------------------------
    //      Repository
    //----------------------------------------------------------------------------------------------------------------------------------------

    String getRootDir() {
        return getRootDir(Environment.current)
    }

    String getRootDir(Environment environment) {
        String rootDirectory = null, rootDir = ""
        try {
            if (environment.current == Environment.DEVELOPMENT){
                rootDir = getDirectory(System.getProperty("user.dir"))
                rootDirectory = getSysProperty(ROOT_PATH_DEV)  ? getSysProperty(ROOT_PATH_DEV)?.propertyValue  : rootDir  + FS
            }
            else if (environment.current == Environment.TEST){
                rootDir = getDirectory(System.getProperty("catalina.base"))
                rootDirectory = getSysProperty(ROOT_PATH_TEST) ? getSysProperty(ROOT_PATH_TEST)?.propertyValue : rootDir  + FS
            }
            else if (environment.current == Environment.PRODUCTION){
                rootDir = getDirectory(System.getProperty("catalina.base"))
                rootDirectory = getSysProperty(ROOT_PATH_PROD) ? getSysProperty(ROOT_PATH_PROD)?.propertyValue : rootDir  + FS
            }
        } catch (FileNotFoundException e) {
            log.error("EX-04_IoUtilService.getRootDir(Environment environment) :\n\t" + e)
            println  ("EX-04_IoUtilService.getRootDir(Environment environment) :\n\t" + e)
        } catch (Exception e) {
            log.error("EX-05_IoUtilService.getRootDir(Environment environment) :\n\t" + e)
            println  ("EX-05_IoUtilService.getRootDir(Environment environment) :\n\t" + e)
        }
        return rootDirectory
    }

    //----------------------------------------------------------------------------------------------------------------------------------------
    //      Repository
    //----------------------------------------------------------------------------------------------------------------------------------------

    String getDefaultRepository(){
        Environment environment  = Environment.current
        String rootDirectory     = getRootDir(),
               defaultRepository = getDirectory(rootDirectory).getName(),
               appCode           = grails.util.Metadata.current.'app.code'
        if (environment == Environment.DEVELOPMENT){
            //defaultRepository = servletContext.getRealPath("repo")
            defaultRepository = servletContext.getRealPath("") + FS + "repo" + FS + appCode + FS + "dev"
        }
        else if (environment == Environment.TEST){
            defaultRepository = rootDirectory  + FS + "repo"  + FS + appCode + FS + "test"
        }
        else if (environment == Environment.PRODUCTION){
            defaultRepository = rootDirectory  + FS + "repo"  + FS + appCode + FS + "prod"
        }
        return defaultRepository
    }

    String getRepository() {
        return getRepository(Environment.current)
    }

    String getRepository(Environment environment) {
        String repository = null, defaultRepository = getDefaultRepository()
        try {
            if (environment.current == Environment.DEVELOPMENT)
                repository = getSysProperty(REPO_PATH_DEV)  ? getSysProperty(REPO_PATH_DEV)?.propertyValue  : defaultRepository
            else if (environment.current == Environment.TEST)
                repository = getSysProperty(REPO_PATH_TEST) ? getSysProperty(REPO_PATH_TEST)?.propertyValue : defaultRepository
            else if (environment.current == Environment.PRODUCTION)
                repository = getSysProperty(REPO_PATH_PROD) ? getSysProperty(REPO_PATH_PROD)?.propertyValue : defaultRepository
        } catch (FileNotFoundException e) {
            log.error("EX-04_IoUtilService.getRepository(Environment environment) :\n\t" + e)
            println  ("EX-04_IoUtilService.getRepository(Environment environment) :\n\t" + e)
        } catch (Exception e) {
            log.error("EX-05_IoUtilService.getRepository(Environment environment) :\n\t" + e)
            println  ("EX-05_IoUtilService.getRepository(Environment environment) :\n\t" + e)
        }
        //println "repository: " + repository
        return repository
    }

    String getRepository(String moduleName, String subModuleName) {
        return getRepository()  + FS + getModuleSubModule(moduleName, subModuleName)
    }

    //----------------------------------------------------------------------------------------------------------------------------------------
    //      Image
    //----------------------------------------------------------------------------------------------------------------------------------------

    String getImageDirectory() {
        return getImageDirectory(Environment.current)
    }

    String getImageDirectory(Environment environment) {
        String path = null, defaultRepository = getDefaultRepository()  + FS + "images"
        try {
            if (environment.current == Environment.DEVELOPMENT)
                path = getSysProperty(IMAGE_PATH_DEVELOPMENT)? getSysProperty(IMAGE_PATH_DEVELOPMENT)?.propertyValue : defaultRepository
            else if (environment.current == Environment.TEST)
                path = getSysProperty(IMAGE_PATH_TEST)       ? getSysProperty(IMAGE_PATH_TEST)?.propertyValue        : defaultRepository
            else if (environment.current == Environment.PRODUCTION)
                path = getSysProperty(IMAGE_PATH_PRODUCTION) ? getSysProperty(IMAGE_PATH_PRODUCTION)?.propertyValue  : defaultRepository
        } catch (FileNotFoundException e) {
            log.error("EX-10_IoUtilService.getImageDirectory(Environment environment) :\n\t" + e)
            println  ("EX-10_IoUtilService.getImageDirectory(Environment environment) :\n\t" + e)
        } catch (Exception e) {
            log.error("EX-11_IoUtilService.getImageDirectory(Environment environment) :\n\t" + e)
            println  ("EX-11_IoUtilService.getImageDirectory(Environment environment) :\n\t" + e)
        }
        return path
    }

    String getImageDirectory(String moduleName, String subModuleName) {
        return getImageDirectory() + FS + getModuleSubModule(moduleName, subModuleName)
    }

    //----------------------------------------------------------------------------------------------------------------------------------------
    //      File
    //----------------------------------------------------------------------------------------------------------------------------------------

    String getFileDirectory() {
        return getImageDirectory(Environment.current)
    }

    String getFileDirectory(Environment environment) {
        String path = null, defaultRepository = getDefaultRepository()  + FS + "files"
        try {
            if (environment.current == Environment.DEVELOPMENT)
                path = getSysProperty(FILE_PATH_DEVELOPMENT)? getSysProperty(FILE_PATH_DEVELOPMENT)?.propertyValue : defaultRepository
            else if (environment.current == Environment.TEST)
                path = getSysProperty(FILE_PATH_TEST)       ? getSysProperty(FILE_PATH_TEST)?.propertyValue        : defaultRepository
            else if (environment.current == Environment.PRODUCTION)
                path = getSysProperty(FILE_PATH_PRODUCTION) ? getSysProperty(FILE_PATH_PRODUCTION)?.propertyValue  : defaultRepository
        } catch (FileNotFoundException e) {
            log.error("EX-10_IoUtilService.getFileDirectory(Environment environment) :\n\t" + e)
            println  ("EX-10_IoUtilService.getFileDirectory(Environment environment) :\n\t" + e)
        } catch (Exception e) {
            log.error("EX-11_IoUtilService.getFileDirectory(Environment environment) :\n\t" + e)
            println  ("EX-11_IoUtilService.getFileDirectory(Environment environment) :\n\t" + e)
        }
        return path
    }

    String getFileDirectory(String moduleName, String subModuleName) {
        return getFileDirectory() + FS + getModuleSubModule(moduleName, subModuleName)
    }

    //----------------------------------------------------------------------------------------------------------------------------------------
    //      Report
    //----------------------------------------------------------------------------------------------------------------------------------------

    String getReportDirectory() {
        return getReportDirectory(Environment.current)
    }

    String getReportDirectory(Environment environment) {
        String path = null, defaultRepository = getDefaultRepository()  + FS + "reports"
        try {
            if (environment.current == Environment.DEVELOPMENT)
                path = getSysProperty(REPORT_PATH_DEVELOPMENT)? getSysProperty(REPORT_PATH_DEVELOPMENT)?.propertyValue : defaultRepository
            else if (environment.current == Environment.TEST)
                path = getSysProperty(REPORT_PATH_TEST)       ? getSysProperty(REPORT_PATH_TEST)?.propertyValue        : defaultRepository
            else if (environment.current == Environment.PRODUCTION)
                path = getSysProperty(REPORT_PATH_PRODUCTION) ? getSysProperty(REPORT_PATH_PRODUCTION)?.propertyValue  : defaultRepository
        } catch (FileNotFoundException e) {
            log.error("EX-08_IoUtilService.getReportDirectory(Environment environment) :\n\t" + e)
            println  ("EX-08_IoUtilService.getReportDirectory(Environment environment) :\n\t" + e)
        } catch (Exception e) {
            log.error("EX-09_IoUtilService.getReportDirectory(Environment environment) :\n\t" + e)
            println  ("EX-09_IoUtilService.getReportDirectory(Environment environment) :\n\t" + e)
        }
        return path
    }

    String getReportDirectory(String moduleName, String subModuleName) {
        return getReportDirectory() + FS + getModuleSubModule(moduleName, subModuleName)
    }

    String getReportDirectory(String organization, String moduleName, String subModuleName) {
        return getReportDirectory() + FS + organization + FS + getModuleSubModule(moduleName, subModuleName)
    }

    //----------------------------------------------------------------------------------------------------------------------------------------
    //      Log
    //----------------------------------------------------------------------------------------------------------------------------------------

    String getLogPath() {
        return getLogPath(Environment.current)
    }

    String getLogPath(Environment environment) {
        String rootDirectory = getRootDir(), logPath = null
        try {
            if (environment.current == Environment.DEVELOPMENT){
                logPath = getSysProperty(LOG_PATH_DEV)  ? getSysProperty(LOG_PATH_DEV)?.propertyValue  : rootDirectory   + FS + "t_logs"
            }
            else if (environment.current == Environment.TEST){
                rootDirectory = getDirectory(System.getProperty("catalina.base") + FS + "logs")
                logPath = getSysProperty(LOG_PATH_TEST) ? getSysProperty(LOG_PATH_TEST)?.propertyValue : rootDirectory
            }
            else if (environment.current == Environment.PRODUCTION){
                rootDirectory = getDirectory(System.getProperty("catalina.base") + FS + "logs")
                logPath = getSysProperty(LOG_PATH_PROD) ? getSysProperty(LOG_PATH_PROD)?.propertyValue : rootDirectory
            }
        } catch (FileNotFoundException e) {
            log.error("EX-06_IoUtilService.getLogPath(Environment environment) :\n\t" + e)
            println  ("EX-06_IoUtilService.getLogPath(Environment environment) :\n\t" + e)
        } catch (Exception e) {
            log.error("EX-07_IoUtilService.getLogPath(Environment environment) :\n\t" + e)
            println  ("EX-07_IoUtilService.getLogPath(Environment environment) :\n\t" + e)
        }
        return logPath
    }

    File getLogFile() throws FileNotFoundException{
        return getFileList(getLogPath())?.getAt(0)
    }

    File getLogFile(String fileName) throws FileNotFoundException{
        return fileName ? getFile(getLogPath() + FS + fileName) : getLogFile()
    }

    //----------------------------------------------------------------------------------------------------------------------------------------
    //      Transaction (Create / Read / Write / Delete)
    //----------------------------------------------------------------------------------------------------------------------------------------

    List<String> readSmallFile(Path filePath){
        return Files.readAllLines(filePath)  //ex : String line32 = Files.readAllLines(Paths.get("file.txt")).get(32)
    }

    Stream<String> readLargeFile(Path filePath){
        /*
        * EX:
        * try (Stream<String> lines = Files.lines(Paths.get("file.txt"))) {
        *   line32 = lines.skip(31).findFirst().get();
        * }
        */
        return Files.lines(filePath)
    }

    String validateExistingDirectory(String path) {
        currentUser = springSecurityService.getCurrentUser()
        File existingDirectory = getDirectory(path)
        if (!existingDirectory.exists()) {
            try {
                existingDirectory.mkdirs()
                System.out.println("\r\n\tDirectory : " + path + " created successfully by \n\tUser ID   : " + currentUser?.id + " at \n\tTime      : " + new Date())
            } catch (Exception e) {
                println "EX-07_IoUtilService.validateExistingDirectory(String filePath) :\n" + e
            }
        }
        return existingDirectory
    }

    String validateExistingDirectory(File existingDirectory) {
        currentUser = springSecurityService.getCurrentUser()
        if (!existingDirectory.exists()) {
            try {
                existingDirectory.mkdirs()
                System.out.println("\tDirectory : " + existingDirectory?.name + " created successfully by \n\tUser ID : " + currentUser?.id + " at \n\tTime : " + new Date())
            } catch (Exception e) {
                println "EX-07_IoUtilService.validateExistingDirectory(String filePath) :\n" + e
            }
        }
        return existingDirectory
    }

    String validateExistingDirectory(String moduleName, String subModuleName) {
        String fileDestination = ""
        try {
            fileDestination = getRepository()  + FS + getModuleSubModule(moduleName, subModuleName)
        } catch (Exception e) {
            println "EX-08_IoUtilService.validateExistingDirectory(String moduleName, String subModuleName) :\n" + e
        }
        return fileDestination ? validateExistingDirectory(fileDestination) : null
    }

/**
 * @params validateFile(CommonsMultipartFile requestedFile, String[] contentType, Integer minSize, Integer maxSize)
 * @params contentType String[] - image/x-icon, image/gif etc or null.
 * @params return Map [status: true/false, messageType: warning/success, message: message]
**/

    String uploadContent(CommonsMultipartFile requestedFile, String path) throws FileNotFoundException, Exception {
        validateExistingDirectory(path)
        return transferFile(requestedFile, path)
    }

    Map validateFile(CommonsMultipartFile requestedFile, String[] contentType, long minSize, long maxSize) {
        boolean status = false
        String message = "", messageType = "warning", ct = requestedFile.contentType
        if (minSize && requestedFile.size <= minSize){
            message = "File size should greater than allowed size (" + maxSize + ")...!"
            return [status: status, messageType: messageType, message: message]
        }
        if (maxSize && requestedFile.size > maxSize){
            message = "File size should less than allowed size (" + maxSize + ")...!"
            return [status: status, messageType: messageType, message: message]
        }
        if(contentType && !contentType.toString().contains(ct)) {
            message = "Only file " + contentType.toString() + " types are allowed...!"
            return [status: status, messageType: messageType, message: message]
        }
        status = true
        return [status: status, messageType: "success", message: "Requested file is valid...!"]
    }

    String validateFileName(String fileName){
        return fileName.replaceAll("[^a-zA-Z0-9\\.\\-]", "_")
    }

    String generateFileName(CommonsMultipartFile requestedFile, String moduleName, String subModuleName, String prefix, HttpServletRequest request) {
        currentUser = springSecurityService.getCurrentUser()
        String  newFileName = '', extension = getFileExtension(requestedFile), currentDate = new SimpleDateFormat('yyMMdd').format(new Date()), fullPath = getRepository()  + FS + getModuleSubModule(moduleName, subModuleName)
        if (requestedFile.empty) {
            //flash.warning = "File could not be empty...!"
            println "File should not empty...!"
            return null
        }
        try {
            newFileName = ((subModuleName ? moduleName + "_" + subModuleName : moduleName) + (prefix ? "_" + prefix : "") + "_" + currentDate + "_" + currentUser.id.toString() + "_" + UUID.randomUUID() + extension).toLowerCase()
        } catch (Exception e) {
            println "Error - Failed to generate new file title :\n" + e
        }
        return newFileName
    }

    void printFileDetails(HttpServletRequest request, CommonsMultipartFile file, Map<String, Object> params) {
        params.putAll([
            "File Name (Original)"    : file?.originalFilename,
            "File Type (Content)"     : file?.contentType,
            "File Size"               : ((file?.size ?: 0) + " B"),
            "File Extension"          : getFileExtension(file),
            "Requested by User (ID)"  : currentUser.id.toString(),
            "Requested by User (Name)": currentUser.username,
            "Requested at"            : new Date()
        ])
        params.putAll(trackerService.getRequestInfo(request))
        utilityService.printDetails(params)
    }

    String uploadImage(CommonsMultipartFile requestedFile, String moduleName, String subModuleName, String prefix, String[] contentType, long allowedMinSize, long allowedMaxSize, HttpServletRequest request) throws FileNotFoundException, Exception {
        //todo: modify uploading system. Do not upload directly
        //todo: 1). Upload file to Temp Folder. 2). If transaction is commitable then transfer that file to server/repository.
        //todo: create a new method. uploadFileToTemp()

        String repository      = getImageDirectory(moduleName, subModuleName)
        String fileDestination = validateExistingDirectory(repository),
               newFileName     = generateFileName(requestedFile, moduleName, subModuleName, prefix, request)
        File newFilePath
        if(fileDestination) newFilePath = new File(repository + newFileName) else return null
        Map validationStatus   = validateFile(requestedFile, contentType, allowedMinSize, allowedMaxSize)
        printFileDetails(request, requestedFile, [
                "Validation Status": validationStatus,
                "Module Name"      : moduleName,
                "SubModule Name"   : subModuleName,
                "Prefix"           : prefix,
                "File Name (New)"  : newFileName,
                "File Destination" : fileDestination,
                "File Path (New)"  : newFilePath
        ])
        validationStatus?.status ? transferFile(requestedFile, newFilePath) : null
        return newFileName
    }

    String uploadFile(CommonsMultipartFile requestedFile, String moduleName, String subModuleName, String prefix, String[] contentType, long allowedMinSize, long allowedMaxSize, HttpServletRequest request) throws FileNotFoundException, Exception {
        //todo: modify uploading system. Do not upload directly
        //todo: 1). Upload file to Temp Folder. 2). If transaction is commitable then transfer that file to server/repository.
        //todo: create a new method. uploadFileToTemp()

        String repository      = getFileDirectory(moduleName, subModuleName)
        String fileDestination = validateExistingDirectory(repository),
               newFileName     = generateFileName(requestedFile, moduleName, subModuleName, prefix, request)
        File newFilePath
        if(fileDestination) newFilePath = new File(repository + newFileName) else return null
        Map validationStatus   = validateFile(requestedFile, contentType, allowedMinSize, allowedMaxSize)
        printFileDetails(request, requestedFile, [
            "Validation Status": validationStatus,
            "Module Name"      : moduleName,
            "SubModule Name"   : subModuleName,
            "Prefix"           : prefix,
            "File Name (New)"  : newFileName,
            "File Destination" : fileDestination,
            "File Path (New)"  : newFilePath
        ])
        validationStatus?.status ? transferFile(requestedFile, newFilePath) : null
        return newFileName
    }

    String updateFile(CommonsMultipartFile requestedFile, String moduleName, String subModuleName, String prefix, String[] contentType, long allowedMinSize, long allowedMaxSize, String existingFileName, HttpServletRequest request) throws FileNotFoundException, Exception {
        if (existingFileName) {
            if (requestedFile) {
                deleteFile(getFile(moduleName, subModuleName, existingFileName))
                uploadFile(requestedFile, moduleName, subModuleName, prefix, contentType, allowedMinSize, allowedMaxSize, request)
            } else {
                return null
            }
        } else if (requestedFile) {
            uploadFile(requestedFile, moduleName, subModuleName, prefix, contentType, allowedMinSize, allowedMaxSize, request)
        } else {
            deleteFile(getFile(moduleName, subModuleName, existingFileName))
            return null
        }
    }

    Boolean transferFile(CommonsMultipartFile requestedFile, File newPath) throws IllegalStateException {
        Boolean isTransferred = false
        try {
            requestedFile.transferTo(newPath)
            isTransferred = true
        } catch (Exception e) {
            println "Sorry, failed to transfer file @ path : " + newPath + "\n" + e
            isTransferred = false
        }
        return isTransferred
    }

    Boolean deleteFile(File file) {
        Boolean isDeleted = false
        try {
            file.delete()
            isDeleted = true
        } catch (FileNotFoundException e) {
            log.error("EX-13_IoUtilService.getRepository() :\n\t" + e)
            println  ("EX-13_IoUtilService.getRepository() :\n\t" + e)
        } catch (Exception e) {
            log.error("EX-14_IoUtilService.getRepository() :\n\t" + e)
            println  ("EX-14_IoUtilService.getRepository() :\n\t" + e)
        }
        return isDeleted
    }

    File getDefaultAvater(){
//        return new File(getCurrentWorkingDir() + "/web-app/resources/images/user_icon.jpg")   //todo: validate from ispp
        return new File(getRootDir() + "/web-app/resources/images/user/user.jpg")
    }

    MultipartFile getMultipartFile(File file) throws Exception, FileNotFoundException, IOException{
        return new CommonsMultipartFile("file", file.getName(), "image/jpeg", IOUtils.toByteArray(new FileInputStream(file)))
    }

    //https://stackoverflow.com/questions/7178937/java-bufferedimage-to-png-format-base64-string#25109418
    //https://stackoverflow.com/questions/28268511/convert-image-to-base64-with-java
    static String imgToBase64String(final RenderedImage img, final String formatName) {
        final ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            ImageIO.write(img, formatName, Base64.getEncoder().wrap(os));
            return os.toString(StandardCharsets.ISO_8859_1.name());
        } catch (final IOException ioe) {
            throw new UncheckedIOException(ioe);
        }
    }

    static BufferedImage base64StringToImg(final String base64String) {
        try {
            return ImageIO.read(new ByteArrayInputStream(Base64.getDecoder().decode(base64String)));
        } catch (final IOException ioe) {
            throw new UncheckedIOException(ioe);
        }
    }

    def downloadDoc(String moduleName, String subModuleName, String fileName, HttpServletResponse response) {
        File file
        if (fileName != "" && fileName != "null") {
            file = new File(getImageDirectory(moduleName, subModuleName) + fileName)
        }
        if (!file) {
            file = getDefaultAvater()
        }
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "filename=${file.name}")
            response.outputStream << file.bytes
        }
        return
    }

    def downloadFile(String fileName, HttpServletResponse response) {
        File file
        if (fileName != "" && fileName != "null") {
            file = new File(fileName)
        }
        if (file.exists()) {
            response.setContentType("application/octet-stream")
            response.setHeader("Content-disposition", "filename=${file.name}")
            response.outputStream << file.bytes
        }
        return
    }

//----------------------------------------------------------------------------------------------------------------------------------------
//      Writing to File : https://howtodoinjava.com/java/io/java-write-to-file/
//----------------------------------------------------------------------------------------------------------------------------------------
    static void writeToFile(File file, String content) throws IOException{
        writeToFile(file, content, "LESS_TRANSACTION")
    }

    static void writeToFile(File file, String content, String mode) throws IOException{
             if (mode == "FORMATTED")        writeFormattedContentToFile(file, content)
        else if (mode == "BINARY")           writeBinaryContentToFile(file, content)
        else if (mode == "PRIMITIVE")        writePrimitiveContentToFile(file, content)
        else if (mode == "LARGE_FILE")       writeLargeContentToFile(file, content)
        else if (mode == "MESS_TRANSACTION") writeToFileMessTransaction(file, content)
        else    (mode == "LESS_TRANSACTION") writeToFileLessTransaction(file, content)
    }

    static void writeToFileLessTransaction(File file, String content) throws IOException{
        FileWriter fileWriter = new FileWriter(file.getAbsolutePath());
        fileWriter.write(content);
        fileWriter.close();
    }

    static void writeToFileMessTransaction(File file, String content) throws IOException{
        BufferedWriter writer = new BufferedWriter(new FileWriter(file.getAbsolutePath()));
        writer.write(content);
        writer.close();
    }

    static void writeFormattedContentToFile(File file, String content) throws IOException{
        FileWriter  fileWriter  = new FileWriter(file.getAbsolutePath());
        PrintWriter printWriter = new PrintWriter(fileWriter);
        printWriter.print(content);
        printWriter.close();
    }

    static void writeBinaryContentToFile(File file, String content) throws IOException{
        FileOutputStream outputStream = new FileOutputStream(file.getAbsolutePath());
        byte[] strToBytes = content.getBytes();
        outputStream.write(strToBytes);
        outputStream.close();
    }

    static void writePrimitiveContentToFile(File file, String content) throws IOException{
        FileOutputStream outputStream = new FileOutputStream(file.getAbsolutePath());
        DataOutputStream dataOutStream = new DataOutputStream(new BufferedOutputStream(outputStream));
        dataOutStream.writeUTF(content);
        dataOutStream.close();
    }

    static void writeLargeContentToFile(File file, String content) throws IOException{
        RandomAccessFile stream = new RandomAccessFile(file.getAbsolutePath(), "rw");
        FileChannel channel = stream.getChannel();
        byte[] strBytes = content.getBytes();
        ByteBuffer buffer = ByteBuffer.allocate(strBytes.length);
        buffer.put(strBytes);
        buffer.flip();
        channel.write(buffer);
        stream.close();
        channel.close();
    }
//----------------------------------------------------------------------------------------------------------------------------------------
}
