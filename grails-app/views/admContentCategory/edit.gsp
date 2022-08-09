<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 08:14:41 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.admContentCategory.pageTitle', default: 'Adm Content Category')}"/>
        <title><g:message code="label.org.title.edit" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.edit" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/admContentCategory/index">
                        <li>
                            <g:link class="btn btn-block btn-vimeo btn-xs" action="index">
                                <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/admContentCategory/create">
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
                    <g:form url="[resource: admContentCategoryInstance, action: 'update']" method="PUT" ><!-- enctype="multipart/form-data">-->
                        <div class="box-body">
                            <g:hiddenField name="id" value="${admContentCategoryInstance?.id}"/>
                            <g:hiddenField name="version" value="${admContentCategoryInstance?.version}"/>
                            <g:render template="form" model="${[admContentCategoryInstance:admContentCategoryInstance]}"/>
                        </div><!-- /.box-body -->
                        <div class="box-footer">
                            <fieldset class="buttons">
                                <sec:access url="/admContentCategory/edit/${admContentCategoryInstance?.id}">
                                    <g:render template="../template/btn_submit" model="${[btnType: 'UPDATE']}"/>
                                </sec:access>
                                %{--<sec:access url="/admContentCategory/show/${admContentCategoryInstance?.id}">--}%
                                    %{--<g:link class="btn btn-warning pull-right" action="show" id="${admContentCategoryInstance?.id}"><i class="fa fa-reply-all" aria-hidden="true"></i> ${message(code: "default.button.goBack.label", default: "Go Back")}</g:link>--}%
                                %{--</sec:access>--}%
                            </fieldset>
                        </div><!-- /.box-footer -->
                    </g:form>
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>