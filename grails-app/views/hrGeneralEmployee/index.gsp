<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 08:56:06 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.hrGeneralEmployee.pageTitle', default: 'Hr General Employee')}"/>
        <title><g:message code="label.org.title.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/hrGeneralEmployee/create">
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
                    <g:form url="[resource: hrGeneralEmployeeInstance, action: 'index']" method="POST">
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
                                    <th>${message(code: 'label.hrGeneralEmployee.admVendorOrganization' , default: 'Organization'   )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.department'            , default: 'Department'     )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.designation'           , default: 'Designation'    )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.code'                  , default: 'Code'           )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.honorific'             , default: 'Honorific'      )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.nameFull'              , default: 'Full Name'      )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.gender'                , default: 'Gender'         )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.maritalStatus'         , default: 'Marital Status' )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.religion'              , default: 'Religion'       )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.employeeType'          , default: 'Employee Type'  )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.employmentType'        , default: 'Employment Type')}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.serviceStatus'         , default: 'Service Status' )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.mobileNoPrimary'       , default: 'Mobile No'      )}</th>
                                    <th>${message(code: 'label.hrGeneralEmployee.email'                 , default: 'Email'          )}</th>
                                    <th>${message(code: 'default.button.action'                         , default: 'Action'         )}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${hrGeneralEmployeeInstanceList}">
                                    <g:each in="${hrGeneralEmployeeInstanceList}" status="i" var="hrGeneralEmployeeInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "admVendorOrganization")}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "department"           )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "designation"          )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "code"                 )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "honorific"            )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "nameFull"             )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "gender"               )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "maritalStatus"        )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "religion"             )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "employeeType"         )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "employmentType"       )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "serviceStatus"        )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "mobileNoPrimary"      )}</td>
                                            <td class="left">${fieldValue(bean: hrGeneralEmployeeInstance, field: "email"                )}</td>
                                            <td class="center">
                                                <sec:access url="/hrGeneralEmployee/show/${hrGeneralEmployeeInstance?.id}">
                                                    <g:link class="btn btn-xs btn-primary" action="show" id="${hrGeneralEmployeeInstance?.id}">
                                                        <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/hrGeneralEmployee/edit/${hrGeneralEmployeeInstance?.id}">
                                                    <g:link class="btn btn-xs btn-warning" action="edit" id="${hrGeneralEmployeeInstance?.id}">
                                                        <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/hrGeneralEmployee/delete/${hrGeneralEmployeeInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${hrGeneralEmployeeInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
                            <g:paginate total="${hrGeneralEmployeeInstanceTotal ?: 0}" params="${params}"/>
                        </div>
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>















