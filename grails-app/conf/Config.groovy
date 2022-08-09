import java.text.SimpleDateFormat

// locations to search for config files that get merged into the main config;
// sys files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.sys.locations = [ "classpath:${appName}-sys.properties",
//                             "classpath:${appName}-sys.groovy",
//                             "file:${userHome}/.grails/${appName}-sys.properties",
//                             "file:${userHome}/.grails/${appName}-sys.groovy"]

// if (System.properties["${appName}.sys.location"]) {
//    grails.sys.locations << "file:" + System.properties["${appName}.sys.location"]
// }

grails.project.groupId = appName // change this to alter the default package title and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
    all          : '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom         : 'application/atom+xml',
    css          : 'text/css',
    csv          : 'text/csv',
    form         : 'application/x-www-form-urlencoded',
    html         : ['text/html', 'application/xhtml+xml'],
    js           : 'text/javascript',
    json         : ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss          : 'application/rss+xml',
    text         : 'text/plain',
    hal          : ['application/hal+json', 'application/hal+xml'],
    xml          : ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding    = 'UTF-8'
            htmlcodec   = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression  = 'html' // escapes values inside ${}
                scriptlet   = 'html' // escapes output from scriptlets in GSPs
                taglib      = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}

//https://grails.github.io/grails2-doc/2.5.6/ref/Database%20Mapping/column.html
/*
grails.gorm.default.mapping = {
    logCreatedBy    column: "LOG_CREATED_BY_ID"
    logModifiedBy   column: "LOG_MODIFIED_BY_ID"

    logCreatedDate  column: "LOG_CREATED_DATE" , sqlType: "date"
    logModifiedDate column: "LOG_MODIFIED_DATE", sqlType: "date"
}
*/


//https://grails.github.io/grails2-doc/2.5.6/ref/Constraints/Usage.html
/*
grails.gorm.default.constraints = {
    active          nullable: false
    logCreatedBy    nullable: false, display: false
    logCreatedDate  nullable: false, display: false

    logModifiedBy   nullable: true , display: false
    logModifiedDate nullable: true , display: false
}
*/


grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart = false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

//======================================================================================================================================================
//          Standard Format's for this admProject
//------------------------------------------------------------------------------------------------------------------------------------------------------
format.dtp.time         = 'hh:mm:ss tt'
format.dtp.time12       = 'hh:mm a'
format.dtp.time24       = 'hh:mm'
format.dtp.date         = 'yyyy-MM-dd'
format.dtp.dateUi       = 'yyyy-mm-dd'
format.dtp.dateTime12   = 'yyyy-MM-dd HH:mm a'
format.dtp.dateTime24   = 'yyyy-MM-dd HH:mm'
format.dtp.dateTime12ui = 'YYYY-MM-DD HH:mm A'
format.dtp.dateTime24ui = 'YYYY-MM-DD HH:mm'
format.dtp.year         = 'yyyy'
format.printDate        = 'yyMMdd-hhmm'
show.item.min           = 15
show.item.max           = 100
prop.db.dbCreate        = 'update'  //update, create
//======================================================================================================================================================

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j.main = {
    appenders {
        String day = (new SimpleDateFormat("yyMMdd").format(new Date())), l4jRoot = ""
        try {
            if(grails.util.Environment.current.equals(grails.util.Environment.DEVELOPMENT)){
                l4jRoot = 'target/logs' + File.separator + "Error-" + day + ".log"
            }
            else if(grails.util.Environment.current.equals(grails.util.Environment.PRODUCTION)){
                //l4jRoot = new File('/').getParent() + File.separator + "logs" + File.separator
                l4jRoot = "customLogs" + File.separator + "Error-" + day + ".log"
            }
        } catch (Exception e) {
            println e
        }
        rollingFile  name:'logError' , file: l4jRoot, threshold:org.apache.log4j.Level.ERROR,layout: pattern(conversionPattern:"%d{yyyy-MM-dd HH:mm:ss} %-5p %c{2}:%L - %m%n"),maxFileSize:(1024*1024)//, maxBackupIndex:10
    }

    root {
        error 'logError'
    }

    error 'org.codehaus.groovy.grails.web.servlet',             // controllers
          'org.codehaus.groovy.grails.web.pages',               // GSP
          'org.codehaus.groovy.grails.web.sitemesh',            // layouts
          'org.codehaus.groovy.grails.web.mapping.filter',      // URL mapping
          'org.codehaus.groovy.grails.web.mapping',             // URL mapping
          'org.codehaus.groovy.grails.commons',                 // core / classloading
          'org.codehaus.groovy.grails.plugins',                 // plugins
          'org.codehaus.groovy.grails.orm.hibernate',           // hibernate integration
          'org.springframework',
          'org.hibernate',
          'net.sf.ehcache.hibernate'
}

grails.plugin.springsecurity.securityConfigType                 = 'Requestmap'
grails.plugin.springsecurity.requestMap.className               = 'org.aalaa.auth.AuthRequestMap'
grails.plugin.springsecurity.userLookup.userDomainClassName     = 'org.aalaa.auth.AuthUser'
grails.plugin.springsecurity.authority.className                = 'org.aalaa.auth.AuthRole'
grails.plugin.springsecurity.userLookup.authorityJoinClassName  = 'org.aalaa.auth.AuthUserLkRole'
grails.plugin.springsecurity.active                             = true
grails.plugin.springsecurity.rejectIfNoRule                     = true
grails.plugin.springsecurity.logout.postOnly                    = false
grails.plugin.springsecurity.debug.useFilter                    = false //to see what the plugin is doing or debugging
