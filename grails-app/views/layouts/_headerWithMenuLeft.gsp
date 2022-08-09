<!-- Main Header -->
<header class="main-header">
    <!-- Logo -->
    <a href="${request.contextPath}/" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>WG</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Walton Group</b>&nbsp;</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

        <!-- search form -->
        <g:if test="${applicationContext.authUserService.showSearchBar && applicationContext.authUserService.getSearchBoxMode().equals(org.aalaa.sys.SearchBoxMode.TOP)}">
            <g:render template="/layouts/searchPanel" model="${[sbm: "TOP"]}"/>
        </g:if>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="sessionTimer" title="Session Time Remaining">
                    <span><i class='fa fa-clock-o'></i></span>
                    <span id="sessionTimer"></span>
                </li>

                <g:if test="${applicationContext.authUserService.showMessage}">
                    <g:render template="/layouts/listMessage"/>
                </g:if>

                <g:if test="${applicationContext.authUserService.showNotification}">
                    <g:render template="/layouts/listNotification"/>
                </g:if>

                <g:if test="${applicationContext.authUserService.showTaskList}">
                    <g:render template="/layouts/listTask"/>
                </g:if>

                <g:render template="/layouts/userPanelTop"/>
            </ul>
        </div>
    </nav>
</header>
<g:render template="/layouts/sideBarLeft" model="${[menuType: menuType]}"/>
