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
        ${message(code: 'label.rptReportChild.pageTitle', default: 'Rpt Report Child Details')}
        <span class='pull-right text-purple'>(<input type='checkbox' class='escape-this-block'>${message(code: 'default.message.clickToEscape', default: 'Click to Escape')})</span>
    </legend>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <g:each in="${rptReportChildList ?: new org.aalaa.rpt.RptReportChild(params)}" status="i" var="rptReportChildInstance">
        <div class='box box-info rptReportChildDetails'>
            <div class='box-body'>

                <g:hiddenField name="rptReportChild[${i}].id" value="${rptReportChildInstance?.id}"/>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportChildInstance, field: 'fileName', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportChild.fileName" default="File Name"/></label>
                        <g:textField name="rptReportChild[${i}].fileName" class="form-control" value="${rptReportChildInstance?.fileName}" required="required"/>
                        <g:renderErrors bean='${rptReportChildInstance}' field='fileName'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                    <div class='form-group ${hasErrors(bean: rptReportChildInstance, field: 'remarks', 'has-error')}'>
                        <label><g:message code="label.rptReportChild.remarks" default="Remarks"/></label>
                        <g:textArea name="rptReportChild[${i}].remarks" class="form-control" value="${rptReportChildInstance?.remarks}" rows="2" cols="40" maxlength="255"/>
                        <g:renderErrors bean='${rptReportChildInstance}' field='remarks'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                    <div class='form-group ${hasErrors(bean: rptReportChildInstance, field: 'shortDescription', 'has-error')}'>
                        <label><g:message code="label.rptReportChild.shortDescription" default="Short Description"/></label>
                        <g:textArea name="rptReportChild[${i}].shortDescription" class="form-control" value="${rptReportChildInstance?.shortDescription}" rows="2" cols="40" maxlength="1000"/>
                        <g:renderErrors bean='${rptReportChildInstance}' field='shortDescription'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                    <div class='form-group ${hasErrors(bean: rptReportChildInstance, field: 'query', 'has-error')}'>
                        <label><g:message code="label.rptReportChild.query" default="Query"/></label>
                        <g:textArea name="rptReportChild[${i}].query" class="form-control" value="${rptReportChildInstance?.query}" rows="2" cols="40" maxlength="4000"/>
                        <g:renderErrors bean='${rptReportChildInstance}' field='query'/>
                    </div>
                </div>

            </div>  <!-- /.box-body -->
        </div>  <!-- /.box /.box-info -->
    </g:each>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <div class='pull-right'>
        <a class='btn btn-block btn-primary btn-xs' onclick='dtlAdd("rptReportChildDetails");'>
            <i class='fa fa-plus'></i>
            <g:message code='default.button.addMore' default='Add More'/>
        </a>
    </div>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
</fieldset>
