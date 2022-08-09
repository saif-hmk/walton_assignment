<%@ page import="org.aalaa.auth.AuthUserProperty" %>
<fieldset class='form'>
    <legend>Others Information</legend>
    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'availability', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProperty.availability" default="Availability"/></label>
            <g:select name="availability" class="form-control" from="${org.aalaa.auth.Availability?.values()}" keys="${org.aalaa.auth.Availability.values()*.name()}" value="${authUserPropertyInstance?.availability?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserPropertyInstance}' field='availability'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'local', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProperty.local" default="Local"/></label>
            <g:select name="local" class="form-control" from="${org.aalaa.sys.Local?.values()}" keys="${org.aalaa.sys.Local.values()*.name()}" value="${authUserPropertyInstance?.local?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserPropertyInstance}' field='local'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'menuType', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProperty.menuType" default="Menu Type"/></label>
            <g:select name="menuType" class="form-control" from="${org.aalaa.sys.MenuType?.values()}" keys="${org.aalaa.sys.MenuType.values()*.name()}" value="${authUserPropertyInstance?.menuType?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserPropertyInstance}' field='menuType'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'isActive', 'has-error')}'>
            <label class='br'><g:message code="label.authUserProperty.isActive" default="Is Active"/></label>
            <g:checkBox class="cb" name="isActive"  value="${authUserPropertyInstance?.isActive}" />
            <g:renderErrors bean='${authUserPropertyInstance}' field='isActive'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'showMessage', 'has-error')}'>
            <label class='br'><g:message code="label.authUserProperty.showMessage" default="Show Message"/></label>
            <g:checkBox class="cb" name="showMessage"  value="${authUserPropertyInstance?.showMessage}" />
            <g:renderErrors bean='${authUserPropertyInstance}' field='showMessage'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'showNotification', 'has-error')}'>
            <label class='br'><g:message code="label.authUserProperty.showNotification" default="Show Notification"/></label>
            <g:checkBox class="cb" name="showNotification"  value="${authUserPropertyInstance?.showNotification}" />
            <g:renderErrors bean='${authUserPropertyInstance}' field='showNotification'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'showTaskList', 'has-error')}'>
            <label class='br'><g:message code="label.authUserProperty.showTaskList" default="Show Task List"/></label>
            <g:checkBox class="cb" name="showTaskList"  value="${authUserPropertyInstance?.showTaskList}" />
            <g:renderErrors bean='${authUserPropertyInstance}' field='showTaskList'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'showSearchBar', 'has-error')}'>
            <label class='br'><g:message code="label.authUserProperty.showSearchBar" default="Show Search Bar"/></label>
            <g:checkBox class="cb" name="showSearchBar"  value="${authUserPropertyInstance?.showSearchBar}" />
            <g:renderErrors bean='${authUserPropertyInstance}' field='showSearchBar'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'searchBoxMode', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProperty.searchBoxMode" default="Search Box Mode"/></label>
            <g:select name="searchBoxMode" class="form-control" from="${org.aalaa.sys.SearchBoxMode?.values()}" keys="${org.aalaa.sys.SearchBoxMode.values()*.name()}" value="${authUserPropertyInstance?.searchBoxMode?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserPropertyInstance}' field='searchBoxMode'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'sidebarExpandOnHover', 'has-error')}'>
            <label class='br'><g:message code="label.authUserProperty.sidebarExpandOnHover" default="Sidebar Expand On Hover"/></label>
            <g:checkBox class="cb" name="sidebarExpandOnHover"  value="${authUserPropertyInstance?.sidebarExpandOnHover}" />
            <g:renderErrors bean='${authUserPropertyInstance}' field='sidebarExpandOnHover'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'openSearchItemInNewTab', 'has-error')}'>
            <label class='br'><g:message code="label.authUserProperty.openSearchItemInNewTab" default="Open Search Item In New Tab"/></label>
            <g:checkBox class="cb" name="openSearchItemInNewTab"  value="${authUserPropertyInstance?.openSearchItemInNewTab}" />
            <g:renderErrors bean='${authUserPropertyInstance}' field='openSearchItemInNewTab'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'showFavouriteMenu', 'has-error')}'>
            <label class='br'><g:message code="label.authUserProperty.showFavouriteMenu" default="Show Favourite Menu"/></label>
            <g:checkBox class="cb" name="showFavouriteMenu"  value="${authUserPropertyInstance?.showFavouriteMenu}" />
            <g:renderErrors bean='${authUserPropertyInstance}' field='showFavouriteMenu'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'formatNumber', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProperty.formatNumber" default="Format Number"/></label>
            <g:select name="formatNumber" class="form-control" from="${org.aalaa.sys.FormatNumber?.values()}" keys="${org.aalaa.sys.FormatNumber.values()*.name()}" value="${authUserPropertyInstance?.formatNumber?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserPropertyInstance}' field='formatNumber'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'formatTimeShort', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProperty.formatTimeShort" default="Format Time Short"/></label>
            <g:select name="formatTimeShort" class="form-control" from="${org.aalaa.sys.FormatTimeShort?.values()}" keys="${org.aalaa.sys.FormatTimeShort.values()*.name()}" value="${authUserPropertyInstance?.formatTimeShort?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserPropertyInstance}' field='formatTimeShort'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'formatTimeLong', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProperty.formatTimeLong" default="Format Time Long"/></label>
            <g:select name="formatTimeLong" class="form-control" from="${org.aalaa.sys.FormatTimeLong?.values()}" keys="${org.aalaa.sys.FormatTimeLong.values()*.name()}" value="${authUserPropertyInstance?.formatTimeLong?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserPropertyInstance}' field='formatTimeLong'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'formatDateLong', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProperty.formatDateLong" default="Format Date Long"/></label>
            <g:select name="formatDateLong" class="form-control" from="${org.aalaa.sys.FormatDateLong?.values()}" keys="${org.aalaa.sys.FormatDateLong.values()*.name()}" value="${authUserPropertyInstance?.formatDateLong?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserPropertyInstance}' field='formatDateLong'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'formatDateShort', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProperty.formatDateShort" default="Format Date Short"/></label>
            <g:select name="formatDateShort" class="form-control" from="${org.aalaa.sys.FormatDateShort?.values()}" keys="${org.aalaa.sys.FormatDateShort.values()*.name()}" value="${authUserPropertyInstance?.formatDateShort?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserPropertyInstance}' field='formatDateShort'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'firstDayOfWeek', 'has-error')} required'>
            <label class='required'><g:message code="label.authUserProperty.firstDayOfWeek" default="First Day Of Week"/></label>
            <g:select name="firstDayOfWeek" class="form-control" from="${org.aalaa.sys.FirstDayOfWeek?.values()}" keys="${org.aalaa.sys.FirstDayOfWeek.values()*.name()}" value="${authUserPropertyInstance?.firstDayOfWeek?.name()}"  noSelection="['': 'Select One']" required="required"/>
            <g:renderErrors bean='${authUserPropertyInstance}' field='firstDayOfWeek'/>
        </div>
    </div>

    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
        <div class='form-group ${hasErrors(bean: authUserPropertyInstance, field: 'remarks', 'has-error')}'>
            <label><g:message code="label.authUserProperty.remarks" default="Remarks"/></label>
            <g:textArea name="remarks" class="form-control" value="${authUserPropertyInstance?.remarks}" rows="2" cols="40" maxlength="500"/>
            <g:renderErrors bean='${authUserPropertyInstance}' field='remarks'/>
        </div>
    </div>

</fieldset>