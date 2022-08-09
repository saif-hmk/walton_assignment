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
    <title><g:message code="label.org.title.myDesk" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.myDesk" args="[entityName]"/></h1>
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

        <div class="box box-info search-content"><!--Search Content-->
            <g:form url="[resource: nmMessageContentInstance, action: 'myDesk']" method="POST">
                <div class="box-body">

                    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                        <div class='form-group'>
                            <label><g:message code="label.nmMessageContent.title" default="Title"/></label>
                            <g:textField name="title" class="form-control" value="${nmMessageContentInstance?.title}"/>
                        </div>
                    </div>

                    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                        <div class='form-group'>
                            <label><g:message code="label.nmMessageContent.status" default="Status"/></label>
                            <g:select name="status" class="form-control" from="${org.aalaa.nm.StatusNm?.values()}" keys="${org.aalaa.nm.StatusNm.values()*.name()}" value="${nmMessageContentInstance?.status?.name()}" noSelection="['': 'Select One']"/>
                        </div>
                    </div>

                    <g:render template="../template/fromAndToDate"/>

                    %{--
                    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                        <div class='form-group'>
                            <label class='br'><g:message code="label.nmMessageContent.active" default="Active"/></label>
                            <g:checkBox class="cb" title="active"  value="${nmMessageContentInstance?.active}" />
                        </div>
                    </div>
                    --}%
                </div>

                <div class="box-footer">
                    <g:render template="../template/btn_submit" model="${[btnType: "SEARCH"]}"/>
                </div>
            </g:form>
        </div>

        <div class="box box-primary"><!--Table Content-->
            <div class="box-body">
                <table class="table table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored">
                    <thead>
                    <tr>
                        <th>${message(code: 'label.nmMessageContent.title', default: 'Title')}</th>
                        <th>${message(code: 'label.nmMessageContent.category', default: 'Category')}</th>
                        <th>${message(code: 'label.nmMessageContent.recipient', default: 'Recipient')}</th>
                        <th>${message(code: 'label.nmMessageContent.status', default: 'Status')}</th>
                        <th>${message(code: 'label.nmMessageContent.statusEntry', default: 'Status Entry')}</th>
                        <th>${message(code: 'label.nmMessageContent.activeFrom', default: 'Active From')}</th>
                        <th>${message(code: 'label.nmMessageContent.activeTo', default: 'Active To')}</th>
                        <th>${message(code: 'label.nmMessageContent.active', default: 'Active')}</th>
                        <th>${message(code: 'default.button.action', default: 'Action')}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:if test="${nmMessageContentInstanceList}">
                        <g:each in="${nmMessageContentInstanceList}" status="i" var="nmMessageContentInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td class="left">${fieldValue(bean: nmMessageContentInstance, field: "title")}</td>
                                <td class="left">${fieldValue(bean: nmMessageContentInstance, field: "category")}</td>
                                <td class="left">${fieldValue(bean: nmMessageContentInstance, field: "recipient")}</td>
                                <td class="left">${fieldValue(bean: nmMessageContentInstance, field: "status")}</td>
                                <td class="left">${fieldValue(bean: nmMessageContentInstance, field: "statusEntry")}</td>
                                <td class="center"><g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${nmMessageContentInstance.activeFrom}"/></td>
                                <td class="center"><g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${nmMessageContentInstance.activeTo}"/></td>
                                <td class="center ${nmMessageContentInstance?.active ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${nmMessageContentInstance.active}" true="&#10004;" false="&#10008;"/></td>
                                <td class="center">
                                    <sec:access url="/nmMessageContent/show/${nmMessageContentInstance?.id}">
                                        <g:link class="btn btn-xs btn-primary" action="show" id="${nmMessageContentInstance?.id}">
                                            <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                        </g:link>
                                    </sec:access>
                                    <sec:access url="/nmMessageContent/edit/${nmMessageContentInstance?.id}">
                                        <g:link class="btn btn-xs btn-warning" action="edit" id="${nmMessageContentInstance?.id}">
                                            <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                        </g:link>
                                    </sec:access>
                                    <sec:access url="/nmMessageContent/delete/${nmMessageContentInstance?.id}">
                                        <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${nmMessageContentInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                                            <i class="fa fa-trash"></i>%{-- <g:message code="default.button.delete" default="Delete"/>--}%
                                        </g:link>
                                    </sec:access>
                                </td>
                            </tr>
                        </g:each>
                    </g:if>
                    <g:else>
                        <tr><td class="bold center" colspan="9"><g:message code="default.message.noRecordFound" default="No Record Found...!"/></td></tr>
                    </g:else>
                    </tbody>
                </table>

                <div class="pagination">
                    <g:paginate total="${nmMessageContentInstanceTotal ?: 0}" params="${params}"/>
                </div>
            </div><!-- /.box-body table-responsive no-padding -->
        </div><!-- /.box box-primary -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>
