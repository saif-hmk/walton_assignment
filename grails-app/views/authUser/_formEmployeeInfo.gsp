<%@ page import="org.aalaa.hr.HrEmployee" %>
<!--
 @Created_By : AALAA
 @Date       : 2022.08.07 10:18:44 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<div class="box-body">
    <fieldset>
        <legend><g:message code="label.authUser.tabTitle.employeeAssignment" default="Employee Assignment"/></legend>
        <g:hiddenField name="version" value="${authUserInstance?.version}"/>
        <g:hiddenField name="authUserLkEmployee.authUser" value="${authUserInstance?.id}"/>
        <g:hiddenField name="authUserLkEmployee.id"       value="${authUserLkEmployeeInstance?.id}"/>

        <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
            <div class='form-group ${hasErrors(bean: authUserLkEmployeeInstance, field: 'hrEmployee', 'has-error')} required'>
                <label class='required'><g:message code="label.authUserLkEmployee.hrEmployee" default="Employee"/></label>
                <g:select name="authUserLkEmployee.hrEmployee" class="form-control" from="${org.aalaa.hr.HrEmployee?.list()}" value="${authUserLkEmployeeInstance?.hrEmployee?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
                <g:renderErrors bean='${authUserLkEmployeeInstance}' field='hrEmployee'/>
            </div>
        </div>

    </fieldset>
</div>
