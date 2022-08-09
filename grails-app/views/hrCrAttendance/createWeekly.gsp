<%@ page import="org.aalaa.com.ApprovalStage" %>
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
    <title><g:message code="label.org.title.create" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.create" args="[entityName]"/> (Weekly View)</h1>
        <ul class="top-links">
            <sec:access url="/hrCrAttendance/index">
                <li>
                    <g:link class="btn btn-block btn-vimeo btn-xs" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/hrCrAttendance/myDesk">
                <li>
                    <g:link class="btn btn-xs btn-block btn-purple" action="myDesk">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.myDesk" default="myDesk"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content"><!-- Main content -->
        <div class="box box-primary">
            <g:form url="[resource: hrCrAttendanceInstance, action: 'saveWeeklyEntries']" method="POST">%{-- enctype="multipart/form-data">--}%
                <div class="box-body">
                    <g:render template="formWeekly" model="${[hrCrAttendanceInstance: hrCrAttendanceInstance, hrEmployee: hrEmployee, weeklyAttendanceList: weeklyAttendanceList]}"/>
                </div><!-- /.box-body -->
                <div class="box-footer">
                    <fieldset class="buttons">
                        <sec:access url="/hrCrAttendance/create">
%{--                            <g:if test="${weeklyAttendanceList.approvalStage.findAll{it.key == "SUBMITTED"}.size() == 2}">--}%
%{--                                Disable--}%
%{--                            </g:if>--}%
                            <g:if test="${weeklyAttendanceList.last().timeIn.clearTime() == new Date().clearTime()}">
%{--                            <g:if test="${weeklyAttendanceList.get(1).timeIn.clearTime() == new Date().clearTime()}">--}%
                                <g:render template="../template/btn_submit"/>
                            </g:if>
                            <g:else>
                                <g:render template="../template/btn_submit" model="${[btnType: 'CREATE']}"/>
                            </g:else>
                        </sec:access>
                    </fieldset>
                </div><!-- /.box-footer -->
            </g:form>
        </div><!-- /.box box-primary -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>
