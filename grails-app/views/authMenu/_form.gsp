<!--
 @Created_By : AALAA
 @Date       : 2021.12.09 11:45:12 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<fieldset class='form'>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'parentMenu', 'has-error')}'>
            <label><g:message code="label.authMenu.parentMenu" default="Parent Menu"/></label>
            %{--<g:select title="parentMenu" class="form-control many-to-one" from="${org.aalaa.auth.AuthMenu.list().sort{it.id}}" value="${authMenuInstance?.parentMenu?.id}" optionKey="id" noSelection="['': 'Select One']"/>--}%
            <g:select name="parentMenu" class="form-control many-to-one select-with-search" from="${authMenuList}" value="${authMenuInstance?.parentMenu?.id}" optionKey="id" optionValue="title" noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${authMenuInstance}' field='parentMenu'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'menuType', 'has-error')}'>
            <label><g:message code="label.authMenu.menuType" default="Menu Type"/></label>
            <g:select name="menuType" class="form-control" from="${org.aalaa.sys.MenuType?.values()}" keys="${org.aalaa.sys.MenuType.values()*.name()}" value="${authMenuInstance?.menuType?.name()}"  noSelection="['': 'Select One']"/>
            <g:renderErrors bean='${authMenuInstance}' field='menuType'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'code', 'has-error')}'>
            <label><g:message code="label.authMenu.code" default="Code"/></label>
            <g:textField name="code" class="form-control" value="${authMenuInstance?.code}" maxlength="6"/>
            <g:renderErrors bean='${authMenuInstance}' field='code'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'url', 'has-error')} required'>
            <label class='required'><g:message code="label.authMenu.url" default="Url"/></label>
            <g:textField name="url" class="form-control" value="${authMenuInstance?.url}" required="required"/>
            <g:renderErrors bean='${authMenuInstance}' field='url'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'title', 'has-error')} required'>
            <label class='required'><g:message code="label.authMenu.title" default="Title"/></label>
            <g:textField name="title" class="form-control" value="${authMenuInstance?.title}" required="required"/>
            <g:renderErrors bean='${authMenuInstance}' field='title'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'toolTip', 'has-error')}'>
            <label><g:message code="label.authMenu.toolTip" default="Tool Tip"/></label>
            <g:textField name="toolTip" class="form-control" value="${authMenuInstance?.toolTip}"/>
            <g:renderErrors bean='${authMenuInstance}' field='toolTip'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'menuIcon', 'has-error')}'>
            <label><g:message code="label.authMenu.menuIcon" default="Menu Icon"/></label>
            <g:textField name="menuIcon" class="form-control" value="${authMenuInstance?.menuIcon}" maxlength="50"/>
            <g:renderErrors bean='${authMenuInstance}' field='menuIcon'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'sortOrder', 'has-error')}'>
            <label><g:message code="label.authMenu.sortOrder" default="Sort Order"/></label>
            <g:field type="number" name="sortOrder" class="form-control" value="${authMenuInstance?.sortOrder}" min="0" max="9999999" step="1.00"/>
            <g:renderErrors bean='${authMenuInstance}' field='sortOrder'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'description', 'has-error')}'>
            <label><g:message code="label.authMenu.description" default="Description"/></label>
            <g:textField name="description" class="form-control" rows="3" value="${authMenuInstance?.description}" maxlength="250"/>
            <g:renderErrors bean='${authMenuInstance}' field='description'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'isActive', 'has-error')}'>
            <label class='br'><g:message code="label.authMenu.isActive" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${authMenuInstance?.isActive}" />
            <g:renderErrors bean='${authMenuInstance}' field='isActive'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'isExternal', 'has-error')}'>
            <label class='br'><g:message code="label.authMenu.isExternal" default="Is External"/></label>
            <g:checkBox class="cb" name="isExternal"  value="${authMenuInstance?.isExternal}" />
            <g:renderErrors bean='${authMenuInstance}' field='isExternal'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authMenuInstance, field: 'isOpenNewTab', 'has-error')}'>
            <label class='br'><g:message code="label.authMenu.isOpenNewTab" default="Is Open New Tab"/></label>
            <g:checkBox class="cb" name="isOpenNewTab"  value="${authMenuInstance?.isOpenNewTab}" />
            <g:renderErrors bean='${authMenuInstance}' field='isOpenNewTab'/>
        </div>
    </div>

</fieldset>
