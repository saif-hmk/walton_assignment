<%--
  Created by IntelliJ IDEA.
  User: hoshen.mahmud
  Date: 2017-10-31
  Time: 12:51 AM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.rptReport.pageTitle', default: 'Report')}"/>
    <title><g:message code="default.argsButton.index" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/report/index">
                <li>
                    <g:link class="btn btn-block btn-vimeo btn-xs" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.list" default="List"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content"><!-- Main content -->
        <div id="create-report" class="box box-primary" role="main">
            <g:form url="[resource: reportInstance, action: 'print']" method="POST">
                <div class="box-body">
                    <fieldset class='form'>

                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="form-group ${bean ? hasErrors(bean: bean, field: "rptReport", 'has-error') : ""}">
                                <label class="required"><g:message code="label.sysReport.reportName" default="Report Name"/></label>
                                <g:select id="rptReport" name="rptReport" class="form-control many-to-one rptReport" from="${org.aalaa.rpt.RptReport.list()}" value="${params.rptReport}" optionKey="id" optionValue="title" noSelection="['': 'Select One']" required="required"/>
                            </div>
                        </div>

                        %{--<g:render template="../template/rptReport_r"    model="${[reportList  : org.aalaa.rpt.RptReport.list().sort { it.id }]}"/>--}%
                        %{--<g:render template="../template/eduClass"       model="${[classList   : org.ems.edu.TmsEduClass.list().sort { it.id }, n_classes: "P_CLASSES_ID"]}"/>--}%
                        %{--<g:render template="../template/eduGroup"       model="${[groupList   : org.ems.edu.EduGroup.values(), n_group: "P_GROUP_ID"]}"/>--}%
                        %{--<g:render template="../template/eduSubject"     model="${[subjectList : org.ems.edu.TmsEduSubject.list().sort { it.id }, n_subject: "P_SUBJECT_ID"]}"/>--}%
                        %{--<g:render template="../template/eduStudent"     model="${[studentList : org.ems.edu.TmsEduStudent.list().sort { it.id }, n_student: "P_STUDENT_ID"]}"/>--}%
                        %{--<g:render template="../template/fromAndToDate"  model="${[n_fromDate  : "P_START_DATE", n_toDate   : "P_END_DATE"]}"/>--}%
                        <g:render template="../template/rptReportFormat_r"/>
                    </fieldset>
                </div><!-- /.box-body -->
                <div class="box-footer">
                    <fieldset class="buttons">
                        <sec:access url="/sysReport/print">
                            <g:render template="../template/btn_submit" model="${[btnType: "PRINT"]}"/>
                        </sec:access>
                    </fieldset>
                </div><!-- /.box-footer -->
            </g:form>
        </div><!-- /.box box-primary -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>