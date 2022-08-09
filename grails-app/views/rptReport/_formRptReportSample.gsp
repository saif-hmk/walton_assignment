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
        ${message(code: 'label.rptReportSample.pageTitle', default: 'Rpt Report Sample Details')}
        <span class='pull-right text-purple'>(<input type='checkbox' class='escape-this-block'>${message(code: 'default.message.clickToEscape', default: 'Click to Escape')})</span>
    </legend>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <g:each in="${rptReportSampleList ?: new org.aalaa.rpt.RptReportSample(params)}" status="i" var="rptReportSampleInstance">
        <div class='box box-info rptReportSampleDetails'>
            <div class='box-body'>

                <g:hiddenField name="rptReportSample[${i}].id" value="${rptReportSampleInstance?.id}"/>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportSampleInstance, field: 'exportFormat', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportSample.exportFormat" default="Export Format"/></label>
                        <g:select name="rptReportSample[${i}].exportFormat" class="form-control" from="${org.aalaa.rpt.JasperExportFormat?.values()}" keys="${org.aalaa.rpt.JasperExportFormat.values()*.name()}" value="${rptReportSampleInstance?.exportFormat?.name()}"  noSelection="['': 'Select One']" required="required"/>
                        <g:renderErrors bean='${rptReportSampleInstance}' field='exportFormat'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportSampleInstance, field: 'title', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportSample.title" default="Title"/></label>
                        <g:textField name="rptReportSample[${i}].title" class="form-control" value="${rptReportSampleInstance?.title}" required="required"/>
                        <g:renderErrors bean='${rptReportSampleInstance}' field='title'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportSampleInstance, field: 'filePath', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportSample.filePath" default="File Path"/></label>
                        <g:textField name="rptReportSample[${i}].filePath" class="form-control" value="${rptReportSampleInstance?.filePath}" required="required"/>
                        <g:renderErrors bean='${rptReportSampleInstance}' field='filePath'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportSampleInstance, field: 'fileVersion', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportSample.fileVersion" default="File Version"/></label>
                        <g:field type="number" name="rptReportSample[${i}].fileVersion" class="form-control" value="${rptReportSampleInstance?.fileVersion}" min="0" max="9999999" step="1.00" required="required"/>
                        <g:renderErrors bean='${rptReportSampleInstance}' field='fileVersion'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                    <div class='form-group ${hasErrors(bean: rptReportSampleInstance, field: 'titleNative', 'has-error')}'>
                        <label><g:message code="label.rptReportSample.titleNative" default="Title Native"/></label>
                        <g:textArea name="rptReportSample[${i}].titleNative" class="form-control" value="${rptReportSampleInstance?.titleNative}" rows="2" cols="40" maxlength="255"/>
                        <g:renderErrors bean='${rptReportSampleInstance}' field='titleNative'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                    <div class='form-group ${hasErrors(bean: rptReportSampleInstance, field: 'remarks', 'has-error')}'>
                        <label><g:message code="label.rptReportSample.remarks" default="Remarks"/></label>
                        <g:textArea name="rptReportSample[${i}].remarks" class="form-control" value="${rptReportSampleInstance?.remarks}" rows="2" cols="40" maxlength="500"/>
                        <g:renderErrors bean='${rptReportSampleInstance}' field='remarks'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                    <div class='form-group ${hasErrors(bean: rptReportSampleInstance, field: 'query', 'has-error')}'>
                        <label><g:message code="label.rptReportSample.query" default="Query"/></label>
                        <g:textArea name="rptReportSample[${i}].query" class="form-control" value="${rptReportSampleInstance?.query}" rows="2" cols="40" maxlength="2000"/>
                        <g:renderErrors bean='${rptReportSampleInstance}' field='query'/>
                    </div>
                </div>

            </div>  <!-- /.box-body -->
        </div>  <!-- /.box /.box-info -->
    </g:each>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <div class='pull-right'>
        <a class='btn btn-block btn-primary btn-xs' onclick='dtlAdd("rptReportSampleDetails");'>
            <i class='fa fa-plus'></i>
            <g:message code='default.button.addMore' default='Add More'/>
        </a>
    </div>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
</fieldset>
