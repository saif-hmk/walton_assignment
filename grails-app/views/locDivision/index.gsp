<!--
 @Created_By : AALAA
 @Date       : 2022.07.25 11:28:11 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.locDivision.pageTitle', default: 'Loc Division')}"/>
        <title><g:message code="label.org.title.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/locDivision/create">
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
                        <table class="table dt-default table-bordered table-striped table-hover table-condensed display nowrapX th-center th-colored">
                            <thead>
                                <tr>
                                    <th>${message(code: 'label.locDivision.country', default: 'Country')}</th>
                                    <th>${message(code: 'label.locDivision.code', default: 'Code')}</th>
                                    <th>${message(code: 'label.locDivision.name', default: 'Name')}</th>
                                    <th>${message(code: 'label.locDivision.nameNative', default: 'Name Native')}</th>
                                    <th>${message(code: 'label.locDivision.isActive', default: 'Is Active')}</th>
                                    <th>${message(code: 'default.button.action', default: 'Action')}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${locDivisionInstanceList}">
                                    <g:each in="${locDivisionInstanceList}" status="i" var="locDivisionInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="left">${fieldValue(bean: locDivisionInstance, field: "parent")}</td>
                                            <td class="left">${fieldValue(bean: locDivisionInstance, field: "code")}</td>
                                            <td class="left">${fieldValue(bean: locDivisionInstance, field: "name")}</td>
                                            <td class="left">${fieldValue(bean: locDivisionInstance, field: "nameNative")}</td>
                                            <td class="center ${locDivisionInstance?.isActive ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${locDivisionInstance.isActive}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center">
                                                <sec:access url="/locDivision/show/${locDivisionInstance?.id}">
                                                    <g:link class="btn btn-xs btn-primary" action="show" id="${locDivisionInstance?.id}">
                                                        <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/locDivision/edit/${locDivisionInstance?.id}">
                                                    <g:link class="btn btn-xs btn-warning" action="edit" id="${locDivisionInstance?.id}">
                                                        <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/locDivision/delete/${locDivisionInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${locDivisionInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                                                        <i class="fa fa-trash"></i>%{-- <g:message code="default.button.delete" default="Delete"/>--}%
                                                    </g:link>
                                                </sec:access>
                                            </td>
                                        </tr>
                                    </g:each>
                                </g:if>
                            </tbody>
                        </table>
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>
