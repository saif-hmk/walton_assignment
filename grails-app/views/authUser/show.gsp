<!--
 @Created_By : AALAA
 @Date       : 2021.12.08 05:13:55 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.authUser.pageTitle', default: 'Auth User')}"/>
    <title><g:message code="label.org.title.show" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">

    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.show" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/authUser/index">
                <li>
                    <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/authUser/create">
                <li>
                    <g:link class="btn btn-xs btn-block btn-primary" action="create">
                        <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/authUser/create/${authUserInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-warning" action="create" id="${authUserInstance?.id}" params="${[at: params.at ?: "up", ui: authUserInstance?.id]}">
                        <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/authUser/delete/${authUserInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${authUserInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                        <i class="fa fa-trash"></i> <g:message code="default.button.delete" default="Delete"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content show-page"><!-- Main content -->
        <fieldset class="authUser-show">
            <div class="box box-primary">
                <div class="box-body">
                    <g:render template="userProfile" model="${[authUserInstance: authUserInstance, authUserProfileInstance: authUserInstance?.authUserProfile, authUserLkEmployeeInstance: authUserInstance?.authUserLkEmployee]}"/>
                </div><!-- /.box-body -->
            </div>  <!-- /.box box-primary -->
        </fieldset>
    </section><!-- /.content -->
</div>
</body>
</html>
