<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <g:render template="/layouts/userPanelLeft"/>

        <!-- search form -->
        <sec:access url="/layouts/searchPanel">
            <g:if test="${session.getAttribute("USER_SHOW_SEARCH_BAR") && session.getAttribute("USER_SEARCH_BOX_MODE").equals(org.aalaa.sys.SearchBoxMode.LEFT)}">
                <g:render template="/layouts/searchPanel" model="${[sbm: "LEFT"]}"/>
            </g:if>
        </sec:access>

        %{--All Authenticated (dynamic) Menu--}%
        <ul class="sidebar-menu">
            %{--<li class="header">MAIN NAVIGATION</li>--}%
            ${raw(applicationContext.authUserService.authMenu)}
        </ul>

        %{--All Authenticated (HardCode) Menu--}%
        %{--
        <ul class="sidebar-menu">
            <g:render template="/layouts/authMenuLeft"/>
        </ul>
        --}%

    </section>  <!-- /.sidebar -->
</aside>  <!-- /.main-sidebar -->