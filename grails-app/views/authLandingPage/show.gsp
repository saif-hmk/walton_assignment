%{--<%@ page import="org.aalaa.auth.AuthLandingPage" %>--}%

%{--
@Created_By : AALAA
@Date       : 2017.10.05 01:21:27 AM
@Author     : Md. Hoshen Mahmud Khan
@Email      : saif_hmk@live.com
@Phone      : +8801672036757
--}%

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'authLandingPage.pageTitle.label', default: 'Auth Landing Page')}"/>
        <title><g:message code="default.argsButton.show" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">

            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.show" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/authLandingPage/index">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                                <i class="fa fa-reorder"></i> <g:message code="default.button.list" default="List"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/authLandingPage/create">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-primary" action="create">
                                <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/authLandingPage/edit/${authLandingPageInstance?.id}">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${authLandingPageInstance?.id}">
                                <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/authLandingPage/delete/${authLandingPageInstance?.id}">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${authLandingPageInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
                <fieldset class="authLandingPage-show">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="show-page-content">

                                %{--<g:if test="${authLandingPageInstance?.isActive}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                        <span class="property-label bold">
                                            <g:message code="authLandingPage.isActive.label" default="Is Active"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                        <span class="property-value">
                                            <g:formatBoolean boolean="${authLandingPageInstance?.active}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${authLandingPageInstance?.uri}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                        <span class="property-label bold">
                                            <g:message code="authLandingPage.uri.label" default="Uri"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                        <span class="property-value">
                                            <g:fieldValue bean="${authLandingPageInstance}" field="uri"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${authLandingPageInstance?.priority}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                        <span class="property-label bold">
                                            <g:message code="authLandingPage.priority.label" default="Priority"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                        <span class="property-value">
                                            <g:fieldValue bean="${authLandingPageInstance}" field="priority"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${authLandingPageInstance?.remarks}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                        <span class="property-label bold">
                                            <g:message code="authLandingPage.remarks.label" default="Remarks"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                        <span class="property-value">
                                            <g:fieldValue bean="${authLandingPageInstance}" field="remarks"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%
                            </div>
                        </div><!-- /.box-body -->
                    </div>  <!-- /.box box-primary -->
                </fieldset>

                
            </section><!-- /.content -->
        </div>
    </body>
</html>