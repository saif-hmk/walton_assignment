<%@ page import="org.aalaa.auth.Availability" %>
<!-- Sidebar user panel -->
<div class="user-panel">
    <div class="pull-left image">
        <img src="${applicationContext.springSecurityService?.currentUser?.username == "hmk" ? resource(dir: "resources/images/user", file: "saif_khan.jpg") : (resource(dir: "resources/images/user", file: "user.jpg"))}" class="img-circle" alt="User Image">
    </div>

    <div class="pull-left info">
        <p>${applicationContext.springSecurityService?.currentUser?.displayName}</p>
        <g:set var="status" value="${session.getAttribute("USER_AVAILABILITY")}"/>
        <g:if test="${status.equals(org.aalaa.auth.Availability.ONLINE)}">
            <a href="#"><i class="fa fa-circle text-success"></i>${status}</a>
        </g:if>
        <g:elseif test="${status.equals(org.aalaa.auth.Availability.AWAY)}">
            <a href="#"><i class="fa fa-circle text-yellow"></i>${status}</a>
        </g:elseif>
        <g:elseif test="${status.equals(org.aalaa.auth.Availability.BUSY)}">
            <a href="#"><i class="fa fa-circle text-danger"></i>${status}</a>
        </g:elseif>
        <g:elseif test="${status.equals(org.aalaa.auth.Availability.LEAVE)}">
            <a href="#"><i class="fa fa-circle text-aqua"></i>${status}</a>
        </g:elseif>
        <g:elseif test="${status.equals(org.aalaa.auth.Availability.INVISIBLE)}">
            <a href="#"><i class="fa fa-circle text-muted"></i>${status}</a>
        </g:elseif>
    </div>
</div>