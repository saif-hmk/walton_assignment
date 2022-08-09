<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 08:46:25 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.hrManagementStaff.pageTitle', default: 'Hr Management Staff')}"/>
        <title><g:message code="label.org.title.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/hrManagementStaff/create">
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

                <div class="box box-info search-content" hidden>   <!--Search Content-->
                    <g:form url="[resource: hrManagementStaffInstance, action: 'index']" method="POST">
                        <div class="box-body">
                            <g:render template="../template/fromAndToDate"/>
                        </div>
                        <div class="box-footer">
							<g:render template="../template/btn_submit" model="${[btnType: "RESET", c_btnSubmit: "pull-left"]}"/>
                            <g:render template="../template/btn_submit" model="${[btnType: "SEARCH"]}"/>
                        </div>
                    </g:form>
                </div>

                <div class="box box-primary">   <!--Table Content-->
                    <div class="box-body">
                        <table class="table table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored">
                            <!--NB: if you use dataTable ( dt-default/dt-full/dt-show/...) then you have to remove/comment/block else (No record found) part of your dataTable.-->
                            <thead>
                                <tr>
                                    <th>${message(code: 'label.hrManagementStaff.locPermanentDivision', default: 'Loc Permanent Division')}</th>
                                    <th>${message(code: 'label.hrManagementStaff.locPresentDivision', default: 'Loc Present Division')}</th>
                                    <th>${message(code: 'label.hrManagementStaff.locPermanentDistrict', default: 'Loc Permanent District')}</th>
                                    <th>${message(code: 'label.hrManagementStaff.locPresentDistrict', default: 'Loc Present District')}</th>
                                    <th>${message(code: 'label.hrManagementStaff.locPermanentSubDistrict', default: 'Loc Permanent Sub District')}</th>
                                    <th>${message(code: 'label.hrManagementStaff.locPresentSubDistrict', default: 'Loc Present Sub District')}</th>
                                    <th>${message(code: 'default.button.action', default: 'Action')}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${hrManagementStaffInstanceList}">
                                    <g:each in="${hrManagementStaffInstanceList}" status="i" var="hrManagementStaffInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="left">${fieldValue(bean: hrManagementStaffInstance, field: "locPermanentDivision")}</td>
                                            <td class="left">${fieldValue(bean: hrManagementStaffInstance, field: "locPresentDivision")}</td>
                                            <td class="left">${fieldValue(bean: hrManagementStaffInstance, field: "locPermanentDistrict")}</td>
                                            <td class="left">${fieldValue(bean: hrManagementStaffInstance, field: "locPresentDistrict")}</td>
                                            <td class="left">${fieldValue(bean: hrManagementStaffInstance, field: "locPermanentSubDistrict")}</td>
                                            <td class="left">${fieldValue(bean: hrManagementStaffInstance, field: "locPresentSubDistrict")}</td>
                                            <td class="center">
                                                <sec:access url="/hrManagementStaff/show/${hrManagementStaffInstance?.id}">
                                                    <g:link class="btn btn-xs btn-primary" action="show" id="${hrManagementStaffInstance?.id}">
                                                        <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/hrManagementStaff/edit/${hrManagementStaffInstance?.id}">
                                                    <g:link class="btn btn-xs btn-warning" action="edit" id="${hrManagementStaffInstance?.id}">
                                                        <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/hrManagementStaff/delete/${hrManagementStaffInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${hrManagementStaffInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                                                        <i class="fa fa-trash"></i>%{-- <g:message code="default.button.delete" default="Delete"/>--}%
                                                    </g:link>
                                                </sec:access>
                                            </td>
                                        </tr>
                                    </g:each>
                                </g:if>
                                <g:else>
                                    <tr><td class="bold center" colspan="7"><g:message code="default.message.noRecordFound" default="No Record Found...!"/></td></tr>
                                </g:else>
                            </tbody>
                        </table>

                        <div class="pagination">
                            <g:paginate total="${hrManagementStaffInstanceTotal ?: 0}" params="${params}"/>
                        </div>
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>