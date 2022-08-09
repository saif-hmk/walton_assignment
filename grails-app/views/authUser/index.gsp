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
        <title><g:message code="label.org.title.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/authUser/create">
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
                                    <th>${message(code: 'label.authUser.username', default: 'Username')}</th>
                                    <th>${message(code: 'label.authUser.displayName', default: 'Display Name')}</th>
                                    <th>${message(code: 'label.authUser.fullName', default: 'Full Name')}</th>
                                    <th>${message(code: 'label.authUser.enabled', default: 'Enabled')}</th>
                                    <th>${message(code: 'label.authUser.accountExpired', default: 'Account Expired')}</th>
                                    <th>${message(code: 'label.authUser.passwordExpired', default: 'Password Expired')}</th>
                                    <th>${message(code: 'label.authUser.accountLocked', default: 'Account Locked')}</th>
                                    <th>${message(code: 'default.button.action', default: 'Action')}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${authUserInstanceList}">
                                    <g:each in="${authUserInstanceList}" status="i" var="authUserInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="left">${fieldValue(bean: authUserInstance, field: "username")}</td>
                                            <td class="left">${fieldValue(bean: authUserInstance, field: "displayName")}</td>
                                            <td class="left">${fieldValue(bean: authUserInstance, field: "fullName")}</td>
                                            <td class="center ${authUserInstance?.enabled ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${authUserInstance.enabled}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center ${authUserInstance?.accountExpired ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${authUserInstance.accountExpired}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center ${authUserInstance?.passwordExpired ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${authUserInstance.passwordExpired}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center ${authUserInstance?.accountLocked ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${authUserInstance.accountLocked}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center">
                                                <sec:access url="/authUser/profile/${authUserInstance?.id}">
                                                    <g:link class="btn btn-xs btn-info" action="show" title="Profile" id="${authUserInstance?.id}" target="_blank">
                                                        <i class="fa fa-user"></i>
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/authUser/dcCode/${authUserInstance?.id}">
                                                    <g:link class="btn btn-xs btn-facebook" target="_blank" action="dcCode" title="Dc Code" id="${authUserInstance?.id}">
                                                        <i class="fa fa-terminal"></i>
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/authUser/resetPassword/${authUserInstance?.id}">
                                                    <g:link class="btn btn-xs btn-success" action="resetPassword" title="Reset Password" id="${authUserInstance?.id}">
                                                        <i class="fa fa-refresh"></i>
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/authUser/create">
                                                    <g:link class="btn btn-xs btn-warning" action="create" title="Update" id="${authUserInstance?.id}" params="${[at: params.at ?: "up", ui: authUserInstance?.id]}">
                                                        <i class="fa fa-fw fa-edit"></i>
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/authUser/delete/${authUserInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" title="Delete" id="${authUserInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                                                        <i class="fa fa-trash"></i>
                                                    </g:link>
                                                </sec:access>
                                            </td>
                                        </tr>
                                    </g:each>
                                </g:if>
%{--                                <g:else>--}%
%{--                                    <tr><td class="bold center" colspan="8"><g:message code="default.message.noRecordFound" default="No Record Found...!"/></td></tr>--}%
%{--                                </g:else>--}%
                            </tbody>
                        </table>

%{--                        <div class="pagination">--}%
%{--                            <g:paginate total="${authUserInstanceTotal ?: 0}" params="${params}"/>--}%
%{--                        </div>--}%
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>