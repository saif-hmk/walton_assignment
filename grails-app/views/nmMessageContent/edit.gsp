<!--
 @Created_By : AALAA
 @Date       : 2022.05.19 01:22:11 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.nmMessageContent.pageTitle', default: 'Nm Message Content')}"/>
    <title><g:message code="label.org.title.edit" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.edit" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/nmMessageContent/index">
                <li>
                    <g:link class="btn btn-block btn-vimeo btn-xs" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/nmMessageContent/create">
                <li>
                    <g:link class="btn btn-block btn-primary btn-xs" action="create">
                        <i class="fa fa-plus-circle "></i> <g:message code="default.button.new" default="New"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content"><!-- Main content -->
        <div class="box box-primary">
            <g:form url="[resource: nmMessageContentInstance, action: 'update']" method="PUT"><!-- enctype="multipart/form-data">-->
                <div class="box-body">
                    <g:hiddenField name="id" value="${nmMessageContentInstance?.id}"/>
                    <g:hiddenField name="version" value="${nmMessageContentInstance?.version}"/>
                    <g:render template="form" model="${[nmMessageContentInstance: nmMessageContentInstance]}"/>
                </div><!-- /.box-body -->
                <div class="box-footer">
                    <fieldset class="buttons">
                        <sec:access url="/nmMessageContent/edit/${nmMessageContentInstance?.id}">
                            <g:render template="../template/btn_submit" model="${[btnType: 'UPDATE']}"/>
                        </sec:access>
                        %{--<sec:access url="/nmMessageContent/show/${nmMessageContentInstance?.id}">--}%
                        %{--<g:link class="btn btn-warning pull-right" action="show" id="${nmMessageContentInstance?.id}"><i class="fa fa-reply-all" aria-hidden="true"></i> ${message(code: "default.button.goBack.label", default: "Go Back")}</g:link>--}%
                        %{--</sec:access>--}%
                    </fieldset>
                </div><!-- /.box-footer -->
            </g:form>
        </div><!-- /.box box-primary -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>
