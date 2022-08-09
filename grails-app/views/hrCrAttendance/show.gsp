<!--
 @Created_By : AALAA
 @Date       : 2022.08.06 08:02:45 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.hrCrAttendance.pageTitle', default: 'Hr Cr Attendance')}"/>
    <title><g:message code="label.org.title.show" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">

    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.show" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/hrCrAttendance/myDesk">
                <li>
                    <g:link class="btn btn-xs btn-block btn-purple" action="myDesk">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.myDesk" default="myDesk"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/hrCrAttendance/index">
                <li>
                    <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/hrCrAttendance/create">
                <li>
                    <g:link class="btn btn-xs btn-block btn-primary" action="create">
                        <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/hrCrAttendance/edit/${hrCrAttendanceInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${hrCrAttendanceInstance?.id}">
                        <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/hrCrAttendance/delete/${hrCrAttendanceInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${hrCrAttendanceInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                        <i class="fa fa-trash"></i> <g:message code="default.button.delete" default="Delete"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content show-page"><!-- Main content -->
        <fieldset class="hrCrAttendance-show">
            <div class="box box-primary">
                <div class="box-body">
                    <fieldset><legend>General Information</legend></fieldset>

                    <div class="show-page-content">
                        %{--<g:if test="${hrCrAttendanceInstance?.hrEmployee}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.hrEmployee" default="Employee"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${hrCrAttendanceInstance?.hrEmployee} (${hrCrAttendanceInstance?.hrEmployeeCode})&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${hrCrAttendanceInstance?.prlPeriod}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.prlPeriod" default="Payroll Period"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${hrCrAttendanceInstance?.prlPeriod}" field="title"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${hrCrAttendanceInstance?.timeIn}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.timeIn" default="Time In"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrCrAttendanceInstance?.timeIn}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${hrCrAttendanceInstance?.timeOut}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.timeOut" default="Time Out"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrCrAttendanceInstance?.timeOut}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${hrCrAttendanceInstance?.timeBreak}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.timeBreak" default="Time Break"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${hrCrAttendanceInstance}" field="timeBreak"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${hrCrAttendanceInstance?.effectiveWorkingHour}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.effectiveWorkingHour" default="Effective Working Hour"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${hrCrAttendanceInstance}" field="effectiveWorkingHour"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                    </div>
                </div>

                <div class="box-body">
                    <fieldset><legend>Status</legend></fieldset>

                    <div class="show-page-content">

                        %{--<g:if test="${hrCrAttendanceInstance?.approvalStage}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.approvalStage" default="Approval Stage"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-10 col-lg-10">
                                <span class="property-value">
                                    <g:fieldValue bean="${hrCrAttendanceInstance}" field="approvalStage"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${hrCrAttendanceInstance?.isSubmitted}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.isSubmitted" default="Is Submitted"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:formatBoolean boolean="${hrCrAttendanceInstance?.isSubmitted}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${hrCrAttendanceInstance?.logSubmittedAt}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.logSubmittedAt" default="Log Submitted At"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrCrAttendanceInstance?.logSubmittedAt}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${hrCrAttendanceInstance?.isApproved}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.isApproved" default="Is Approved"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:formatBoolean boolean="${hrCrAttendanceInstance?.isApproved}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${hrCrAttendanceInstance?.logApprovedAt}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.logApprovedAt" default="Log Approved At"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrCrAttendanceInstance?.logApprovedAt}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${hrCrAttendanceInstance?.remarks}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <span class="property-label bold">
                                    <g:message code="label.hrCrAttendance.remarks" default="Remarks"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <span class="property-value">
                                    <g:fieldValue bean="${hrCrAttendanceInstance}" field="remarks"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%
                    </div>
                </div><!-- /.box-body -->
            </div>  <!-- /.box box-primary -->
        </fieldset>

    </section><!-- /.content -->
</div>
</body>
</html>
