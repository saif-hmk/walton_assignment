<!--
 @Created_By : AALAA
 @Date       : 2022.08.06 08:02:46 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.hrCrAttendance.pageTitle', default: 'Hr Cr Attendance')}"/>
        <title><g:message code="label.org.title.myDesk" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.myDesk" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/hrCrAttendance/index">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                                <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/hrCrAttendance/create">
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

                <div class="box box-info search-content">   <!--Search Content-->
                    <g:form url="[resource: hrCrAttendanceInstance, action: 'myDesk']" method="POST">
                        <div class="box-body">
                            <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                                <div class='form-group'>
                                    <label><g:message code="label.hrCrAttendance.hrEmployee" default="Hr Employee"/></label>
                                    <g:select name="hrEmployee" class="form-control select-with-search" from="${org.aalaa.hr.HrEmployee.list().sort { it.id }}" value="${params?.hrEmployee}" optionKey="id" optionValue="${{ it.code + " | " + it.nameFull }}" noSelection="['': 'Select One']"/>
                                </div>
                            </div>
                            <g:render template="../template/fromAndToDate"/>
                        </div>
                        <div class="box-footer">
                            <g:render template="../template/btn_submit" model="${[btnType: "SEARCH"]}"/>
                        </div>
                    </g:form>
                </div>

                <div class="box box-primary">   <!--Table Content-->
                    <g:set var="isAllowedMultipleAttendanceApprove" value="${applicationContext.authUserService.isPermittedUrl("/hrCrAttendance/approveMultipleAttendance")}"/>
                    <g:form action="approveMultipleAttendance" method="POST">
                        <div class="box-body tbl-responsive">
                            <table class="table table-bordered table-striped table-hover table-condensed display nowrapX th-center th-colored">
                                <thead>
                                    <tr>
                                        <g:if test="${isAllowedMultipleAttendanceApprove}">
                                            <th>
                                                <input type="checkBox" class="checkAll" title="Check All"/>
                                                <g:hiddenField name="redirectTo" value="view"/>
                                                <g:hiddenField name="requestFrom" value="myDesk"/>
                                            </th>
                                        </g:if>
                                        <th>${message(code: 'label.hrCrAttendance.prlPeriod'           , default: 'Prl Period'            )}</th>
                                        <th>${message(code: 'label.hrCrAttendance.hrEmployeeCode'      , default: 'Hr Employee Code'      )}</th>
                                        <th>${message(code: 'label.hrCrAttendance.hrEmployee'          , default: 'Hr Employee'           )}</th>
                                        <th>${message(code: 'label.hrCrAttendance.timeIn'              , default: 'In Time'               )}</th>
                                        <th>${message(code: 'label.hrCrAttendance.timeOut'             , default: 'Out Time'              )}</th>
                                        <th>${message(code: 'label.hrCrAttendance.timeBreak'           , default: 'Time Break'            )}</th>
                                        <th>${message(code: 'label.hrCrAttendance.effectiveWorkingHour', default: 'Effective Working Hour')}</th>
                                        <th>${message(code: 'label.hrCrAttendance.approvalStage'       , default: 'Approval Stage'        )}</th>
                                        <th>${message(code: 'default.button.action'                    , default: 'Action'                )}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:if test="${hrCrAttendanceInstanceList}">
                                        <g:each in="${hrCrAttendanceInstanceList}" status="i" var="hrCrAttendanceInstance">
                                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                                <g:if test="${isAllowedMultipleAttendanceApprove}">
                                                    <td class="center">
                                                        <input type="checkBox" class="checkThis" title="Check This"/>
                                                        <g:hiddenField class="process" name="hrCrAttendance[${i}].id" value="${hrCrAttendanceInstance?.id}" disabled="disabled"/>
                                                    </td>
                                                </g:if>
                                                <g:else>
                                                    <td class="center">
                                                        <input type="checkBox" class="disabled text-danger" disabled/>
                                                    </td>
                                                </g:else>
                                                <td class="center">${fieldValue(bean: hrCrAttendanceInstance, field: "prlPeriod")}</td>
                                                <td class="left">${fieldValue(bean: hrCrAttendanceInstance, field: "hrEmployeeCode")}</td>
                                                <td class="left">${fieldValue(bean: hrCrAttendanceInstance, field: "hrEmployee")}</td>
                                                <td class="center"><g:formatDate format="${grailsApplication.config.format.dtp.dateTime12}" date="${hrCrAttendanceInstance?.timeIn}"/></td>
                                                <td class="center"><g:formatDate format="${grailsApplication.config.format.dtp.dateTime12}" date="${hrCrAttendanceInstance?.timeOut}"/></td>
                                                <td class="right"><g:formatNumber format="##,##,##,##,###.00" number="${hrCrAttendanceInstance.timeBreak}"/></td>
                                                <td class="right"><g:formatNumber format="##,##,##,##,###.00" number="${hrCrAttendanceInstance.effectiveWorkingHour}"/></td>
                                                <td class="center">${fieldValue(bean: hrCrAttendanceInstance, field: "approvalStage")}</td>
                                                <td class="center">
                                                    <sec:access url="/hrCrAttendance/show/${hrCrAttendanceInstance?.id}">
                                                        <g:link class="btn btn-xs btn-primary" action="show" id="${hrCrAttendanceInstance?.id}">
                                                            <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                        </g:link>
                                                    </sec:access>
                                                    <sec:access url="/hrCrAttendance/edit/${hrCrAttendanceInstance?.id}">
                                                        <g:if test="${!hrCrAttendanceInstance?.isApproved}">
                                                            <g:link class="btn btn-xs btn-warning" action="edit" id="${hrCrAttendanceInstance?.id}">
                                                                <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                            </g:link>
                                                        </g:if>
                                                    </sec:access>
                                                    <sec:access url="/hrCrAttendance/delete/${hrCrAttendanceInstance?.id}">
                                                        <g:if test="${!hrCrAttendanceInstance?.isApproved}">
                                                            <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${hrCrAttendanceInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                                                                <i class="fa fa-trash"></i>%{-- <g:message code="default.button.delete" default="Delete"/>--}%
                                                            </g:link>
                                                        </g:if>
                                                    </sec:access>
                                                </td>
                                            </tr>
                                        </g:each>
                                    </g:if>
                                    <g:else>
                                        <tr><td class="bold center" colspan="10"><g:message code="default.message.noRecordFound" default="No Record Found...!"/></td></tr>
                                    </g:else>
                                </tbody>
                            </table>

                            <div class="pagination">
                                <g:paginate total="${hrCrAttendanceInstanceTotal ?: 0}" params="${params}"/>
                            </div>
                        </div><!-- /.box-body table-responsive no-padding -->

                        <g:if test="${isAllowedMultipleAttendanceApprove && hrCrAttendanceInstanceList}">
                            <div class="box-footer">
                                <fieldset class="buttons">
                                    <sec:access url="/hrCrAttendance/approveMultipleAttendance">
                                        <g:render template="../template/btn_submit" model="${["btnType": "APPROVE", "c_btnSubmit": "confirm-to-proceedX", "validationMessage": "Are you sure, you want to proceed...?"]}"/>
                                    </sec:access>
                                </fieldset>
                            </div>
                        </g:if>
                    </g:form>
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>
