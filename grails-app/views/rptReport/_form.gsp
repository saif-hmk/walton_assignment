<!--
 @Created_By : AALAA
 @Date       : 2021.11.12 11:52:58 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'module', 'has-error')} required'>
            <label class='required'><g:message code="label.rptReport.module" default="Module"/></label>
            <g:textField name="module" class="form-control" value="${rptReportInstance?.module}" required="required"/>
            <g:renderErrors bean='${rptReportInstance}' field='module'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'fileName', 'has-error')} required'>
            <label class='required'><g:message code="label.rptReport.fileName" default="File Name"/></label>
            <g:textField name="fileName" class="form-control" value="${rptReportInstance?.fileName}" required="required"/>
            <g:renderErrors bean='${rptReportInstance}' field='fileName'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'forGlobalWindow', 'has-error')}'>
            <label class='br'><g:message code="label.rptReport.forGlobalWindow" default="For Global Window"/></label>
            <g:checkBox class="cb" name="forGlobalWindow"  value="${rptReportInstance?.forGlobalWindow}" />
            <g:renderErrors bean='${rptReportInstance}' field='forGlobalWindow'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'complete', 'has-error')}'>
            <label class='br'><g:message code="label.rptReport.complete" default="Complete"/></label>
            <g:checkBox class="cb" name="complete"  value="${rptReportInstance?.complete}" />
            <g:renderErrors bean='${rptReportInstance}' field='complete'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'active', 'has-error')}'>
            <label class='br'><g:message code="label.rptReport.active" default="Active"/></label>
            <g:checkBox class="cb" name="active"  value="${rptReportInstance?.active}" />
            <g:renderErrors bean='${rptReportInstance}' field='active'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'defaultFormat', 'has-error')} required'>
            <label class='required'><g:message code="label.rptReport.defaultFormat" default="Default Format"/></label>
            <g:select name="defaultFormat" class="form-control" from="${org.aalaa.rpt.ReportFormat?.values()}" keys="${org.aalaa.rpt.ReportFormat.values()*.name()}" value="${rptReportInstance?.defaultFormat?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${rptReportInstance}' field='defaultFormat'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'optGroup', 'has-error')} required'>
            <label class='required'><g:message code="label.rptReport.optGroup" default="Opt Group"/></label>
            <g:textField name="optGroup" class="form-control" value="${rptReportInstance?.optGroup}" maxlength="50" required="required"/>
            <g:renderErrors bean='${rptReportInstance}' field='optGroup'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'sortOrder', 'has-error')} required'>
            <label class='required'><g:message code="label.rptReport.sortOrder" default="Sort Order"/></label>
            <g:field type="number" name="sortOrder" class="form-control" value="${rptReportInstance?.sortOrder}" min="0" max="999" step="1.00" required="required"/>
            <g:renderErrors bean='${rptReportInstance}' field='sortOrder'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'title', 'has-error')} required'>
            <label class='required'><g:message code="label.rptReport.title" default="Title"/></label>
            <g:textField name="title" class="form-control" value="${rptReportInstance?.title}" required="required"/>
            <g:renderErrors bean='${rptReportInstance}' field='title'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'admVendorOrganization', 'has-error')}'>
            <label><g:message code="label.rptReport.admVendorOrganization" default="Com Organization"/></label>
            <g:select name="admVendorOrganization" class="form-control many-to-one" from="${org.aalaa.com.AdmOrganization.list().sort{it.id}}" value="${rptReportInstance?.admVendorOrganization?.id}" optionKey="id" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${rptReportInstance}' field='admVendorOrganization'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'subModule', 'has-error')}'>
            <label><g:message code="label.rptReport.subModule" default="Sub Module"/></label>
            <g:textField name="subModule" class="form-control" value="${rptReportInstance?.subModule}"/>
            <g:renderErrors bean='${rptReportInstance}' field='subModule'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'messageType', 'has-error')}'>
            <label><g:message code="label.rptReport.messageType" default="Message Type"/></label>
            <g:textField name="messageType" class="form-control" value="${rptReportInstance?.messageType}" maxlength="15"/>
            <g:renderErrors bean='${rptReportInstance}' field='messageType'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'messageForUser', 'has-error')}'>
            <label><g:message code="label.rptReport.messageForUser" default="Message For User"/></label>
            <g:textArea name="messageForUser" class="form-control" value="${rptReportInstance?.messageForUser}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${rptReportInstance}' field='messageForUser'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'titleNative', 'has-error')}'>
            <label><g:message code="label.rptReport.titleNative" default="Title Native"/></label>
            <g:textArea name="titleNative" class="form-control" value="${rptReportInstance?.titleNative}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${rptReportInstance}' field='titleNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'optGroupNative', 'has-error')}'>
            <label><g:message code="label.rptReport.optGroupNative" default="Opt Group Native"/></label>
            <g:textArea name="optGroupNative" class="form-control" value="${rptReportInstance?.optGroupNative}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${rptReportInstance}' field='optGroupNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.rptReport.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${rptReportInstance?.remarks}" rows="2" cols="40" maxlength="255"/>
            <g:renderErrors bean='${rptReportInstance}' field='remarks'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'shortDescription', 'has-error')}'>
            <label><g:message code="label.rptReport.shortDescription" default="Short Description"/></label>
            <g:textArea name="shortDescription" class="form-control" value="${rptReportInstance?.shortDescription}" rows="2" cols="40" maxlength="1000"/>
            <g:renderErrors bean='${rptReportInstance}' field='shortDescription'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'query', 'has-error')}'>
            <label><g:message code="label.rptReport.query" default="Query"/></label>
            <g:textArea name="query" class="form-control" value="${rptReportInstance?.query}" rows="2" cols="40" maxlength="4000"/>
            <g:renderErrors bean='${rptReportInstance}' field='query'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: rptReportInstance, field: 'code', 'has-error')} required'>
            <label class='required'><g:message code="label.rptReport.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${rptReportInstance?.code}" required="required"/>
            <g:renderErrors bean='${rptReportInstance}' field='code'/>
        </div>
    </div>

</fieldset>
