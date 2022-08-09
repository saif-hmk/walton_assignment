<!--
 @Created_By : AALAA
 @Date       : 2022.08.08 01:49:17 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.prlProcMst.details.pageTitle', default: 'Process Details')}"/>
    <title><g:message code="label.org.title" args="[entityName]"/> - Process</title>
</head>

<body>
<div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/prlProcMst/process">
                <li>
                    <g:link class="btn btn-block btn-success btn-xs" action="process">
                        <i class="fa fa-wranch"></i> <g:message code="default.button.process" default="Process"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/prlProcMst/rollback">
                <li>
                    <g:link class="btn btn-block btn-danger btn-xs" action="rollback">
                        <i class="fa fa-trash"></i> <g:message code="default.button.rollBack" default="Rollback"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content"><!-- Main content -->

    <div class="box box-info search-content"><!--Search Content-->
        <g:form url="[resource: prlProcMstInstance, action: 'result']" method="POST">
            <div class="box-body">
                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
                    <div class='form-group'>
                        <label class='required'><g:message code="label.prlProcMst.prlPeriod" default="Prl Period"/></label>
                        <g:select name="prlPeriod" class="form-control" from="${org.aalaa.prl.PrlPeriod.list().sort{it.id}}" value="${params?.prlPeriod}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
                    </div>
                </div>
            </div>

            <div class="box-footer">
                <g:render template="../template/btn_submit" model="${[btnType: "SEARCH"]}"/>
            </div>
        </g:form>
    </div>

    <div class="box box-success">
            <div class="box-body tbl-responsive">
                <table class="table dt-default table-bordered table-striped table-hover table-condensed display nowrapX th-center th-colored">
                    <thead>
                    <tr>
                        <th>${message(code: 'label.prlProcMst.prlPeriod'             , default: 'PrlPeriod'             )}</th>
                        <th>${message(code: 'label.prlProcMst.admOrganization'       , default: 'AdmOrganization'       )}</th>
                        <th>${message(code: 'label.prlProcMst.admDepartment'         , default: 'AdmDepartment'         )}</th>
                        <th>${message(code: 'label.prlProcMst.admDesignation'        , default: 'AdmDesignation'        )}</th>
                        <th>${message(code: 'label.prlProcMst.hrEmployee'            , default: 'HrEmployee'            )}</th>
                        <th>${message(code: 'label.prlProcMst.employeeType'          , default: 'EmployeeType'          )}</th>
                        <th>${message(code: 'label.prlProcMst.mobileNo'              , default: 'MobileNo'              )}</th>
                        <th>${message(code: 'label.prlProcMst.email'                 , default: 'Email'                 )}</th>
                        <th>${message(code: 'label.prlProcMst.grossSalary'           , default: 'GrossSalary'           )}</th>
                        <th>${message(code: 'label.prlProcMst.ratePerHour'           , default: 'RatePerHour'           )}</th>
                        <th>${message(code: 'label.prlProcMst.limitPerMonth'         , default: 'LimitPerMonth'         )}</th>
                        <th>${message(code: 'label.prlProcMst.totalTimeBreak'        , default: 'TotalTimeBreak'        )}</th>
                        <th>${message(code: 'label.prlProcMst.totalEffectiveHour'    , default: 'TotalEffectiveHour'    )}</th>
                        <th>${message(code: 'label.prlProcMst.totalCalculatedAmount' , default: 'TotalCalculatedAmount' )}</th>
                        <th>${message(code: 'label.prlProcMst.totalEarnings'         , default: 'TotalEarnings'         )}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:if test="${prlProcMstInstanceList}">
                        <g:each in="${prlProcMstInstanceList}" status="i" var="prlProcMstInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <g:set var="classRed" value=""/>
                                <g:set var="classGreen" value=""/>
                                <g:set var="classPurple" value=""/>
                                <g:if test="${prlProcMstInstance?.limitPerMonth  && prlProcMstInstance.limitPerMonth < prlProcMstInstance?.totalCalculatedAmount}">
                                    <g:set var="classRed" value="text-red bold"/>
                                    <g:set var="classGreen" value="text-green bold"/>
                                    <g:set var="classPurple" value="text-purple bold"/>
                                </g:if>
                                <td class="center">${fieldValue(bean: prlProcMstInstance, field: "prlPeriod"            )}</td>
                                <td class="center">${fieldValue(bean: prlProcMstInstance, field: "admOrganization"      )}</td>
                                <td class="center">${fieldValue(bean: prlProcMstInstance, field: "admDepartment"        )}</td>
                                <td class="center">${fieldValue(bean: prlProcMstInstance, field: "admDesignation"       )}</td>
                                <td class="center">${(prlProcMstInstance?.hrEmployeeCode ? (prlProcMstInstance?.hrEmployeeCode + " | ") : "") + (prlProcMstInstance?.honorific ? (prlProcMstInstance?.honorific.toString() + " ") : "") + prlProcMstInstance?.hrEmployee}</td>
                                <td class="center">${prlProcMstInstance?.employmentType?.value + " " + prlProcMstInstance?.employeeType?.value}</td>
                                <td class="center">${fieldValue(bean: prlProcMstInstance, field: "mobileNo"             )}</td>
                                <td class="center">${fieldValue(bean: prlProcMstInstance, field: "email"                )}</td>
                                <td class="center">${fieldValue(bean: prlProcMstInstance, field: "grossSalary"          )}</td>
                                <td class="center">${fieldValue(bean: prlProcMstInstance, field: "ratePerHour"          )}</td>
                                <td class="center ${classPurple}">${fieldValue(bean: prlProcMstInstance, field: "limitPerMonth"        )}</td>
                                <td class="center">${fieldValue(bean: prlProcMstInstance, field: "totalTimeBreak"       )}</td>
                                <td class="center">${fieldValue(bean: prlProcMstInstance, field: "totalEffectiveHour"   )}</td>
                                <td class="center ${classRed}">${fieldValue(bean: prlProcMstInstance, field: "totalCalculatedAmount")}</td>
                                <td class="center ${classGreen}">${fieldValue(bean: prlProcMstInstance, field: "totalEarnings"        )}</td>
                            </tr>
                        </g:each>
                    </g:if>
                    </tbody>
                </table>
            </div>
        </div><!-- /.box box-primary -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>
