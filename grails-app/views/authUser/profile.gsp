<!--
 @Created_By : AALAA
 @Date       : 2016.10.14 08:01:44 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<%@ page import="org.aalaa.auth.AuthMenu; org.aalaa.auth.AuthUser" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.authUser.profile', default: 'Profile')}"/>
    <title><g:message code="label.org.title" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">
    <section class="content-header">
        <h1><g:message code="label.authUser.myProfile" default="My Profile"/></h1>
        <ul class="top-links">
            <sec:access url="/authUser/index">
                <li>
                    <g:link class="btn btn-xs btn-block btn-vimeo" action="index" params="${[s: request?.session?.id]}">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.list" default="List"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/authUser/create">
                <li>
                    <g:link class="btn btn-xs btn-block btn-success" action="create" params="${[s: request?.session?.id]}">
                        <i class="fa fa-plus-circle "></i> <g:message code="default.button.new" default="New"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/authUser/show/${authUserInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-primary" action="show" title="Show" id="${authUserInstance?.id}">
                        <i class="fa fa-eye"></i> <g:message code="default.button.show" default="Show"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/authUser/edit/${authUserInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-warning" action="edit" params="${[s: request?.session?.id]}" id="${authUserInstance?.id}">
                        <i class="fa fa-fw fa-edit"></i><g:message code="default.button.edit" default="Edit"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/authUser/delete/${authUserInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" params="${[s: request?.session?.id]}" id="${authUserInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                        <i class="fa fa-trash"></i> <g:message code="default.button.delete" default="Delete"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section>

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section>

    <section class="content">
        <div class="box box-default" role="main">

            <div class="box-body no-padding">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 no-padding">
                    <g:render template="formPersonalInfo" model="${[authUserInstance: authUserInstance, authUserProfileInstance: authUserProfileInstance]}"/>
                </div>

                %{--
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <g:render template="formChangeImageAndSignature" model="${[authUserInstance: authUserInstance, authUserProfileInstance: authUserProfileInstance]}"/>
                </div>
                --}%

                %{--
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <g:render template="formAuthUserProperty" model="${[authUserInstance: authUserInstance, authUserPropertyInstance: authUserPropertyInstance]}"/>
                </div>
                --}%

                %{--
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <g:render template="formChangePassword" model="${[authUserInstance: authUserInstance]}"/>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <g:render template="formContactInfo" model="${[authUserInstance: authUserInstance]}"/>
                </div>
                --}%
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <g:render template="formAuthUserFavouriteMenuItem" model="${[authUserInstance: authUserInstance, authUserProfileInstance: authUserProfileInstance, authMenuList: authMenuList, authUserFavouriteMenuItemList: authUserFavouriteMenuItemList.sort{it.sortOrder}]}"/>
                </div>
                %{--</fieldset>--}%
            </div>
        </div>
    </section>
</div>
</body>
</html>