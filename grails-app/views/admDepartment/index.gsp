<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 12:12:57 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.admDepartment.pageTitle', default: 'Adm Department')}"/>
        <title><g:message code="label.org.title.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/admDepartment/create">
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
                            <!--NB: if you use dataTable (/dt-full/dt-show/...) then you have to remove/comment/block else (No record found) part of your dataTable.-->
                            <thead>
                                <tr>
                                    <th>${message(code: 'label.admDepartment.admVendorOrganization' , default: 'Organization'    )}</th>
                                    <th>${message(code: 'label.admDepartment.keyword'         , default: 'Keyword'         )}</th>
                                    <th>${message(code: 'label.admDepartment.title'           , default: 'Title'           )}</th>
                                    <th>${message(code: 'label.admDepartment.titleNative'     , default: 'Title Native'    )}</th>
                                    <th>${message(code: 'label.admDepartment.titleShort'      , default: 'Title Short'     )}</th>
                                    <th>${message(code: 'label.admDepartment.titleShortNative', default: 'Title Short (BN)')}</th>
                                    <th>${message(code: 'label.admDepartment.sortOrder'       , default: 'Sort Order'      )}</th>
                                    <th>${message(code: 'label.admDepartment.active'          , default: 'Active'          )}</th>
                                    <th>${message(code: 'default.button.action'               , default: 'Action'          )}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${admDepartmentInstanceList}">
                                    <g:each in="${admDepartmentInstanceList}" status="i" var="admDepartmentInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="left">${fieldValue(bean: admDepartmentInstance, field: "admVendorOrganization" )}</td>
                                            <td class="left">${fieldValue(bean: admDepartmentInstance, field: "keyword"         )}</td>
                                            <td class="left">${fieldValue(bean: admDepartmentInstance, field: "title"           )}</td>
                                            <td class="left">${fieldValue(bean: admDepartmentInstance, field: "titleNative"     )}</td>
                                            <td class="left">${fieldValue(bean: admDepartmentInstance, field: "titleShort"      )}</td>
                                            <td class="left">${fieldValue(bean: admDepartmentInstance, field: "titleShortNative")}</td>
                                            <td class="left">${fieldValue(bean: admDepartmentInstance, field: "sortOrder"       )}</td>
                                            <td class="center ${admDepartmentInstance?.active ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${admDepartmentInstance.active}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center">
                                                <sec:access url="/admDepartment/show/${admDepartmentInstance?.id}">
                                                    <g:link class="btn btn-xs btn-primary" action="show" id="${admDepartmentInstance?.id}">
                                                        <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/admDepartment/edit/${admDepartmentInstance?.id}">
                                                    <g:link class="btn btn-xs btn-warning" action="edit" id="${admDepartmentInstance?.id}">
                                                        <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/admDepartment/delete/${admDepartmentInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${admDepartmentInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
%{--                            <g:paginate total="${admDepartmentInstanceTotal ?: 0}" params="${params}"/>--}%
%{--                        </div>--}%
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>
