class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(  controller: "authHome" , action: "index")     //AALAA
        "401"(controller: 'login'    , action: 'auth')      //if logout button is clicked > 401 (Unauthorized) is returned...!
       
        "400"(controller: 'sysThrowable', action: '_400')
        "401"(controller: 'sysThrowable', action: '_401')
        "403"(controller: 'sysThrowable', action: '_403')
        "404"(controller: 'sysThrowable', action: '_404')
        "405"(controller: 'sysThrowable', action: '_405')
        "407"(controller: 'sysThrowable', action: '_407')
        "408"(controller: 'sysThrowable', action: '_408')
        "414"(controller: 'sysThrowable', action: '_414')
        "415"(controller: 'sysThrowable', action: '_415')
        "424"(controller: 'sysThrowable', action: '_424')
        "423"(controller: 'sysThrowable', action: '_423')
        "426"(controller: 'sysThrowable', action: '_426')
        "429"(controller: 'sysThrowable', action: '_429')
        "440"(controller: 'sysThrowable', action: '_440')
        "450"(controller: 'sysThrowable', action: '_450')
        "500"(controller: 'sysThrowable', action: '_500')
        "502"(controller: 'sysThrowable', action: '_502')
        "503"(controller: 'sysThrowable', action: '_503')
        "504"(controller: 'sysThrowable', action: '_504')
        "505"(controller: 'sysThrowable', action: '_505')
        "507"(controller: 'sysThrowable', action: '_507')
        "508"(controller: 'sysThrowable', action: '_508')
        "509"(controller: 'sysThrowable', action: '_509')
        "511"(controller: 'sysThrowable', action: '_511')
        "530"(controller: 'sysThrowable', action: '_530')
    }
}
