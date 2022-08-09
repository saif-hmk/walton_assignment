%{--<%@ page import="org.aalaa.auth.AuthRequestMap" %>--}%

%{--
@Created_By : AALAA
@Date       : 2017.10.05 01:20:20 AM
@Author     : Md. Hoshen Mahmud Khan
@Email      : saif_hmk@live.com
@Phone      : +8801672036757
--}%

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authRequestMapInstance, field: 'url', 'has-error')} required'>
            <label class='required'><g:message code="authRequestMap.url.label" default="Url"/></label>
            <g:textField name="url" class="form-control" value="${authRequestMapInstance?.url}" required="required"/>
            <g:renderErrors bean='authRequestMapInstance' field='url'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authRequestMapInstance, field: 'configAttribute', 'has-error')} required'>
            <label class='required'><g:message code="authRequestMap.configAttribute.label" default="Config Attribute"/></label>
            <g:textField name="configAttribute" class="form-control" value="${authRequestMapInstance?.configAttribute}" required="required"/>
            <g:renderErrors bean='authRequestMapInstance' field='configAttribute'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authRequestMapInstance, field: 'httpMethod', 'has-error')}'>
            <label><g:message code="authRequestMap.httpMethod.label" default="Http Method"/></label>
            <g:select name="httpMethod" class="form-control" from="${org.springframework.http.HttpMethod?.values()}" keys="${org.springframework.http.HttpMethod.values()*.name()}" value="${authRequestMapInstance?.httpMethod?.name()}"  noSelection="['': 'Select One']"/>
            <g:renderErrors bean='authRequestMapInstance' field='httpMethod'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authRequestMapInstance, field: 'isActive', 'has-error')}'>
            <label class="br"><g:message code="authRequestMap.isActive.label" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${authRequestMapInstance?.isActive}" />
            <g:renderErrors bean='authRequestMapInstance' field='isActive'/>
        </div>
    </div>

</fieldset>
