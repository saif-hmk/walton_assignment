<!--
 @Created_By : AALAA
 @Date       : 2021.10.26 08:35:20 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.admBranch.pageTitle', default: 'Com Branch')}"/>
        <title><g:message code="label.org.title.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/admBranch/create">
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

                <div class="box box-primary">   <!--Table Content-->
                    <div class="box-body table-responsive">
                        <table class="table dt-default table-bordered table-striped table-hover table-condensed display nowrapX th-center th-colored">
                            <!--NB: if you use dataTable (/dt-full/dt-show/...) then you have to remove/comment/block else (No record found) part of your dataTable.-->
                            <thead>
                                <tr>
                                    <th>${message(code: 'label.admBranch.code'  , default: 'Office/Branch Code'  )}</th>
                                    <th>${message(code: 'label.admBranch.title'             , default: 'Title'               )}</th>
                                    <th>${message(code: 'label.admBranch.titleNative'       , default: 'Title Native'        )}</th>
                                    <th>${message(code: 'label.admBranch.titleShort'        , default: 'Title Short'         )}</th>
                                    <th>${message(code: 'label.admBranch.titleShortNative'  , default: 'Title Short Native'  )}</th>
                                    <th>${message(code: 'label.admBranch.contactPersonName' , default: 'Contact Person Name' )}</th>
                                    <th>${message(code: 'label.admBranch.contactPersonPhone', default: 'Contact Person Phone')}</th>
                                    <th>${message(code: 'label.admBranch.contactPersonEmail', default: 'Contact Person Email')}</th>
%{--                                    <th>${message(code: 'label.admBranch.sortOrder'         , default: 'Sort Order'          )}</th>--}%
%{--                                    <th>${message(code: 'label.admBranch.weight'            , default: 'Weight'              )}</th>--}%
                                    <th>${message(code: 'label.admBranch.active'            , default: 'Active'              )}</th>
                                    <th>${message(code: 'default.button.action'             , default: 'Action'              )}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${admBranchInstanceList}">
                                    <g:each in="${admBranchInstanceList}" status="i" var="admBranchInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="left">${fieldValue(bean: admBranchInstance, field: "code")}</td>
                                            <td class="left">${fieldValue(bean: admBranchInstance, field: "title")}</td>
                                            <td class="left">${fieldValue(bean: admBranchInstance, field: "titleNative")}</td>
                                            <td class="left">${fieldValue(bean: admBranchInstance, field: "titleShort")}</td>
                                            <td class="left">${fieldValue(bean: admBranchInstance, field: "titleShortNative")}</td>
                                            <td class="left">${fieldValue(bean: admBranchInstance, field: "contactPersonName")}</td>
                                            <td class="left">${fieldValue(bean: admBranchInstance, field: "contactPersonPhone")}</td>
                                            <td class="left">${fieldValue(bean: admBranchInstance, field: "contactPersonEmail")}</td>
%{--                                            <td class="right">${fieldValue(bean: admBranchInstance, field: "sortOrder")}</td>--}%
%{--                                            <td class="right">${fieldValue(bean: admBranchInstance, field: "weight")}</td>--}%
                                            <td class="center ${admBranchInstance?.active ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${admBranchInstance.active}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center nowrap">
                                                <sec:access url="/admBranch/show/${admBranchInstance?.id}">
                                                    <g:link class="btn btn-xs btn-primary" action="show" id="${admBranchInstance?.id}">
                                                        <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/admBranch/edit/${admBranchInstance?.id}">
                                                    <g:link class="btn btn-xs btn-warning" action="edit" id="${admBranchInstance?.id}">
                                                        <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/admBranch/delete/${admBranchInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${admBranchInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                                                        <i class="fa fa-trash"></i>%{-- <g:message code="default.button.delete" default="Delete"/>--}%
                                                    </g:link>
                                                </sec:access>
                                            </td>
                                        </tr>
                                    </g:each>
                                </g:if>
%{--                                <g:else>--}%
%{--                                    <tr><td class="bold center" colspan="10"><g:message code="default.message.noRecordFound" default="No Record Found...!"/></td></tr>--}%
%{--                                </g:else>--}%
                            </tbody>
                        </table>

            %{--
                        <g:if test="${instanceTotal}">
                            <div class="col-xs-12 no-padding">
                                <div class="col-xs-12 col-md-6 no-padding">
                                    <div class="form-group p-t-15">
                                        <span>Showing total ${admBranchInstanceList?.size()} record(s) out of ${instanceTotal ?: 0} record(s).</span>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-md-6 no-padding">
                                    <div class="pagination paginate pull-right m-t-10">
                                        <g:paginate total="${instanceTotal ?: 0}" params="${params}"/>
                                    </div>
                                </div>
                            </div>
                        </g:if>
            --}%
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>
