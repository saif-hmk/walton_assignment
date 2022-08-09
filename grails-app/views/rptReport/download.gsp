<!--
 @Created_By : AALAA
 @Date       : 2017.10.31 12:51:41 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.rptReport.pageTitle', default: 'Report')}"/>
    <title><g:message code="default.argsButton.download" args="[entityName]"/></title>
    <link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/aalaa/css", file: "aalaa-report.css")}">
</head>

<body>
<div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.download" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/rptReport/index">
                <li>
                    <g:link class="btn btn-block btn-vimeo btn-xs" action="index" params="${[s: request?.session?.id]}">
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
            <g:form controller="rptReport" action="print" method="POST" target="_blank">
                <div class="box-body" id="reportPanel">
                    <fieldset class='form'>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="required"><g:message code="label.rptReport.reportName" default="Report Name"/></label>
                                <select class="form-control rptReport select-with-search" name="rptReport" id="rptReport" required="required">
                                    <option value="">Select One</option>
                                    <g:each in="${reportList?.groupBy { it?.optGroup }}" var="rg">
                                        <optgroup label="${rg?.key}">
                                            <g:each in="${rg?.value}" var="r">
                                                <option value="${r?.id}">${r?.title}</option>
                                            </g:each>
                                        </optgroup>
                                    </g:each>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                            <div class="form-group">
                                <label class="required"><g:message code="label.rptReport.reportFormat" default="Report Format"/></label>
                                <g:select id="rptReportFormat" name="P_REPORT_FORMAT" class="form-control many-to-one rptReportFormat"
                                          from="${[DOCX: "DOCX", PDF_D: "PDF - Download", PDF_V: "PDF - View", RTF: "RTF", XLS: "XLS", XLSX: "XLSX"]}"
                                          value="${params.rptReportFormat}" required="required"
                                          optionKey="key" optionValue="value" noSelection="['': 'Select One']"/>
                            </div>
                        </div>
                    </fieldset>
                </div><!-- /.box-body -->

                <div class="box-footer">
                    <fieldset class="buttons">
                        <sec:access url="/rptReport/print">
                            <g:render template="../template/btn_submit" model="${[btnType: "PRINT"]}"/>
                        </sec:access>
                    </fieldset>
                </div><!-- /.box-footer -->
            </g:form>
        </div><!-- /.box box-primary -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<script type="text/javascript" src="${resource(dir: "resources/plugins/aalaa/js" , file: "aalaa-report.js" )}"></script>
</body>
</html>