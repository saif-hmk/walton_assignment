<!--
 @Created_By : AALAA
 @Date       : 2021.11.12 11:52:59 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='escapable-block'>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <legend class='text-purple' style='padding-top: 10px'>
        ${message(code: 'label.rptReportLkFormat.pageTitle', default: 'Rpt Report Lk Format Details')}
        <span class='pull-right text-purple'>(<input type='checkbox' class='escape-this-block'>${message(code: 'default.message.clickToEscape', default: 'Click to Escape')})</span>
    </legend>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <g:each in="${rptReportLkFormatList ?: new org.aalaa.rpt.RptReportLkFormat(params)}" status="i" var="rptReportLkFormatInstance">
        <div class='box box-info rptReportLkFormatDetails'>
            <div class='box-body'>

                <g:hiddenField name="rptReportLkFormat[${i}].id" value="${rptReportLkFormatInstance?.id}"/>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkFormatInstance, field: 'reportFormat', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportLkFormat.reportFormat" default="Report Format"/></label>
                        <g:select name="rptReportLkFormat[${i}].reportFormat" class="form-control" from="${org.aalaa.rpt.ReportFormat?.values()}" keys="${org.aalaa.rpt.ReportFormat.values()*.name()}" value="${rptReportLkFormatInstance?.reportFormat?.name()}"  noSelection="['': 'Select One']" required="required"/>
                        <g:renderErrors bean='${rptReportLkFormatInstance}' field='reportFormat'/>
                    </div>
                </div>

            </div>  <!-- /.box-body -->
        </div>  <!-- /.box /.box-info -->
    </g:each>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <div class='pull-right'>
        <a class='btn btn-block btn-primary btn-xs' onclick='dtlAdd("rptReportLkFormatDetails");'>
            <i class='fa fa-plus'></i>
            <g:message code='default.button.addMore' default='Add More'/>
        </a>
    </div>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
</fieldset>
