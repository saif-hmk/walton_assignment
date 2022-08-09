<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 08:48:15 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.hrStaff.pageTitle', default: 'Hr Staff')}"/>
        <title><g:message code="label.org.title.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/hrStaff/create">
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
                    <g:form url="[resource: hrStaffInstance, action: 'index']" method="POST">
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
                    <div class="box-body tbl-responsive">
                        <table class="table table-bordered table-striped table-hover table-condensed display nowrapX th-center th-colored">
                            <!--NB: if you use dataTable ( dt-default/dt-full/dt-show/...) then you have to remove/comment/block else (No record found) part of your dataTable.-->
                            <thead>
                                <tr>
                                    <th>${message(code: 'label.hrStaff.admVendorOrganization' , default: 'Organization'   )}</th>
                                    <th>${message(code: 'label.hrStaff.department'            , default: 'Department'     )}</th>
                                    <th>${message(code: 'label.hrStaff.designation'           , default: 'Designation'    )}</th>
                                    <th>${message(code: 'label.hrStaff.code'                  , default: 'Code'           )}</th>
                                    <th>${message(code: 'label.hrStaff.honorific'             , default: 'Honorific'      )}</th>
                                    <th>${message(code: 'label.hrStaff.nameFull'              , default: 'Full Name'      )}</th>
                                    <th>${message(code: 'label.hrStaff.gender'                , default: 'Gender'         )}</th>
                                    <th>${message(code: 'label.hrStaff.maritalStatus'         , default: 'Marital Status' )}</th>
                                    <th>${message(code: 'label.hrStaff.religion'              , default: 'Religion'       )}</th>
                                    <th>${message(code: 'label.hrStaff.employeeType'          , default: 'Employee Type'  )}</th>
                                    <th>${message(code: 'label.hrStaff.employmentType'        , default: 'Employment Type')}</th>
                                    <th>${message(code: 'label.hrStaff.serviceStatus'         , default: 'Service Status' )}</th>
                                    <th>${message(code: 'label.hrStaff.mobileNoPrimary'       , default: 'Mobile No'      )}</th>
                                    <th>${message(code: 'label.hrStaff.email'                 , default: 'Email'          )}</th>
                                    <th>${message(code: 'default.button.action'               , default: 'Action'         )}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${hrStaffInstanceList}">
                                    <g:each in="${hrStaffInstanceList}" status="i" var="hrStaffInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "admVendorOrganization")}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "department"           )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "designation"          )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "code"                 )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "honorific"            )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "nameFull"             )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "gender"               )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "maritalStatus"        )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "religion"             )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "employeeType"         )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "employmentType"       )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "serviceStatus"        )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "mobileNoPrimary"      )}</td>
                                            <td class="left">${fieldValue(bean: hrStaffInstance, field: "email"                )}</td>
                                            <td class="center">
                                                <sec:access url="/hrStaff/show/${hrStaffInstance?.id}">
                                                    <g:link class="btn btn-xs btn-primary" action="show" id="${hrStaffInstance?.id}">
                                                        <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/hrStaff/edit/${hrStaffInstance?.id}">
                                                    <g:link class="btn btn-xs btn-warning" action="edit" id="${hrStaffInstance?.id}">
                                                        <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/hrStaff/delete/${hrStaffInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${hrStaffInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                                                        <i class="fa fa-trash"></i>%{-- <g:message code="default.button.delete" default="Delete"/>--}%
                                                    </g:link>
                                                </sec:access>
                                            </td>
                                        </tr>
                                    </g:each>
                                </g:if>
                                <g:else>
                                    <tr><td class="bold center" colspan="15"><g:message code="default.message.noRecordFound" default="No Record Found...!"/></td></tr>
                                </g:else>
                            </tbody>
                        </table>

                        <div class="pagination">
                            <g:paginate total="${hrStaffInstanceTotal ?: 0}" params="${params}"/>
                        </div>
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>
