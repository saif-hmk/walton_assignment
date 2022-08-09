<!--
 @Created_By : AALAA
 @Date       : 2022.07.26 09:58:12 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='escapable-block'>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <legend class='text-purple' style='padding-top: 10px'>
        ${message(code: 'label.admBranch.pageTitle', default: 'Com Branch Details')}
        <span class='pull-right text-purple'>(<input type='checkbox' class='escape-this-block'>${message(code: 'default.message.clickToEscape', default: 'Click to Escape')})</span>
    </legend>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <g:each in="${admBranchList ?: new org.aalaa.adm.AdmBranch(params)}" status="i" var="admBranchInstance">
        <div class='box box-info admBranchDetails'>
            <div class='box-body'>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'active', 'has-error')}'>
                        <label class='br'><g:message code="label.admBranch.active" default="Active"/></label>
                        <g:checkBox class="cb" name="admBranch[${i}].active"  value="${admBranchInstance?.active}" />
                        <g:renderErrors bean='${admBranchInstance}' field='active'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'admVendorOrganization', 'has-error')} required'>
                        <label class='required'><g:message code="label.admBranch.admVendorOrganization" default="Adm Organization"/></label>
                        <g:select name="admBranch[${i}].admVendorOrganization" class="form-control many-to-one" from="${org.aalaa.adm.AdmOrganization.list().sort{it.id}}" value="${admBranchInstance?.admVendorOrganization?.id}" optionKey="id" noSelection="['': 'Select One']" required="required"/>
                        <g:renderErrors bean='${admBranchInstance}' field='admVendorOrganization'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'code', 'has-error')} required'>
                        <label class='required'><g:message code="label.admBranch.code" default="Code"/></label>
                        <g:textField name="admBranch[${i}].code" class="form-control" value="${admBranchInstance?.code}" maxlength="30" required="required"/>
                        <g:renderErrors bean='${admBranchInstance}' field='code'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'weight', 'has-error')} required'>
                        <label class='required'><g:message code="label.admBranch.weight" default="Weight"/></label>
                        <g:field type="number" name="admBranch[${i}].weight" class="form-control" value="${admBranchInstance?.weight}" min="1" max="999" step="1.00" required="required"/>
                        <g:renderErrors bean='${admBranchInstance}' field='weight'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'sortOrder', 'has-error')} required'>
                        <label class='required'><g:message code="label.admBranch.sortOrder" default="Sort Order"/></label>
                        <g:field type="number" name="admBranch[${i}].sortOrder" class="form-control" value="${admBranchInstance?.sortOrder}" min="0" max="999" step="1.00" required="required"/>
                        <g:renderErrors bean='${admBranchInstance}' field='sortOrder'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'title', 'has-error')} required'>
                        <label class='required'><g:message code="label.admBranch.title" default="Title"/></label>
                        <g:textField name="admBranch[${i}].title" class="form-control" value="${admBranchInstance?.title}" maxlength="50" required="required"/>
                        <g:renderErrors bean='${admBranchInstance}' field='title'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'keyword', 'has-error')} required'>
                        <label class='required'><g:message code="label.admBranch.keyword" default="Keyword"/></label>
                        <g:textField name="admBranch[${i}].keyword" class="form-control" value="${admBranchInstance?.keyword}" maxlength="30" required="required"/>
                        <g:renderErrors bean='${admBranchInstance}' field='keyword'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'contactPersonName', 'has-error')}'>
                        <label><g:message code="label.admBranch.contactPersonName" default="Contact Person Name"/></label>
                        <g:textField name="admBranch[${i}].contactPersonName" class="form-control" value="${admBranchInstance?.contactPersonName}"/>
                        <g:renderErrors bean='${admBranchInstance}' field='contactPersonName'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'contactPersonPhone', 'has-error')}'>
                        <label><g:message code="label.admBranch.contactPersonPhone" default="Contact Person Phone"/></label>
                        <g:textField name="admBranch[${i}].contactPersonPhone" class="form-control" value="${admBranchInstance?.contactPersonPhone}"/>
                        <g:renderErrors bean='${admBranchInstance}' field='contactPersonPhone'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'contactPersonEmail', 'has-error')}'>
                        <label><g:message code="label.admBranch.contactPersonEmail" default="Contact Person Email"/></label>
                        <g:field type="email" name="admBranch[${i}].contactPersonEmail" class="form-control" value="${admBranchInstance?.contactPersonEmail}" placeholder="someone@example.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}\$" title="someone@example.com"/>
                        <g:renderErrors bean='${admBranchInstance}' field='contactPersonEmail'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'titleNative', 'has-error')}'>
                        <label><g:message code="label.admBranch.titleNative" default="Title Native"/></label>
                        <g:textField name="admBranch[${i}].titleNative" class="form-control" value="${admBranchInstance?.titleNative}" maxlength="100"/>
                        <g:renderErrors bean='${admBranchInstance}' field='titleNative'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'titleShort', 'has-error')}'>
                        <label><g:message code="label.admBranch.titleShort" default="Title Short"/></label>
                        <g:textField name="admBranch[${i}].titleShort" class="form-control" value="${admBranchInstance?.titleShort}" maxlength="15"/>
                        <g:renderErrors bean='${admBranchInstance}' field='titleShort'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: admBranchInstance, field: 'titleShortNative', 'has-error')}'>
                        <label><g:message code="label.admBranch.titleShortNative" default="Title Short Native"/></label>
                        <g:textField name="admBranch[${i}].titleShortNative" class="form-control" value="${admBranchInstance?.titleShortNative}" maxlength="30"/>
                        <g:renderErrors bean='${admBranchInstance}' field='titleShortNative'/>
                    </div>
                </div>

            </div>  <!-- /.box-body -->
        </div>  <!-- /.box /.box-info -->
    </g:each>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <div class='pull-right'>
        <a class='btn btn-block btn-primary btn-xs' onclick='dtlAdd("admBranchDetails");'>
            <i class='fa fa-plus'></i>
            <g:message code='default.button.addMore' default='Add More'/>
        </a>
    </div>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
</fieldset>
