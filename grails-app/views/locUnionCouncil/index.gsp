<!--
 @Created_By : AALAA
 @Date       : 2022.08.06 02:21:42 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.locUnionCouncil.pageTitle', default: 'Loc Union Council')}"/>
        <title><g:message code="label.org.title.index" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/locUnionCouncil/create">
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
                    <g:form url="[resource: locUnionCouncilInstance, action: 'index']" method="POST">
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
                        <table class="table table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored">
                            <!--NB: if you use dataTable ( dt-default/dt-full/dt-show/...) then you have to remove/comment/block else (No record found) part of your dataTable.-->
                            <thead>
                                <tr>
                                    <th>${message(code: 'label.locUnionCouncil.parent', default: 'Parent')}</th>
                                    <th>${message(code: 'label.locUnionCouncil.code', default: 'Code')}</th>
                                    <th>${message(code: 'label.locUnionCouncil.name', default: 'Name')}</th>
                                    <th>${message(code: 'label.locUnionCouncil.nameNative', default: 'Name Native')}</th>
                                    <th>${message(code: 'label.locUnionCouncil.population', default: 'Population')}</th>
                                    <th>${message(code: 'label.locUnionCouncil.isActive', default: 'Is Active')}</th>
                                    <th>${message(code: 'default.button.action', default: 'Action')}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${locUnionCouncilInstanceList}">
                                    <g:each in="${locUnionCouncilInstanceList}" status="i" var="locUnionCouncilInstance">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td class="left">${fieldValue(bean: locUnionCouncilInstance, field: "parent")}</td>
                                            <td class="left">${fieldValue(bean: locUnionCouncilInstance, field: "code")}</td>
                                            <td class="left">${fieldValue(bean: locUnionCouncilInstance, field: "name")}</td>
                                            <td class="left">${fieldValue(bean: locUnionCouncilInstance, field: "nameNative")}</td>
                                            <td class="right">${fieldValue(bean: locUnionCouncilInstance, field: "population")}</td>
                                            <td class="center ${locUnionCouncilInstance?.isActive ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${locUnionCouncilInstance.isActive}" true="&#10004;" false="&#10008;"/></td>
                                            <td class="center">
                                                <sec:access url="/locUnionCouncil/show/${locUnionCouncilInstance?.id}">
                                                    <g:link class="btn btn-xs btn-primary" action="show" id="${locUnionCouncilInstance?.id}">
                                                        <i class="fa fa-eye"></i>%{-- <g:message code="default.button.show" default="Show"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/locUnionCouncil/edit/${locUnionCouncilInstance?.id}">
                                                    <g:link class="btn btn-xs btn-warning" action="edit" id="${locUnionCouncilInstance?.id}">
                                                        <i class="fa fa-fw fa-edit"></i>%{-- <g:message code="default.button.edit" default="Edit"/>--}%
                                                    </g:link>
                                                </sec:access>
                                                <sec:access url="/locUnionCouncil/delete/${locUnionCouncilInstance?.id}">
                                                    <g:link class="btn btn-xs btn-danger confirm-delete" action="delete" id="${locUnionCouncilInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
                                                        <i class="fa fa-trash"></i>%{-- <g:message code="default.button.delete" default="Delete"/>--}%
                                                    </g:link>
                                                </sec:access>
                                            </td>
                                        </tr>
                                    </g:each>
                                </g:if>
                                <g:else>
                                    <tr><td class="bold center" colspan="7"><g:message code="default.message.noRecordFound" default="No Record Found...!"/></td></tr>
                                </g:else>
                            </tbody>
                        </table>

                        <div class="pagination">
                            <g:paginate total="${locUnionCouncilInstanceTotal ?: 0}" params="${params}"/>
                        </div>
                    </div><!-- /.box-body table-responsive no-padding -->
                </div><!-- /.box box-primary -->
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </body>
</html>
