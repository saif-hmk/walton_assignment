/**
 * @Created_By  : AALAA
 * @Date        : 2017.12.07 01:09:55 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-System-Info.js
 * @Dependencies: Jquery.js, AALAA.js
 * @LastModified: 18.05.04
 * @version     : 1.3
 **/
/*==================================================================================================================================================*/

var pathname    = window.location.pathname;     // /reflection/authUser/edit/1
var url         = window.location.href;         // http://localhost:8090/reflection/authUser/edit/9999
var userAgent   = window.navigator.userAgent;   // Firefox/31.0
var protocol    = window.navigator.protocol;    // "https:"
var host        = window.navigator.host;        // "localhost"
var port        = window.navigator.port;        // "8090"
var search      = window.navigator.search;      // "?username=admin"
var hash        = window.navigator.hash;        // ""
var origin      = window.navigator.origin;      // "https://reflection.com"
var height      = window.screen.height;         // 1024
var width       = window.screen.width;          // 1280
var availHeight = window.screen.availHeight;    // 995
var availWidth  = window.screen.availWidth;     // 1280
var colorDepth  = window.screen.colorDepth;     // 24

function getHost() {
    return window.navigator.host;   // "localhost"
}

function getPort() {
    return window.navigator.port;   // "8090"
}

function getProtocol() {
    return window.navigator.protocol;   // "https:"
}

function getOrigin() {
    return window.navigator.origin; // "https://reflection.com"
}

function getUserAgent() {
    return window.navigator.userAgent;  // Firefox/31.0
}

function getSearch() {
    return window.navigator.search; // "?username=admin"
}

function getHash() {
    return window.navigator.hash;   // ""
}

function getHref() {
    return window.location.href;    // http://localhost:8090/reflection/authUser/edit/9999
}

function getPathname() {
    return window.location.pathname;    // /reflection/authUser/edit/1
}

function getScreenHeight() {
    return window.screen.height;    // 1024
}

function getScreenWidth() {
    return window.screen.width; // 1280
}

function getScreenAvailHeight() {
    return window.screen.availHeight;   // 995
}

function getScreenAvailWidth() {
    return window.screen.availWidth;    // 1280
}

function getScreenColorDepth() {
    return window.screen.colorDepth;    // 24
}

//---------------------------------------------------------------------------------------------------------------------------------------------------
//alert(getObjectDetails(navigator))
//alert(navigator.userAgent);
//alert(navigator.appVersion);

//Browser/OS Detection
function getOs() {
    var osName = "Unknown OS";
         if (navigator.appVersion.indexOf("Win") != -1)   osName = "Windows";
    else if (navigator.appVersion.indexOf("Mac") != -1)   osName = "MacOS";
    else if (navigator.appVersion.indexOf("X11") != -1)   osName = "UNIX";
    else if (navigator.appVersion.indexOf("Linux") != -1) osName = "Linux";
    return osName
}

//Browser/OS Detection
(function () {
    var BrowserDetect = {
        init: function () {
            this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
            this.version = this.searchVersion(navigator.userAgent) || this.searchVersion(navigator.appVersion) || "an unknown version";
            this.OS = this.searchString(this.dataOS) || "an unknown OS";
        },
        searchString: function (data) {
            for (var i = 0; i < data.length; i++) {
                var dataString = data[i].string;
                var dataProp = data[i].prop;
                this.versionSearchString = data[i].versionSearch || data[i].identity;
                if (dataString) {
                    if (dataString.indexOf(data[i].subString) != -1)
                        return data[i].identity;
                }
                else if (dataProp)
                    return data[i].identity;
            }
        },
        searchVersion: function (dataString) {
            var index = dataString.indexOf(this.versionSearchString);
            if (index == -1) return;
            return parseFloat(dataString.substring(index + this.versionSearchString.length + 1));
        },
        dataBrowser: [
            {
                string   : navigator.userAgent,
                subString: "Chrome",
                identity : "Chrome"
            },
            {
                string       : navigator.userAgent,
                subString    : "OmniWeb",
                versionSearch: "OmniWeb/",
                identity     : "OmniWeb"
            },
            {
                string       : navigator.vendor,
                subString    : "Apple",
                identity     : "Safari",
                versionSearch: "Version"
            },
            {
                prop    : window.opera,
                identity: "Opera"
            },
            {
                string    : navigator.vendor,
                subString : "iCab",
                identity  : "iCab"
            },
            {
                string    : navigator.vendor,
                subString : "KDE",
                identity  : "Konqueror"
            },
            {
                string: navigator.userAgent,
                subString: "Firefox",
                identity: "Firefox"
            },
            {
                string: navigator.vendor,
                subString: "Camino",
                identity: "Camino"
            },
            {       // for newer Netscapes (6+)
                string: navigator.userAgent,
                subString: "Netscape",
                identity: "Netscape"
            },
            {
                string: navigator.userAgent,
                subString: "MSIE",
                identity: "IE",
                versionSearch: "MSIE"
            },
            {
                string: navigator.userAgent,
                subString: "Gecko",
                identity: "Mozilla",
                versionSearch: "rv"
            },
            {       // for older Netscapes (4-)
                string: navigator.userAgent,
                subString: "Mozilla",
                identity: "Netscape",
                versionSearch: "Mozilla"
            }
        ],
        dataOS: [
            {
                string: navigator.platform,
                subString: "Win",
                identity: "Windows"
            },
            {
                string: navigator.platform,
                subString: "Mac",
                identity: "Mac"
            },
            {
                string: navigator.userAgent,
                subString: "iPhone",
                identity: "iPhone/iPod"
            },
            {
                string: navigator.platform,
                subString: "Linux",
                identity: "Linux"
            }
        ]
    };

    BrowserDetect.init();

    window.$.client = {
        OS: BrowserDetect.OS,
        Browser: BrowserDetect.browser,
        Version: BrowserDetect.version
    };

})();
//---------------------------------------------------------------------------------------------------------------------------------------------------
