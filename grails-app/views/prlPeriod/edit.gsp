<!--
 @Created_By : AALAA
 @Date       : 2022.08.06 08:01:40 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.prlPeriod.pageTitle', default: 'Prl Period')}"/>
        <title><g:message code="label.org.title.edit" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.edit" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/prlPeriod/index">
                        <li>
                            <g:link class="btn btn-block btn-vimeo btn-xs" action="index">
                                <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/prlPeriod/create">
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
                    <g:form url="[resource: prlPeriodInstance, action: 'update']" method="PUT" ><!-- enctype="multipart/form-data">-->
                        <div class="box-body">
                            <g:hiddenField name="id" value="${prlPeriodInstance?.id}"/>
                            <g:hiddenField name="version" value="${prlPeriodInstance?.version}"/>
                            <g:render template="form" model="${[prlPeriodInstance:prlPeriodInstance]}"/>
                        </div><!-- /.box-body -->
                        <div class="box-footer">
                            <fieldset class="buttons">
                                <sec:access url="/prlPeriod/edit/${prlPeriodInstance?.id}">
                                    <g:render template="../template/btn_submit" model="${[btnType: 'UPDATE']}"/>
                                </sec:access>
                                %{--<sec:access url="/prlPeriod/show/${prlPeriodInstance?.id}">--}%
                                    %{--<g:link class="btn btn-warning pull-right" action="show" id="${prlPeriodInstance?.id}"><i class="fa fa-reply-all" aria-hidden="true"></i> ${message(code: "default.button.goBack.label", default: "Go Back")}</g:link>--}%
                                %{--</sec:access>--}%
                            </fieldset>
                        </div><!-- /.box-footer -->
                    </g:form>
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>