<!--
 @Created_By : AALAA
 @Date       : 2022.05.19 01:22:12 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: nmMessageContentInstance, field: 'title', 'has-error')} required'>
            <label class='required'><g:message code="label.nmMessageContent.title" default="Title"/></label>
            <g:textField name="title" class="form-control" value="${nmMessageContentInstance?.title}" required="required"/>
            <g:renderErrors bean='${nmMessageContentInstance}' field='title'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: nmMessageContentInstance, field: 'category', 'has-error')} required'>
            <label class='required'><g:message code="label.nmMessageContent.category" default="Category"/></label>
            <g:select name="category" class="form-control many-to-one" from="${org.aalaa.com.ComLookup.list().sort { it.id }}" value="${nmMessageContentInstance?.category?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${nmMessageContentInstance}' field='category'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: nmMessageContentInstance, field: 'recipient', 'has-error')} required'>
            <label class='required'><g:message code="label.nmMessageContent.recipient" default="Recipient"/></label>
            <g:select name="recipient" class="form-control many-to-one" from="${org.aalaa.auth.AuthUser.list().sort { it.id }}" value="${nmMessageContentInstance?.recipient?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${nmMessageContentInstance}' field='recipient'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: nmMessageContentInstance, field: 'status', 'has-error')} required'>
            <label class='required'><g:message code="label.nmMessageContent.status" default="Status"/></label>
            <g:select name="status" class="form-control" from="${org.aalaa.nm.StatusNm?.values()}" keys="${org.aalaa.nm.StatusNm.values()*.name()}" value="${nmMessageContentInstance?.status?.name()}" noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${nmMessageContentInstance}' field='status'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: nmMessageContentInstance, field: 'activeFrom', 'has-error')} required'>
            <label class='required'><g:message code="label.nmMessageContent.activeFrom" default="Active From"/></label>
            <g:textField name="activeFrom" class="form-control dtp-date" value="${nmMessageContentInstance?.activeFrom?.format(grailsApplication.config.format.dtp.date)}" required="required"/>
            <g:renderErrors bean='${nmMessageContentInstance}' field='activeFrom'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: nmMessageContentInstance, field: 'activeTo', 'has-error')}'>
            <label><g:message code="label.nmMessageContent.activeTo" default="Active To"/></label>
            <g:textField name="activeTo" class="form-control dtp-date" value="${nmMessageContentInstance?.activeTo?.format(grailsApplication.config.format.dtp.date)}"/>
            <g:renderErrors bean='${nmMessageContentInstance}' field='activeTo'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-4'>
        <div class='form-group ${hasErrors(bean: nmMessageContentInstance, field: 'active', 'has-error')}'>
            <label class='br'><g:message code="label.nmMessageContent.active" default="Active"/></label>
            <g:checkBox class="cb" name="active" value="${nmMessageContentInstance?.active}"/>
            <g:renderErrors bean='${nmMessageContentInstance}' field='active'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: nmMessageContentInstance, field: 'content', 'has-error')} required'>
            <label class='required'><g:message code="label.nmMessageContent.content" default="Content"/></label>
            <g:textArea name="content" class="form-control" value="${nmMessageContentInstance?.content}" required="required" cols="40" rows="2"/>
            <g:renderErrors bean='${nmMessageContentInstance}' field='content'/>
        </div>
    </div>

</fieldset>
