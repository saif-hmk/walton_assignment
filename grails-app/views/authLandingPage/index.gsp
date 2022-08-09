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
        <g:set var="entityName" value="${message(code: 'label.authLandingPage.pageTitle', default: 'Auth Landing Page')}"/>
        <title><g:message code="default.argsButton.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/authLandingPage/create">
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

                <div class="box box-primary">   %{--Table Content--}%
                    <div class="box-body">
                        <table class="table dt-default table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored">
                            %{--NB: if you use dataTable (/dt-full/dt-show/...) then you have to remove/comment/block else (No record found) part of your dataTable.--}%
                            <thead>
                                <tr>
                                    <th>${message(code: 'label.authLandingPage.uri', default: 'Uri')}</th>
                                    <th>${message(code: 'label.authLandingPage.authRole', default: 'Auth Role')}</th>
                                    <th>${message(code: 'label.authLandingPage.priority', default: 'Priority')}</th>
                                    <th>${message(code: 'label.authLandingPage.isActive', default: 'Is Active')}</th>
                                    <th>${message(code: 'default.button.action', default: 'Action')}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${authLandingPageInstanceList}">
                                    <g:each in="${authLandingPageInstanceList}" status="i" var="authLandingPageInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="left">${fieldValue(bean: authLandingPageInstance, field: "uri")}</td>
                                            <td class="left">${fieldValue(bean: authLandingPageInstance, field: "authRole")}</td>
                                            <td class="center"><g:formatBoolean boolean="${authLandingPageInstance.active}" true="Yes" false="No"/></td>
                                            <td class="right">${authLandingPageInstance.priority}</td>
                                            <td class="center">
                                                <sec:access url="/authLandingPage/show/${authLandingPageInstance?.id}">
                                                    <g:link class="btn btn-xs btn-primary" action="show" id="${authLandingPageInstance?.id}">
                                                        <i class="fa fa-eye"></i> <g:message code="default.button.show" default="Show"/>
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/authLandingPage/edit/${authLandingPageInstance?.id}">
                                                    <g:link class="btn btn-xs btn-warning" action="edit" id="${authLandingPageInstance?.id}">
                                                        <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/authLandingPage/delete/${authLandingPageInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${authLandingPageInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                                                        <i class="fa fa-trash"></i> <g:message code="default.button.delete" default="Delete"/>
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

%{--                        <div class="paginate">--}%
%{--                            <g:paginate total="${org.aalaa.auth.AuthLandingPage?.count()}"/>--}%
%{--                        </div>--}%
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>
