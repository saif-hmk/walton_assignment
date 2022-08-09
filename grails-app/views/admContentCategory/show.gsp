<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 08:14:41 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.admContentCategory.pageTitle', default: 'Adm Content Category')}"/>
    <title><g:message code="label.org.title.show" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">

    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.show" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/admContentCategory/index">
                <li>
                    <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/admContentCategory/create">
                <li>
                    <g:link class="btn btn-xs btn-block btn-primary" action="create">
                        <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/admContentCategory/edit/${admContentCategoryInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${admContentCategoryInstance?.id}">
                        <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/admContentCategory/delete/${admContentCategoryInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${admContentCategoryInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
        <fieldset class="admContentCategory-show">
            <div class="box box-primary">
                <div class="box-body">
                    <div class="show-page-content">

                        %{--<g:if test="${admContentCategoryInstance?.admVendorOrganization}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <span class="property-label bold">
                                    <g:message code="label.admContentCategory.admVendorOrganization" default="Organization"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                <span class="property-value">
                                    <g:fieldValue bean="${admContentCategoryInstance}" field="admVendorOrganization"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${admContentCategoryInstance?.keyword}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <span class="property-label bold">
                                    <g:message code="label.admContentCategory.keyword" default="Keyword"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                <span class="property-value">
                                    <g:fieldValue bean="${admContentCategoryInstance}" field="keyword"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${admContentCategoryInstance?.title}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <span class="property-label bold">
                                    <g:message code="label.admContentCategory.title" default="Title"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                <span class="property-value">
                                    <g:fieldValue bean="${admContentCategoryInstance}" field="title"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${admContentCategoryInstance?.titleNative}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <span class="property-label bold">
                                    <g:message code="label.admContentCategory.titleNative" default="Title Native"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                <span class="property-value">
                                    <g:fieldValue bean="${admContentCategoryInstance}" field="titleNative"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${admContentCategoryInstance?.titleShort}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <span class="property-label bold">
                                    <g:message code="label.admContentCategory.titleShort" default="Title Short"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                <span class="property-value">
                                    <g:fieldValue bean="${admContentCategoryInstance}" field="titleShort"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${admContentCategoryInstance?.titleShortNative}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <span class="property-label bold">
                                    <g:message code="label.admContentCategory.titleShortNative" default="Title Short Native"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                <span class="property-value">
                                    <g:fieldValue bean="${admContentCategoryInstance}" field="titleShortNative"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${admContentCategoryInstance?.sortOrder}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <span class="property-label bold">
                                    <g:message code="label.admContentCategory.sortOrder" default="Sort Order"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                <span class="property-value">
                                    <g:fieldValue bean="${admContentCategoryInstance}" field="sortOrder"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${admContentCategoryInstance?.active}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <span class="property-label bold">
                                    <g:message code="label.admContentCategory.active" default="Active"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                <span class="property-value">
                                    <g:formatBoolean boolean="${admContentCategoryInstance?.active}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${admContentCategoryInstance?.remarks}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
                                <span class="property-label bold">
                                    <g:message code="label.admContentCategory.remarks" default="Remarks"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
                                <span class="property-value">
                                    <g:fieldValue bean="${admContentCategoryInstance}" field="remarks"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%
                    </div>
                </div><!-- /.box-body -->
            </div>  <!-- /.box box-primary -->
        </fieldset>

        <g:if test="${admContentCategoryInstance?.children}">
            <fieldset class="admContentCategoryDetails-show">
                <legend><g:message code="label.admContentCategoryDetails.pageTitle" default="Content Category Details"/></legend>

                <div class="box box-info"><!--Table Content-->
                    <div class="box-body">
                        <table class="table dt-default table-bordered table-striped table-hover table-condensed display nowrapX th-center th-colored">
                            <thead>
                            <tr>
                                <th>${message(code: 'label.admContentCategory.admVendorOrganization', default: 'Adm Organization'  )}</th>
                                <th>${message(code: 'label.admContentCategory.sortOrder'            , default: 'Sort Order'        )}</th>
                                <th>${message(code: 'label.admContentCategory.parent'               , default: 'Parent (Group)'    )}</th>
                                <th>${message(code: 'label.admContentCategory.keyword'              , default: 'Keyword'           )}</th>
                                <th>${message(code: 'label.admContentCategory.title'                , default: 'Title'             )}</th>
                                <th>${message(code: 'label.admContentCategory.titleNative'          , default: 'Title Native'      )}</th>
                                <th>${message(code: 'label.admContentCategory.titleShort'           , default: 'Title Short'       )}</th>
                                <th>${message(code: 'label.admContentCategory.titleShortNative'     , default: 'Title Short Native')}</th>
                                <th>${message(code: 'label.admContentCategory.active'               , default: 'Active'            )}</th>
                                <th>${message(code: 'default.button.action'                         , default: 'Action'            )}</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:if test="${admContentCategoryInstance?.children}">
                                <g:each in="${admContentCategoryInstance?.children}" status="i" var="admContentCategoryChildrenInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        <td class="left">${fieldValue(bean: admContentCategoryChildrenInstance, field: "admVendorOrganization")}</td>
                                        <td class="left">${fieldValue(bean: admContentCategoryChildrenInstance, field: "sortOrder"            )}</td>
                                        <td class="left">${fieldValue(bean: admContentCategoryChildrenInstance, field: "parent"               )}</td>
                                        <td class="left">${fieldValue(bean: admContentCategoryChildrenInstance, field: "keyword"              )}</td>
                                        <td class="left">${fieldValue(bean: admContentCategoryChildrenInstance, field: "title"                )}</td>
                                        <td class="left">${fieldValue(bean: admContentCategoryChildrenInstance, field: "titleNative"          )}</td>
                                        <td class="left">${fieldValue(bean: admContentCategoryChildrenInstance, field: "titleShort"           )}</td>
                                        <td class="left">${fieldValue(bean: admContentCategoryChildrenInstance, field: "titleShortNative"     )}</td>
                                        <td class="center ${admContentCategoryChildrenInstance?.active ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${admContentCategoryChildrenInstance.active}" true="&#10004;" false="&#10008;"/></td>
                                        <td class="center">
                                            <sec:access url="/admContentCategory/show/${admContentCategoryChildrenInstance?.id}">
                                                <g:link class="btn btn-xs btn-primary" action="show" id="${admContentCategoryChildrenInstance?.id}">
                                                    <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                </g:link>
                                            </sec:access>
                                            <sec:access url="/admContentCategory/edit/${admContentCategoryChildrenInstance?.id}">
                                                <g:link class="btn btn-xs btn-warning" action="edit" id="${admContentCategoryChildrenInstance?.id}">
                                                    <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                </g:link>
                                            </sec:access>
                                            <sec:access url="/admContentCategory/delete/${admContentCategoryChildrenInstance?.id}">
                                                <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${admContentCategoryChildrenInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                                                    <i class="fa fa-trash"></i>%{-- <g:message code="default.button.delete" default="Delete"/>--}%
                                                </g:link>
                                            </sec:access>
                                        </td>
                                    </tr>
                                </g:each>
                            </g:if>
                            </tbody>
                        </table>
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </fieldset>
        </g:if>
    </section><!-- /.content -->
</div>
</body>
</html>
