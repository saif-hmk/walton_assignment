<!--
 @Created_By : AALAA
 @Date       : 2021.12.09 11:45:12 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.authMenu.pageTitle', default: 'Auth Menu')}"/>
    <title><g:message code="label.org.title.show" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">

    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.show" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/authMenu/index">
                <li>
                    <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/authMenu/create">
                <li>
                    <g:link class="btn btn-xs btn-block btn-primary" action="create">
                        <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/authMenu/edit/${authMenuInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${authMenuInstance?.id}">
                        <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/authMenu/delete/${authMenuInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${authMenuInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                        <i class="fa fa-trash"></i> <g:message code="default.button.delete" default="Delete"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content show-page"><!-- Main content -->
        <fieldset class="authMenu-show">
            <div class="box box-primary">
                <div class="box-body">
                    <div class="show-page-content">

                        %{--<g:if test="${authMenuInstance?.parentMenu}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.parentMenu" default="ParentMenu"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:link controller="authMenu" action="show" target="_blank" id="${authMenuInstance?.parentMenu?.id}">
                                        ${authMenuInstance?.parentMenu?.encodeAsHTML()}&nbsp;
                                    </g:link>
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${authMenuInstance?.menuType}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.menuType" default="Menu Type"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${authMenuInstance}" field="menuType"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${authMenuInstance?.code}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.code" default="Code"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${authMenuInstance}" field="code"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${authMenuInstance?.url}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.url" default="Url"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${authMenuInstance}" field="url"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${authMenuInstance?.title}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.title" default="Title"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${authMenuInstance}" field="title"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${authMenuInstance?.toolTip}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.toolTip" default="Tool Tip"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${authMenuInstance}" field="toolTip"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${authMenuInstance?.sortOrder}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.sortOrder" default="Sort Order"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${authMenuInstance}" field="sortOrder"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${authMenuInstance?.menuIcon}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.menuIcon" default="Menu Icon"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${authMenuInstance}" field="menuIcon"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${authMenuInstance?.isActive}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.isActive" default="Is Active"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:formatBoolean boolean="${authMenuInstance?.isActive}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${authMenuInstance?.isExternal}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.isExternal" default="Is External"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:formatBoolean boolean="${authMenuInstance?.isExternal}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${authMenuInstance?.isOpenNewTab}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.isOpenNewTab" default="Is Open New Tab"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:formatBoolean boolean="${authMenuInstance?.isOpenNewTab}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${authMenuInstance?.description}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.authMenu.description" default="Description"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${authMenuInstance}" field="description"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%
                    </div>
                </div><!-- /.box-body -->
            </div>  <!-- /.box box-primary -->
        </fieldset>

        <fieldset class="childMenu-show">
            <legend><g:message code="label.childMenu.pageTitle" default="Child Menu Details"/></legend>

            <div class="box box-info">
                <g:if test="${authMenuInstance?.childMenu}">
                    <g:each in="${authMenuInstance?.childMenu}" var="childMenuInstance">
                        <div class="box-body">
                            <div class="show-page-content">

                                %{--<g:if test="${childMenuInstance?.menuType}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.childMenu.menuType" default="Menu Type"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${childMenuInstance}" field="menuType"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${childMenuInstance?.code}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.childMenu.code" default="Code"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${childMenuInstance}" field="code"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${childMenuInstance?.title}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.childMenu.title" default="Title"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${childMenuInstance}" field="title"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${childMenuInstance?.url}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.childMenu.url" default="Url"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${childMenuInstance}" field="url"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${childMenuInstance?.menuIcon}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.childMenu.menuIcon" default="Menu Icon"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${childMenuInstance}" field="menuIcon"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${childMenuInstance?.sortOrder}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.childMenu.sortOrder" default="Sort Order"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${childMenuInstance}" field="sortOrder"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${childMenuInstance?.toolTip}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.childMenu.toolTip" default="Tool Tip"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${childMenuInstance}" field="toolTip"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${childMenuInstance?.isExternal}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.childMenu.isExternal" default="Is External"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatBoolean boolean="${childMenuInstance?.isExternal}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${childMenuInstance?.isOpenNewTab}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.childMenu.isOpenNewTab" default="Is Open New Tab"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatBoolean boolean="${childMenuInstance?.isOpenNewTab}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${childMenuInstance?.isActive}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.childMenu.isActive" default="Is Active"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatBoolean boolean="${childMenuInstance?.isActive}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--
                                <g:if test="${childMenuInstance?.childMenu}">
                                    <div class="form-group">
                                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                            <span class="property-label bold">
                                                <g:message code="label.childMenu.childMenu" default="Child Menu"/>
                                            </span>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">

                                            <g:each in="${authMenuInstance.childMenu}" var="c">
                                                <span class="property-value">
                                                    <g:link controller="authMenu" action="show" id="${c.id}">
                                                        ${c?.encodeAsHTML()},&nbsp;
                                                    </g:link>
                                                </span>
                                            </g:each>

                                        </div>
                                    </div>
                                </g:if>
                                --}%

                                %{--<g:if test="${childMenuInstance?.description}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.childMenu.description" default="Description"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-10 col-lg-10">
                                        <span class="property-value">
                                            <g:fieldValue bean="${childMenuInstance}" field="description"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                            </div>
                        </div>
                        <g:if test="${authMenuInstance?.childMenu?.size() > 0}"><hr></g:if>
                    </g:each>
                </g:if>
                <g:else>
                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <span class="property-label bold center">
                                    <g:message code="default.message.noRecordFound" default="No Record Found...!"/>
                                </span>
                            </div>
                        </div>
                    </div>
                </g:else>
            </div>
        </fieldset>
    </section><!-- /.content -->
</div>
</body>
</html>