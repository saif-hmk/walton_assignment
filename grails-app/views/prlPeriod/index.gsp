<!--
 @Created_By : AALAA
 @Date       : 2022.08.06 08:01:41 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.prlPeriod.pageTitle', default: 'Prl Period')}"/>
        <title><g:message code="label.org.title.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
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

                <div class="box box-primary">   <!--Table Content-->
                    <div class="box-body">
                        <table class="table dt-default table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored">
                            <thead>
                                <tr>
                                    <th>${message(code: 'label.prlPeriod.keyword', default: 'keyword')}</th>
                                    <th>${message(code: 'label.prlPeriod.title', default: 'Title')}</th>
                                    <th>${message(code: 'label.prlPeriod.titleNative', default: 'Title Native')}</th>
                                    <th>${message(code: 'label.prlPeriod.dateOfStart', default: 'Date Of Start')}</th>
                                    <th>${message(code: 'label.prlPeriod.dateOfEnd', default: 'Date Of End')}</th>
                                    <th>${message(code: 'label.prlPeriod.isClosed', default: 'Is Closed')}</th>
                                    <th>${message(code: 'label.prlPeriod.isActive', default: 'Is Active')}</th>
                                    <th>${message(code: 'default.button.action', default: 'Action')}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${prlPeriodInstanceList}">
                                    <g:each in="${prlPeriodInstanceList}" status="i" var="prlPeriodInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="center">${fieldValue(bean: prlPeriodInstance, field: "keyword")}</td>
                                            <td class="center">${fieldValue(bean: prlPeriodInstance, field: "title")}</td>
                                            <td class="center">${fieldValue(bean: prlPeriodInstance, field: "titleNative")}</td>
                                            <td class="center"><g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${prlPeriodInstance.dateOfStart}"/></td>
                                            <td class="center"><g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${prlPeriodInstance.dateOfEnd}"/></td>
                                            <td class="center ${prlPeriodInstance?.isClosed ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${prlPeriodInstance.isClosed}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center ${prlPeriodInstance?.isActive ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${prlPeriodInstance.isActive}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center">
                                                <sec:access url="/prlPeriod/show/${prlPeriodInstance?.id}">
                                                    <g:link class="btn btn-xs btn-primary" action="show" id="${prlPeriodInstance?.id}">
                                                        <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/prlPeriod/edit/${prlPeriodInstance?.id}">
                                                    <g:link class="btn btn-xs btn-warning" action="edit" id="${prlPeriodInstance?.id}">
                                                        <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/prlPeriod/delete/${prlPeriodInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${prlPeriodInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                                                        <i class="fa fa-trash"></i>%{-- <g:message code="default.button.delete" default="Delete"/>--}%
                                                    </g:link>
                                                </sec:access>
                                            </td>
                                        </tr>
                                    </g:each>
                                </g:if>
%{--                                <g:else>--}%
%{--                                    <tr><td class="bold center" colspan="7"><g:message code="default.message.noRecordFound" default="No Record Found...!"/></td></tr>--}%
%{--                                </g:else>--}%
                            </tbody>
                        </table>

%{--                        <div class="pagination">--}%
%{--                            <g:paginate total="${prlPeriodInstanceTotal ?: 0}" params="${params}"/>--}%
%{--                        </div>--}%
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>
