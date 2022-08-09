<!--
 @Created_By : AALAA
 @Date       : 2022.05.19 01:22:12 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.nmMessageContent.pageTitle', default: 'Nm Message Content')}"/>
    <title><g:message code="label.org.title.show" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">

    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.show" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/nmMessageContent/index">
                <li>
                    <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/nmMessageContent/create">
                <li>
                    <g:link class="btn btn-xs btn-block btn-primary" action="create">
                        <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/nmMessageContent/edit/${nmMessageContentInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${nmMessageContentInstance?.id}">
                        <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/nmMessageContent/delete/${nmMessageContentInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${nmMessageContentInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
        <fieldset class="nmMessageContent-show">
            <div class="box box-primary">
                <div class="box-body">
                    <div class="show-page-content">

                        %{--<g:if test="${nmMessageContentInstance?.title}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.title" default="Title"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:fieldValue bean="${nmMessageContentInstance}" field="title"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${nmMessageContentInstance?.category}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.category" default="Category"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:fieldValue bean="${nmMessageContentInstance}" field="category"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${nmMessageContentInstance?.recipient}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.recipient" default="Recipient"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:fieldValue bean="${nmMessageContentInstance}" field="recipient"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${nmMessageContentInstance?.status}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.status" default="Status"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:fieldValue bean="${nmMessageContentInstance}" field="status"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${nmMessageContentInstance?.statusEntry}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.statusEntry" default="Status Entry"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:fieldValue bean="${nmMessageContentInstance}" field="statusEntry"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${nmMessageContentInstance?.activeFrom}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.activeFrom" default="Active From"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${nmMessageContentInstance?.activeFrom}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${nmMessageContentInstance?.activeTo}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.activeTo" default="Active To"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${nmMessageContentInstance?.activeTo}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${nmMessageContentInstance?.active}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.active" default="Active"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:formatBoolean boolean="${nmMessageContentInstance?.active}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${nmMessageContentInstance?.seenByUser}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.seenByUser" default="Seen By User"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:formatBoolean boolean="${nmMessageContentInstance?.seenByUser}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${nmMessageContentInstance?.seenAt}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.seenAt" default="Seen At"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${nmMessageContentInstance?.seenAt}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${nmMessageContentInstance?.logCreatedBy}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.logCreatedBy" default="Created By"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:fieldValue bean="${nmMessageContentInstance}" field="logCreatedBy"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${nmMessageContentInstance?.logCreatedDate}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.logCreatedDate" default="Created Date"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                <span class="property-value">
                                    <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${nmMessageContentInstance?.logCreatedDate}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--
                        <g:if test="${nmMessageContentInstance?.logModifiedBy}">
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                    <span class="property-label bold">
                                        <g:message code="label.nmMessageContent.logModifiedBy" default="Modified By"/>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                    <span class="property-value">
                                        <g:fieldValue bean="${nmMessageContentInstance}" field="logModifiedBy"/>&nbsp;
                                    </span>
                                </div>
                            </div>
                        </g:if>

                        <g:if test="${nmMessageContentInstance?.logModifiedDate}">
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                                    <span class="property-label bold">
                                        <g:message code="label.nmMessageContent.logModifiedDate" default="Modified Date"/>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                                    <span class="property-value">
                                        <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${nmMessageContentInstance?.logModifiedDate}"/>&nbsp;
                                    </span>
                                </div>
                            </div>
                        </g:if>
                        --}%

                        %{--<g:if test="${nmMessageContentInstance?.content}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <span class="property-label bold">
                                    <g:message code="label.nmMessageContent.content" default="Content"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <span class="property-value">
                                    <g:fieldValue bean="${nmMessageContentInstance}" field="content"/>&nbsp;
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
