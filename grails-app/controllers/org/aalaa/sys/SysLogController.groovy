package org.aalaa.sys

import org.aalaa.com.IoUtilService
import org.apache.commons.io.FileUtils
import org.apache.commons.io.input.ReversedLinesFileReader

import java.text.SimpleDateFormat

class SysLogController {
    IoUtilService ioUtilService

    def index() {
        SimpleDateFormat sdf      = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        String     filePath       = params.fileName ? ioUtilService.getFilesDirectory(ioUtilService.getLogFile(params.fileName)) : ioUtilService.getLogPath()
        File       file           = ioUtilService.getLogFile(params.fileName)

        Map        fileSize       = null
        String     fileName       = null
        Long       totalLine      = null,
                   totalCharacter = null
        List<File> fileList       = null

        if(file && file?.size()){
            fileSize       = ioUtilService.getFileSize(file)
            fileName       = ioUtilService.getFileName(file)
            totalLine      = ioUtilService.getLineCount(file)
            totalCharacter = ioUtilService.getFileLength(file)
            fileList       = ioUtilService.getFileList(filePath)

            //-----------------------------------------------------------------------------------------------
            Integer showLine = params.showLine ? Integer.parseInt(params.showLine) : 300, showing = showLine, startFromLine = 0, counter = 0
            String currentLine, sortingOrder = params.sortingOrder ?: "asc", viewMode = params.viewMode ?: "plainText", logType = params.logType, keyword = params.keyword, fromTime = params.fromTime, toTime = params.toTime
            //-----------------------------------------------------------------------------------------------
            StringBuilder log = new StringBuilder()
            if(sortingOrder == "desc"){
                if (totalLine < showLine) showing = totalLine
                try  {
                    ReversedLinesFileReader fr = new ReversedLinesFileReader(file)
                    while ((currentLine = fr.readLine()) != null) {
                        if (counter == showLine || currentLine == null)
                            break
                        log.append(currentLine).append("\n")
                        counter++
                    }
                } catch (IOException e) {
                    e.printStackTrace()
                }
            }
            else{
                if (totalLine > showLine) startFromLine = totalLine - showLine else showing = totalLine
                try  {
                    BufferedReader br = new BufferedReader(new FileReader(file))
                    for (int i = startFromLine; i < totalLine; i++){
                        String lineText = br.readLine(), lineLogType = ""
                        Date   writeTime = null
                        if(lineText.size() >= 25){
                            try {
                                writeTime   = sdf.parse(lineText.substring(0,19))
                            } catch (Exception e) {}
                            lineLogType = lineText.substring(20,25).trim()
                        }
                        if(!params.logType || params.logType == "ALL"){
                            log.append(lineText).append("\n")
                        }
                        else if(writeTime && ["DEBUG", "ERROR", "FATAL", "INFO", "TRACE", "WARNING"].contains(lineLogType) && lineLogType == params.logType){
                            log.append(lineText).append("\n")
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace()
                }
            }
        }

        [
            "filePath"     : filePath,
            //"file"          : file,
            "fileList"      : fileList,
            "fileName"      : fileName,
            "fileSize"      : fileSize? (fileSize.kb + " kb / " + fileSize.mb + " MB / " + fileSize.gb + " GB") : "",
            "filesInPath"   : fileList?.name,
//            "fromTime"      : fromTime,
//            "keyword"       : keyword,
//            "logType"       : logType,
//            "showLine"      : showLine,
//            "showing"       : showing,
//            "sortingOrder"  : sortingOrder,
//            "toTime"        : toTime,
            "totalCharacter": totalCharacter,
            "totalLine"     : totalLine,
//            "viewMode"      : viewMode,
            v               : log
        ]
    }

    def download(){
        println "Params: " + params
        String  filePath = params.fileName ? ioUtilService.getLogFile(params.fileName) : ioUtilService.getLogPath()
        return ioUtilService.downloadFile(filePath, response)
    }
}
