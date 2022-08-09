<!--
 @Created_By : AALAA
 @Date       : 2021.12.09 11:45:13 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='escapable-block'>
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <legend class='text-purple' style='padding-top: 10px'>
        ${message(code: 'label.childMenu.pageTitle', default: 'Child Menu Details')}
        <span class='pull-right text-purple'><input type='checkbox' class='escape-this-block'> ${message(code: 'default.message.clickToEscape', default: 'Click to Escape')}</span>
    </legend>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <g:each in="${childMenuList ?: new org.aalaa.auth.AuthMenu(params)}" status="i" var="childMenuInstance">
        <g:if test="${authMenuInstance?.id}">
            <g:hiddenField name="parentMenu" value="${authMenuInstance?.id}"/>
        </g:if>
        <div class='box box-info childMenuDetails'>
            <div class='box-body'>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: childMenuInstance, field: 'menuType', 'has-error')}'>
                        <label><g:message code="label.childMenu.menuType" default="Menu Type"/></label>
                        <g:select name="childMenu[${i}].menuType" class="form-control" from="${org.aalaa.sys.MenuType?.values()}" keys="${org.aalaa.sys.MenuType.values()*.name()}" value="${childMenuInstance?.menuType?.name()}" noSelection="['': 'Select One']"/>
                        <g:renderErrors bean='${childMenuInstance}' field='menuType'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: childMenuInstance, field: 'code', 'has-error')}'>
                        <label><g:message code="label.childMenu.code" default="Code"/></label>
                        <g:textField name="childMenu[${i}].code" class="form-control" value="${childMenuInstance?.code}" maxlength="6"/>
                        <g:renderErrors bean='${childMenuInstance}' field='code'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: childMenuInstance, field: 'url', 'has-error')} required'>
                        <label class='required'><g:message code="label.childMenu.url" default="Url"/></label>
                        <g:textField name="childMenu[${i}].url" class="form-control" value="${childMenuInstance?.url}" required="required"/>
                        <g:renderErrors bean='${childMenuInstance}' field='url'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: childMenuInstance, field: 'title', 'has-error')} required'>
                        <label class='required'><g:message code="label.childMenu.title" default="Title"/></label>
                        <g:textField name="childMenu[${i}].title" class="form-control" value="${childMenuInstance?.title}" required="required"/>
                        <g:renderErrors bean='${childMenuInstance}' field='title'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: childMenuInstance, field: 'toolTip', 'has-error')}'>
                        <label><g:message code="label.childMenu.toolTip" default="Tool Tip"/></label>
                        <g:textField name="childMenu[${i}].toolTip" class="form-control" value="${childMenuInstance?.toolTip}"/>
                        <g:renderErrors bean='${childMenuInstance}' field='toolTip'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: childMenuInstance, field: 'menuIcon', 'has-error')}'>
                        <label><g:message code="label.childMenu.menuIcon" default="Menu Icon"/></label>
                        <g:textField name="childMenu[${i}].menuIcon" class="form-control" value="${childMenuInstance?.menuIcon}" maxlength="50"/>
                        <g:renderErrors bean='${childMenuInstance}' field='menuIcon'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: childMenuInstance, field: 'sortOrder', 'has-error')}'>
                        <label><g:message code="label.childMenu.sortOrder" default="Sort Order"/></label>
                        <g:field type="number" name="childMenu[${i}].sortOrder" class="form-control" value="${childMenuInstance?.sortOrder}" min="0" max="9999999" step="1.00"/>
                        <g:renderErrors bean='${childMenuInstance}' field='sortOrder'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: childMenuInstance, field: 'description', 'has-error')}'>
                        <label><g:message code="label.childMenu.description" default="Description"/></label>
                        <g:textField name="childMenu[${i}].description" class="form-control" value="${childMenuInstance?.description}" maxlength="250"/>
                        <g:renderErrors bean='${childMenuInstance}' field='description'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: childMenuInstance, field: 'isActive', 'has-error')}'>
                        <label class='br'><g:message code="label.childMenu.isActive" default="Is Active"/></label>
                        <g:checkBox class="cb" name="childMenu[${i}].isActive"  value="${childMenuInstance?.isActive}" />
                        <g:renderErrors bean='${childMenuInstance}' field='isActive'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: childMenuInstance, field: 'isExternal', 'has-error')}'>
                        <label class='br'><g:message code="label.childMenu.isExternal" default="Is External"/></label>
                        <g:checkBox class="cb" name="childMenu[${i}].isExternal"  value="${childMenuInstance?.isExternal}" />
                        <g:renderErrors bean='${childMenuInstance}' field='isExternal'/>
                    </div>
                </div>

                <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                    <div class='form-group ${hasErrors(bean: childMenuInstance, field: 'isOpenNewTab', 'has-error')}'>
                        <label class='br'><g:message code="label.childMenu.isOpenNewTab" default="Is Open New Tab"/></label>
                        <g:checkBox class="cb" name="childMenu[${i}].isOpenNewTab"  value="${childMenuInstance?.isOpenNewTab}" />
                        <g:renderErrors bean='${childMenuInstance}' field='isOpenNewTab'/>
                    </div>
                </div>

            </div>  <!-- /.box-body -->
        </div>  <!-- /.box /.box-info -->
    </g:each>
<!------------------------------------------------------------------------------------------------------------------------------------------------------------>
    <div class='pull-right'>
        <a class='btn btn-block btn-primary btn-xs' onclick='dtlAdd("childMenuDetails");'>
            <i class='fa fa-plus'></i>
            <g:message code='default.button.addMore' default='Add More'/>
        </a>
    </div>
    <!------------------------------------------------------------------------------------------------------------------------------------------------------------>
</fieldset>
