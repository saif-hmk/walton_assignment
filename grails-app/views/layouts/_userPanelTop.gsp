<style>
@media (min-width: 768px) {
    .navbar-nav > li > a.webSite {
        padding-top: 12px !important;
        padding-bottom: 8px !important;
    }
}

@media (max-width: 767px) {
    .navbar-nav > li > a.webSite {
        padding-top: 9px !important;
        padding-bottom: 11px !important;
    }
}
</style>
<li>
    <g:link class="webSite" url="https://waltonbd.com/" target="_blank" title="About Walton Group">
        <i class="fa fa-2x fa-globe"></i>
    </g:link>
</li>
<li class="dropdown user user-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <img src="${applicationContext.springSecurityService?.currentUser?.username == "hmk" ? resource(dir: "resources/images/user", file: "saif_khan.jpg") : (resource(dir: "resources/images/user", file: "user.jpg"))}" class="user-image" alt="User Image">
        <span class="hidden-xs">${applicationContext.springSecurityService?.currentUser?.displayName}</span>
    </a>
    <ul class="dropdown-menu">
        <!-- User image -->
        <li class="user-header">
            <p>
                <g:if test="${session.getAttribute("USER_ORGANIZATION")}">
                    <span class="italic" style="font-size: 16px">${session.getAttribute("USER_ORGANIZATION")}</span>
                </g:if>
                <g:else>
                    ${applicationContext.authUserService.initializeUserProperty(session,request)}
                </g:else>
                <span class="br italic" style="font-size: 14px">${applicationContext.springSecurityService?.currentUser?.fullName}</span>
                <g:if test="${applicationContext.springSecurityService?.currentUser?.phone}">
                    <small class="br">${applicationContext.springSecurityService?.currentUser?.phone}</small>
                </g:if>
                <g:if test="${applicationContext.springSecurityService?.currentUser?.email}">
                    <small class="br">${applicationContext.springSecurityService?.currentUser?.email}</small>
                </g:if>
                <g:set var="branch" value="${session.getAttribute("USER_BRANCHES")}"/>
                <g:if test="${branch}">
                    <small class="br underline bold" style="font-size: 13px">Permitted Branches:</small>
                    <g:if test="${branch.size() <= 3}">
                        <small class="br underline">${branch}</small>
                    </g:if>
                    <g:elseif test="${branch.size() > 2 && branch.size() <= 6 }">
                        <small class="br underline">${branch?.titleShort}</small>
                    </g:elseif>
                    <g:else>
                        <g:if test="${branch?.title?.contains("Head Office") && branch?.title?.contains("Local Office")}">
                            <small>Head Office, Local Office & ${branch.size() - 2} others.</small>
                        </g:if>
                        <g:elseif test="${branch?.title?.contains("Head Office") && !branch?.title?.contains("Local Office")}">
                            <small>Head Office & ${branch.size() - 1} others.</small>
                        </g:elseif>
                        <g:elseif test="${!branch?.title?.contains("Head Office") && branch?.title?.contains("Local Office")}">
                            <small>Local Office & ${branch.size() - 1} others.</small>
                        </g:elseif>
                        <g:else>
                            <small>Total ${branch.size()} Branch(es)</small>
                        </g:else>
                    </g:else>
                </g:if>
            </p>
        </li>
        <!-- Menu Body -->
        <sec:access url="/authUser/profile">
        <li class="user-body">
            <div class="row">
                <div class="col-xs-4 text-center">
                    <a href="${request?.contextPath}/authUser/profile/${applicationContext?.springSecurityService?.currentUser?.id}">My Profile</a>
                </div>
            </div>
            <!-- /.row -->
        </li>
        </sec:access>
        <!-- Menu Footer-->
        <li class="user-footer">
            <div class="pull-left">
                <g:link controller="authUser" action="changePassword" class="btn btn-block btn-success"><i class="fa fa-cog"></i> Change password</g:link>
            </div>

            <div class="pull-right">
                <g:link controller="logout" class="btn btn-block btn-danger"><i class="fa fa-power-off"></i> Sign out</g:link>
            </div>
        </li>
    </ul>
</li>
<!-- Control Sidebar Toggle Button -->

<li>
    <a href="javascript:void(0);" class="waves-effect waves-button waves-classic toggle-fullscreen">
        <i class="fa fa-expand"></i>
    </a>
</li>

<!-- Control Sidebar Toggle Button -->
<li>
    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
</li>
