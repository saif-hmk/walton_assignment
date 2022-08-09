<!--
 @Created_By : AALAA
 @Date       : 2022.07.26 09:58:11 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.admVendorOrganization.pageTitle', default: 'Adm Vendor Organization')}"/>
        <title><g:message code="label.org.title.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/admVendorOrganization/create">
                        <li>
                            <g:link class="btn btn-block btn-primary btn-xs" action="create">
                                <i class="fa fa-plus-circle "></i> <g:message code="default.button.new" default="New"/>
                            </g:link>
                        </li>
                    </sec:access>
                </ul>
            </section><!-- /.content-header -->

            <section class="flash-message">
                <g:render template="../layouts/flashMessage"/>
            </section><!--Flash Message-->

            <section class="content"><!-- Main content -->

                <div class="box box-info search-content" hidden>   <!--Search Content-->
                    <g:form url="[resource: admVendorOrganizationInstance, action: 'index']" method="POST">
                        <div class="box-body">
                            <g:render template="../template/fromAndToDate"/>
                        </div>
                        <div class="box-footer">
							<g:render template="../template/btn_submit" model="${[btnType: "RESET", c_btnSubmit: "pull-left"]}"/>
                            <g:render template="../template/btn_submit" model="${[btnType: "SEARCH"]}"/>
                        </div>
                    </g:form>
                </div>

                <div class="box box-primary">   <!--Table Content-->
                    <div class="box-body">
                        <table class="table dt-default table-bordered table-striped table-hover table-condensed display nowrapX th-center th-colored">
                            <thead>
                                <tr>
                                    <th>${message(code: 'label.admVendorOrganization.code'            , default: 'Code'              )}</th>
                                    <th>${message(code: 'label.admVendorOrganization.title'           , default: 'Title'             )}</th>
                                    <th>${message(code: 'label.admVendorOrganization.titleNative'     , default: 'Title Native'      )}</th>
                                    <th>${message(code: 'label.admVendorOrganization.titleShort'      , default: 'Title Short'       )}</th>
                                    <th>${message(code: 'label.admVendorOrganization.titleShortNative', default: 'Title Short Native')}</th>
                                    <th>${message(code: 'label.admVendorOrganization.address'         , default: 'Address'           )}</th>
                                    <th>${message(code: 'label.admVendorOrganization.addressNative'   , default: 'Address Native'    )}</th>
                                    <th>${message(code: 'label.admVendorOrganization.active'          , default: 'Active'            )}</th>
                                    <th>${message(code: 'default.button.action'                       , default: 'Action'            )}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${admVendorOrganizationInstanceList}">
                                    <g:each in="${admVendorOrganizationInstanceList}" status="i" var="admVendorOrganizationInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="left">${fieldValue(bean: admVendorOrganizationInstance, field: "code"            )}</td>
                                            <td class="left">${fieldValue(bean: admVendorOrganizationInstance, field: "title"           )}</td>
                                            <td class="left">${fieldValue(bean: admVendorOrganizationInstance, field: "titleNative"     )}</td>
                                            <td class="left">${fieldValue(bean: admVendorOrganizationInstance, field: "titleShort"      )}</td>
                                            <td class="left">${fieldValue(bean: admVendorOrganizationInstance, field: "titleShortNative")}</td>
                                            <td class="left">${fieldValue(bean: admVendorOrganizationInstance, field: "address"         )}</td>
                                            <td class="left">${fieldValue(bean: admVendorOrganizationInstance, field: "addressNative"   )}</td>
                                            <td class="center ${admVendorOrganizationInstance?.active ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${admVendorOrganizationInstance.active}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center">
                                                <sec:access url="/admVendorOrganization/show/${admVendorOrganizationInstance?.id}">
                                                    <g:link class="btn btn-xs btn-primary" action="show" id="${admVendorOrganizationInstance?.id}">
                                                        <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/admVendorOrganization/edit/${admVendorOrganizationInstance?.id}">
                                                    <g:link class="btn btn-xs btn-warning" action="edit" id="${admVendorOrganizationInstance?.id}">
                                                        <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/admVendorOrganization/delete/${admVendorOrganizationInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${admVendorOrganizationInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>
