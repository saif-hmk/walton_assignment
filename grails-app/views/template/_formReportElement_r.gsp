<div class="${mc_rptReportGroup ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label class='required'><g:message code="rptReport.rptReportGroup.label" default="Report Group"/></label>
        <g:select id="rptReportGroup_0" name="${np_rptReportGroup ?: ""}P_RPT_REPORT_GROUP" class="form-control rptReportGroup" from="${reportGroupList}" value="${reportGroup ?: params.reportGroup}" keys="${ispp.rpt.RptReportGroup.values()*.name()}" noSelection="['': 'Select One']" required="required"/>
    </div>
</div>

<div class="${mc_rptReport ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label class='required'><g:message code="rptReport.rptReport.label" default="Report"/></label>
        <g:select id="rptReport_0" name="${np_rptReport ?: ""}P_RPT_REPORT_ID" class="form-control rptReport" from="${reportList}" optionKey="id" value="${report ?: params.report}" noSelection="['': 'Select One']" required="required"/>
    </div>
</div>

<div class="${mc_rptReportFormat ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label class='required'><g:message code="rptReport.rptReportFormat.label" default="Report Format"/></label>
        <g:select id="rptReportFormat_0" name="${np_rptReportFormat ?: ""}P_RPT_REPORT_FORMAT" class="form-control rptReportFormat" from="${reportFormatList}" value="${reportFormat ?: params.reportFormat}" keys="${ispp.rpt.RptReportFormat.values()*.name()}" noSelection="['': 'Select One']" required="required"/>
    </div>
</div>