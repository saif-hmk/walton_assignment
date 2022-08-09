grails.servlet.version          = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.plugins.dir      = "target/plugins"
grails.project.war.file         = "target/war/${appName}.war"
grails.project.class.dir        = "target/classes"
grails.project.test.class.dir   = "target/test-classes"
grails.project.work.dir         = "target/work"
grails.project.target.level     = 1.6
grails.project.source.level     = 1.6
grails.server.port.http         = 9091
grails.server.session.timeout   = 30

grails.project.fork = [
        // configure settings for compilation JVM, note that if you alter the Groovy version forked compilation is required
        //  compile: [maxMemory: 256, minMemory: 64, debug: false, maxPerm: 256, daemon:true],

        // configure settings for the test-app JVM, uses the daemon by default
        test: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, daemon:true],
        // configure settings for the run-app JVM
        run: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
        // configure settings for the run-war JVM
        war: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256, forkReserve:false],
        // configure settings for the Console UI JVM
        console: [maxMemory: 768, minMemory: 64, debug: false, maxPerm: 256]
]

grails.project.dependency.resolver = "maven" // or ivy
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log        "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()
        mavenLocal()
        mavenCentral()
        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
        mavenRepo "http://repo.grails.org/grails/plugins"
        mavenRepo "http://jasperreports.sourceforge.net"
        mavenRepo "https://mvnrepository.com/artifact/com.itextpdf/itextpdf"
        mavenRepo "https://mvnrepository.com/artifact/org.webjars/webjars-locator"
    }

    dependencies {
        test "org.grails:grails-datastore-test-support:1.0.2-grails-2.4"

        //WebJar
        runtime 'org.webjars:webjars-locator:0.35'

        //Jasper Report
        //runtime 'net.sf.jasperreports:jasperreports:6.13.0'
        runtime 'net.sf.jasperreports:jasperreports:6.17.0'

        //iTextPdf
        //runtime 'com.itextpdf:itextpdf:5.5.13'
        runtime 'com.itextpdf:itextpdf:jar:5.5.13.2'
        //runtime 'com.itextpdf:itextpdf:jar:5.5.13.1'

        //tomcat-embed-core
        //build 'org.apache.tomcat.embed:tomcat-embed-core:jar:9.0.29'

        // JAX-B dependencies for JDK 9+
        //https://stackoverflow.com/questions/43574426/how-to-resolve-java-lang-noclassdeffounderror-javax-xml-bind-jaxbexception-in-j
        runtime "javax.xml.bind:jaxb-api:2.2.11"
        runtime "com.sun.xml.bind:jaxb-core:2.2.11"
        runtime "com.sun.xml.bind:jaxb-impl:2.2.11"
        runtime "javax.activation:activation:1.1.1"

        /**
         * Apache Commons Net library contains a collection of network utilities and protocol implementations.
         * Supported protocols include: Echo, Finger, FTP, NNTP, NTP, POP3(S), SMTP(S), Telnet, Whois
         **/
        //https://mvnrepository.com/artifact/commons-net/commons-net
        runtime "commons-net:commons-net:3.7.2"

        // https://mvnrepository.com/artifact/org.apache.httpcomponents/httpclient
        //runtime 'org.apache.httpcomponents:httpclient:4.5.13'

        // https://mvnrepository.com/artifact/com.mashape.unirest/unirest-java
        runtime 'com.mashape.unirest:unirest-java:1.4.9'

        // https://mvnrepository.com/artifact/javax.mail/javax.mail-api
        runtime 'javax.mail:javax.mail-api:1.6.2'
    }

    plugins {
        // plugins for the build system only
//        build ":tomcat:7.0.55.3" // or ":tomcat:8.0.22"
        build ":tomcat:7.0.70" // or ":tomcat:8.0.22"

        // plugins for the compile step
        compile ":scaffolding:2.1.2"
        compile ':cache:1.1.8'
        compile ":asset-pipeline:2.5.7"
        compile ':spring-security-core:2.0.0'

        // plugins needed at runtime but not for compilation
        //runtime ":hibernate4:4.3.5.5"
        runtime ":hibernate4:4.3.10"
//        runtime ":database-migration:1.4.2-SNAPSHOT"
        runtime ":database-migration:1.4.1"
        runtime ":resources:1.2.14"
    }
}
