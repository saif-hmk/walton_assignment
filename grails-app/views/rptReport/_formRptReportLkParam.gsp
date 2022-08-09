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
        ${message(code: 'label.rptReportLkParam.pageTitle', default: 'Rpt Report Lk Param Details')}
        <span class='pull-right text-purple'>(<input type='checkbox' class='escape-this-block'>${message(code: 'default.message.clickToEscape', default: 'Click to Escape')})</span>
    </legend>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <g:each in="${rptReportLkParamList ?: new org.aalaa.rpt.RptReportLkParam(params)}" status="i" var="rptReportLkParamInstance">
        <div class='box box-info rptReportLkParamDetails'>
            <div class='box-body'>

                <g:hiddenField name="rptReportLkParam[${i}].id" value="${rptReportLkParamInstance?.id}"/>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'rptParameter', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportLkParam.rptParameter" default="Rpt Parameter"/></label>
                        <g:select name="rptReportLkParam[${i}].rptParameter" class="form-control many-to-one" from="${org.aalaa.rpt.RptParameter.list().sort{it.id}}" value="${rptReportLkParamInstance?.rptParameter?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='rptParameter'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'dataType', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportLkParam.dataType" default="Data Type"/></label>
                        <g:select name="rptReportLkParam[${i}].dataType" class="form-control" from="${org.aalaa.rpt.DataType?.values()}" keys="${org.aalaa.rpt.DataType.values()*.name()}" value="${rptReportLkParamInstance?.dataType?.name()}"  noSelection="['': 'Select One']" required="required"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='dataType'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'active', 'has-error')}'>
                        <label class='br'><g:message code="label.rptReportLkParam.active" default="Active"/></label>
                        <g:checkBox class="cb" name="rptReportLkParam[${i}].active"  value="${rptReportLkParamInstance?.active}" />
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='active'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'required', 'has-error')}'>
                        <label class='br'><g:message code="label.rptReportLkParam.required" default="Required"/></label>
                        <g:checkBox class="cb" name="rptReportLkParam[${i}].required"  value="${rptReportLkParamInstance?.required}" />
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='required'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'sortOrder', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportLkParam.sortOrder" default="Sort Order"/></label>
                        <g:field type="number" name="rptReportLkParam[${i}].sortOrder" class="form-control" value="${rptReportLkParamInstance?.sortOrder}" min="0" max="9999999" step="1.00" required="required"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='sortOrder'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'replaceParam', 'has-error')}'>
                        <label class='br'><g:message code="label.rptReportLkParam.replaceParam" default="Replace Param"/></label>
                        <g:checkBox class="cb" name="rptReportLkParam[${i}].replaceParam"  value="${rptReportLkParamInstance?.replaceParam}" />
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='replaceParam'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'classResponsive', 'has-error')} required'>
                        <label class='required'><g:message code="label.rptReportLkParam.classResponsive" default="Class Responsive"/></label>
                        <g:textField name="rptReportLkParam[${i}].classResponsive" class="form-control" value="${rptReportLkParamInstance?.classResponsive}" maxlength="50" required="required"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='classResponsive'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'min', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.min" default="Min"/></label>
                        <g:textField name="rptReportLkParam[${i}].min" class="form-control" value="${rptReportLkParamInstance?.min}"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='min'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'max', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.max" default="Max"/></label>
                        <g:textField name="rptReportLkParam[${i}].max" class="form-control" value="${rptReportLkParamInstance?.max}"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='max'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'step', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.step" default="Step"/></label>
                        <g:field type="number" name="rptReportLkParam[${i}].step" class="form-control" value="${fieldValue(bean: rptReportLkParamInstance, field: 'step')}" min="0" max="9999999" step="1.00"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='step'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'defaultValue', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.defaultValue" default="Default Value"/></label>
                        <g:textField name="rptReportLkParam[${i}].defaultValue" class="form-control" value="${rptReportLkParamInstance?.defaultValue}"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='defaultValue'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'queryType', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.queryType" default="Query Type"/></label>
                        <g:select name="rptReportLkParam[${i}].queryType" class="form-control" from="${org.aalaa.sys.QueryType?.values()}" keys="${org.aalaa.sys.QueryType.values()*.name()}" value="${rptReportLkParamInstance?.queryType?.name()}"  noSelection="['': 'Select One']"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='queryType'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'dtAddOrLess', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.dtAddOrLess" default="Dt Add Or Less"/></label>
                        <g:textField name="rptReportLkParam[${i}].dtAddOrLess" class="form-control" value="${rptReportLkParamInstance?.dtAddOrLess}"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='dtAddOrLess'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'collectionPojo', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.collectionPojo" default="Collection Pojo"/></label>
                        <g:textField name="rptReportLkParam[${i}].collectionPojo" class="form-control" value="${rptReportLkParamInstance?.collectionPojo}"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='collectionPojo'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'title', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.title" default="Title"/></label>
                        <g:textField name="rptReportLkParam[${i}].title" class="form-control" value="${rptReportLkParamInstance?.title}" maxlength="100"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='title'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'placeholder', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.placeholder" default="Placeholder"/></label>
                        <g:textField name="rptReportLkParam[${i}].placeholder" class="form-control" value="${rptReportLkParamInstance?.placeholder}" maxlength="50"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='placeholder'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'collectionKey', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.collectionKey" default="Collection Key"/></label>
                        <g:textField name="rptReportLkParam[${i}].collectionKey" class="form-control" value="${rptReportLkParamInstance?.collectionKey}" maxlength="30"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='collectionKey'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'collectionValue', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.collectionValue" default="Collection Value"/></label>
                        <g:textField name="rptReportLkParam[${i}].collectionValue" class="form-control" value="${rptReportLkParamInstance?.collectionValue}" maxlength="30"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='collectionValue'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'collectionValueNative', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.collectionValueNative" default="Collection Value Native"/></label>
                        <g:textField name="rptReportLkParam[${i}].collectionValueNative" class="form-control" value="${rptReportLkParamInstance?.collectionValueNative}" maxlength="60"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='collectionValueNative'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'collectionOrderBy', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.collectionOrderBy" default="Collection Order By"/></label>
                        <g:textField name="rptReportLkParam[${i}].collectionOrderBy" class="form-control" value="${rptReportLkParamInstance?.collectionOrderBy}" maxlength="30"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='collectionOrderBy'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'collectionDirection', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.collectionDirection" default="Collection Direction"/></label>
                        <g:textField name="rptReportLkParam[${i}].collectionDirection" class="form-control" value="${rptReportLkParamInstance?.collectionDirection}" maxlength="30"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='collectionDirection'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'jsId', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.jsId" default="Js Id"/></label>
                        <g:textField name="rptReportLkParam[${i}].jsId" class="form-control" value="${rptReportLkParamInstance?.jsId}" maxlength="30"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='jsId'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'classCss', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.classCss" default="Class Css"/></label>
                        <g:textField name="rptReportLkParam[${i}].classCss" class="form-control" value="${rptReportLkParamInstance?.classCss}" maxlength="50"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='classCss'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'classLabel', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.classLabel" default="Class Label"/></label>
                        <g:textField name="rptReportLkParam[${i}].classLabel" class="form-control" value="${rptReportLkParamInstance?.classLabel}" maxlength="50"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='classLabel'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                    <div class='form-group ${hasErrors(bean: rptReportLkParamInstance, field: 'query', 'has-error')}'>
                        <label><g:message code="label.rptReportLkParam.query" default="Query"/></label>
                        <g:textArea name="rptReportLkParam[${i}].query" class="form-control" value="${rptReportLkParamInstance?.query}" rows="2" cols="40" maxlength="500"/>
                        <g:renderErrors bean='${rptReportLkParamInstance}' field='query'/>
                    </div>
                </div>

            </div>  <!-- /.box-body -->
        </div>  <!-- /.box /.box-info -->
    </g:each>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <div class='pull-right'>
        <a class='btn btn-block btn-primary btn-xs' onclick='dtlAdd("rptReportLkParamDetails");'>
            <i class='fa fa-plus'></i>
            <g:message code='default.button.addMore' default='Add More'/>
        </a>
    </div>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
</fieldset>
