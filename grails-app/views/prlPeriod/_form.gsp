<!--
 @Created_By : AALAA
 @Date       : 2022.08.06 08:01:42 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: prlPeriodInstance, field: 'keyword', 'has-error')} required'>
            <label class='required'><g:message code="label.prlPeriod.keyword" default="Keyword"/></label>
            <g:textField name="keyword" class="form-control" value="${prlPeriodInstance?.keyword}" required="required"/>
            <g:renderErrors bean='${prlPeriodInstance}' field='keyword'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: prlPeriodInstance, field: 'title', 'has-error')} required'>
            <label class='required'><g:message code="label.prlPeriod.title" default="Title"/></label>
            <g:textField name="title" class="form-control" value="${prlPeriodInstance?.title}" required="required"/>
            <g:renderErrors bean='${prlPeriodInstance}' field='title'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: prlPeriodInstance, field: 'titleNative', 'has-error')} required'>
            <label class='required'><g:message code="label.prlPeriod.titleNative" default="Title Native"/></label>
            <g:textField name="titleNative" class="form-control" value="${prlPeriodInstance?.titleNative}" required="required"/>
            <g:renderErrors bean='${prlPeriodInstance}' field='titleNative'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: prlPeriodInstance, field: 'dateOfStart', 'has-error')} required'>
            <label class='required'><g:message code="label.prlPeriod.dateOfStart" default="Date Of Start"/></label>
            <g:textField name="dateOfStart" class="form-control dtp-date" value="${prlPeriodInstance?.dateOfStart?.format(grailsApplication.config.format.dtp.date)}" required="required"/>
            <g:renderErrors bean='${prlPeriodInstance}' field='dateOfStart'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: prlPeriodInstance, field: 'dateOfEnd', 'has-error')} required'>
            <label class='required'><g:message code="label.prlPeriod.dateOfEnd" default="Date Of End"/></label>
            <g:textField name="dateOfEnd" class="form-control dtp-date" value="${prlPeriodInstance?.dateOfEnd?.format(grailsApplication.config.format.dtp.date)}" required="required"/>
            <g:renderErrors bean='${prlPeriodInstance}' field='dateOfEnd'/>
        </div>
    </div>

    <div class='col-xs-6 col-sm-3 col-md-2 col-lg-2'>
        <div class='form-group ${hasErrors(bean: prlPeriodInstance, field: 'isActive', 'has-error')}'>
            <label class='br'><g:message code="label.prlPeriod.isActive" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${prlPeriodInstance?.isActive}" />
            <g:renderErrors bean='${prlPeriodInstance}' field='isActive'/>
        </div>
    </div>

    <div class='col-xs-6 col-sm-3 col-md-2 col-lg-2'>
        <div class='form-group ${hasErrors(bean: prlPeriodInstance, field: 'isClosed', 'has-error')}'>
            <label class='br'><g:message code="label.prlPeriod.isClosed" default="Is Closed"/></label>
            <g:checkBox class="cb" name="isClosed"  value="${prlPeriodInstance?.isClosed}" />
            <g:renderErrors bean='${prlPeriodInstance}' field='isClosed'/>
        </div>
    </div>

</fieldset>
