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
        ${message(code: 'label.rptReportLkRole.pageTitle', default: 'Rpt Report Lk Role Details')}
        <span class='pull-right text-purple'>(<input type='checkbox' class='escape-this-block'>${message(code: 'default.message.clickToEscape', default: 'Click to Escape')})</span>
    </legend>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <g:each in="${rptReportLkRoleList ?: new org.aalaa.rpt.RptReportLkRole(params)}" status="i" var="rptReportLkRoleInstance">
        <div class='box box-info rptReportLkRoleDetails'>
            <div class='box-body'>

                <g:hiddenField name="rptReportLkRole[${i}].id" value="${rptReportLkRoleInstance?.id}"/>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkRoleInstance, field: 'authRole', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportLkRole.authRole" default="Auth Role"/></label>
                        <g:select name="rptReportLkRole[${i}].authRole" class="form-control many-to-one" from="${org.aalaa.auth.AuthRole.list().sort{it.id}}" value="${rptReportLkRoleInstance?.authRole?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
                        <g:renderErrors bean='${rptReportLkRoleInstance}' field='authRole'/>
                    </div>
                </div>

            </div>  <!-- /.box-body -->
        </div>  <!-- /.box /.box-info -->
    </g:each>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <div class='pull-right'>
        <a class='btn btn-block btn-primary btn-xs' onclick='dtlAdd("rptReportLkRoleDetails");'>
            <i class='fa fa-plus'></i>
            <g:message code='default.button.addMore' default='Add More'/>
        </a>
    </div>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
</fieldset>
