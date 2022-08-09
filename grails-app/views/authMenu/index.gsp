<!--
 @Created_By : AALAA
 @Date       : 2021.12.09 11:45:12 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.authMenu.pageTitle', default: 'Auth Menu')}"/>
        <title><g:message code="label.org.title.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/authMenu/create">
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
                            <!--NB: if you use dataTable (/dt-full/dt-show/...) then you have to remove/comment/block else (No record found) part of your dataTable.-->
                            <thead>
                                <tr>
                                    <th>${message(code: 'label.authMenu.code', default: 'code')}</th>
                                    <th>${message(code: 'label.authMenu.parentMenu', default: 'Parent Menu')}</th>
                                    <th>${message(code: 'label.authMenu.title', default: 'Title')}</th>
                                    <th>${message(code: 'label.authMenu.url', default: 'Url')}</th>
                                    <th>${message(code: 'label.authMenu.isExternal', default: 'Is External')}</th>
                                    <th>${message(code: 'label.authMenu.isOpenNewTab', default: 'Is Open New Tab')}</th>
                                    <th>${message(code: 'label.authMenu.isActive', default: 'Is Active')}</th>
                                    <th>${message(code: 'default.button.action', default: 'Action')}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${authMenuInstanceList}">
                                    <g:each in="${authMenuInstanceList}" status="i" var="authMenuInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="left">${fieldValue(bean: authMenuInstance, field: "code")}</td>
                                            <td class="left">${fieldValue(bean: authMenuInstance, field: "parentMenu")}</td>
                                            <td class="left">${fieldValue(bean: authMenuInstance, field: "title")}</td>
                                            <td class="left">${fieldValue(bean: authMenuInstance, field: "url")}</td>
                                            <td class="center ${authMenuInstance?.isExternal ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${authMenuInstance.isExternal}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center ${authMenuInstance?.isOpenNewTab ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${authMenuInstance.isOpenNewTab}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center ${authMenuInstance?.isActive ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${authMenuInstance.isActive}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center">
                                                <sec:access url="/authMenu/show/${authMenuInstance?.id}">
                                                    <g:link class="btn btn-xs btn-primary" action="show" id="${authMenuInstance?.id}">
                                                        <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/authMenu/edit/${authMenuInstance?.id}">
                                                    <g:link class="btn btn-xs btn-warning" action="edit" id="${authMenuInstance?.id}">
                                                        <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/authMenu/delete/${authMenuInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${authMenuInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
%{--                            <g:paginate total="${authMenuInstanceTotal ?: 0}" params="${params}"/>--}%
%{--                        </div>--}%
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>