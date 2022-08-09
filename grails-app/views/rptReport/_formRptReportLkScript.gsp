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
        ${message(code: 'label.rptReportLkScript.pageTitle', default: 'Rpt Report Lk Script Details')}
        <span class='pull-right text-purple'>(<input type='checkbox' class='escape-this-block'>${message(code: 'default.message.clickToEscape', default: 'Click to Escape')})</span>
    </legend>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <g:each in="${rptReportLkScriptList ?: new org.aalaa.rpt.RptReportLkScript(params)}" status="i" var="rptReportLkScriptInstance">
        <div class='box box-info rptReportLkScriptDetails'>
            <div class='box-body'>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkScriptInstance, field: 'active', 'has-error')}'>
                        <label class='br'><g:message code="label.rptReportLkScript.active" default="Active"/></label>
                        <g:checkBox class="cb" name="rptReportLkScript[${i}].active"  value="${rptReportLkScriptInstance?.active}" />
                        <g:renderErrors bean='${rptReportLkScriptInstance}' field='active'/>
                    </div>
                </div>

                <g:hiddenField name="rptReportLkScript[${i}].id" value="${rptReportLkScriptInstance?.id}"/>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkScriptInstance, field: 'sysScript', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportLkScript.sysScript" default="Sys Script"/></label>
                        <g:select name="rptReportLkScript[${i}].sysScript" class="form-control many-to-one" from="${org.aalaa.sys.SysScript.list().sort{it.id}}" value="${rptReportLkScriptInstance?.sysScript?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
                        <g:renderErrors bean='${rptReportLkScriptInstance}' field='sysScript'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkScriptInstance, field: 'sortOrder', 'has-error')}'>
                        <label><g:message code="label.rptReportLkScript.sortOrder" default="Sort Order"/></label>
                        <g:field type="number" name="rptReportLkScript[${i}].sortOrder" class="form-control" value="${rptReportLkScriptInstance?.sortOrder}" min="0" max="9999999" step="1.00"/>
                        <g:renderErrors bean='${rptReportLkScriptInstance}' field='sortOrder'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkScriptInstance, field: 'description', 'has-error')}'>
                        <label><g:message code="label.rptReportLkScript.description" default="Description"/></label>
                        <g:textField name="rptReportLkScript[${i}].description" class="form-control" value="${rptReportLkScriptInstance?.description}"/>
                        <g:renderErrors bean='${rptReportLkScriptInstance}' field='description'/>
                    </div>
                </div>

            </div>  <!-- /.box-body -->
        </div>  <!-- /.box /.box-info -->
    </g:each>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <div class='pull-right'>
        <a class='btn btn-block btn-primary btn-xs' onclick='dtlAdd("rptReportLkScriptDetails");'>
            <i class='fa fa-plus'></i>
            <g:message code='default.button.addMore' default='Add More'/>
        </a>
    </div>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
</fieldset>
