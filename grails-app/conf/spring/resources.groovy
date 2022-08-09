// Place your Spring DSL code here

beans = {
    //localeResolver(org.springframework.web.servlet.i18n.SessionLocaleResolver) {
    //    defaultLocale = new Locale("bn", "bn")
    //    java.util.Locale.setDefault(defaultLocale)
    //}
    /*authenticationSuccessHandler(nari.jplc.MyAuthSuccessHandlerController) {
        def conf = SpringSecurityUtils.securityConfig;
        requestCache = ref('requestCache');
        defaultTargetUrl = conf.successHandler.defaultTargetUrl;
        alwaysUseDefaultTargetUrl = conf.successHandler.alwaysUseDefault;
        targetUrlParameter = conf.successHandler.targetUrlParameter;
        useReferer = conf.successHandler.useReferer;
        redirectStrategy = ref('redirectStrategy');

        //adminUrl = "/home/index";
        //userUrl = "/jplcPublic/index";
    }*/
}
