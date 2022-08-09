/**
 * @Created_By  : AALAA
 * @Date        : 2017.12.07 9:55:17 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Content-Loader.js
 * @Dependencies: Jquery.js, AALAA.js
 * @LastModified: 17.12.08
 * @version     : 1.2
 **/
/*==================================================================================================================================================*/

/*
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 * Note : Make sure jQuery has been loaded before AALAA.js
 * --------------------------------------------------------------------------------------------------------------------------------------------------
 */
function loadJsCssFile(fileType, fileName) {
    if (fileType.toLowerCase() == "js") { //if fileName is a external JavaScript file
        var fileRef = document.createElement('script');
        fileRef.setAttribute("type", "text/javascript");
        fileRef.setAttribute("src", fileName)
    }
    else if (fileType.toLowerCase() == "css") { //if fileName is an external CSS file
        var fileRef = document.createElement("link");
        fileRef.setAttribute("rel", "stylesheet");
        fileRef.setAttribute("type", "text/css");
        fileRef.setAttribute("href", fileName)
    }
    if (typeof fileRef != "undefined")
        document.getElementsByTagName("head")[0].appendChild(fileRef)
}
var filesAdded = ""; //list of files already added
function checkLoadJsCssFile(fileType, fileName) {
    if (filesAdded.indexOf("[" + fileName + "]") == -1) {
        loadJsCssFile(fileType, fileName);
        filesAdded += "[" + fileName + "]" //List of files added in the form "[filename1],[filename2],etc"
    }
    else
        //alert("file already added!")
        aalaaAlert({type: "MESSAGE", content: "File already added...!"});
}
//---------------------------------------------------------------------------------------------------------------------------------------------------
