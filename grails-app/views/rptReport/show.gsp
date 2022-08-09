<!--
 @Created_By : AALAA
 @Date       : 2017.10.24 01:44:45 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.rptReport.pageTitle', default: 'Report')}"/>
    <title><g:message code="default.argsButton.show" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">

    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.show" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/rptReport/index">
                <li>
                    <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/rptReport/create">
                <li>
                    <g:link class="btn btn-xs btn-block btn-primary" action="create">
                        <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/rptReport/edit/${rptReportInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${rptReportInstance?.id}">
                        <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                    </g:link>
                </li>
            </sec:access>
            <sec:access url="/rptReport/delete/${rptReportInstance?.id}">
                <li>
                    <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${rptReportInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
        <fieldset class="rptReport-show">
            <div class="box box-primary">
                <div class="box-body">
                    <div class="show-page-content">

                        %{--<g:if test="${rptReportInstance?.code}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.rptReport.code" default="Code"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${rptReportInstance}" field="code"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${rptReportInstance?.admVendorOrganization}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.rptReport.admVendorOrganization" default="Organization"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${rptReportInstance}" field="admVendorOrganization"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${rptReportInstance?.componentGroup}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.rptReport.module" default="Module"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${rptReportInstance}" field="module"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${rptReportInstance?.subModule}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.rptReport.subModule" default="Sub Module"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${rptReportInstance}" field="subModule"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${rptReportInstance?.title}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.rptReport.title" default="Title"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${rptReportInstance}" field="title"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${rptReportInstance?.fileName}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.rptReport.fileName" default="File Name"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${rptReportInstance}" field="fileName"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${rptReportInstance?.active}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.rptReport.active" default="Is Active"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:formatBoolean boolean="${rptReportInstance?.active}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${rptReportInstance?.remarks}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.rptReport.remarks" default="Remarks"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:fieldValue bean="${rptReportInstance}" field="remarks"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%

                        %{--<g:if test="${rptReportInstance?.query}">--}%
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <span class="property-label bold">
                                    <g:message code="label.rptReport.query" default="Query"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <span class="property-value">
                                    <g:fieldValue bean="${rptReportInstance}" field="query"/>&nbsp;
                                </span>
                            </div>
                        </div>
                        %{--</g:if>--}%
                    </div>
                </div><!-- /.box-body -->
            </div>  <!-- /.box box-primary -->
        </fieldset>

        <fieldset class="rptReportChild-show">
            <div class="box box-info">
                <legend class="p-15 text-purple"><g:message code="label.rptReportChild.pageTitle" default="Report Child Details"/></legend>

                <g:if test="${rptReportInstance?.rptReportChild}">
                    <g:each in="${rptReportInstance?.rptReportChild}" var="rptReportChildInstance">
                        <div class="box-body">

                            %{--<g:if test="${rptReportChildInstance?.fileName}">--}%
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                    <span class="property-label bold">
                                        <g:message code="label.rptReportChild.fileName" default="File Name"/>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                    <span class="property-value">
                                        <g:fieldValue bean="${rptReportChildInstance}" field="fileName"/>&nbsp;
                                    </span>
                                </div>
                            </div>
                            %{--</g:if>--}%

                            %{--<g:if test="${rptReportChildInstance?.remarks}">--}%
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                    <span class="property-label bold">
                                        <g:message code="label.rptReportChild.remarks" default="Remarks"/>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                    <span class="property-value">
                                        <g:fieldValue bean="${rptReportChildInstance}" field="remarks"/>&nbsp;
                                    </span>
                                </div>
                            </div>
                            %{--</g:if>--}%

                            %{--<g:if test="${rptReportChildInstance?.query}">--}%
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                    <span class="property-label bold">
                                        <g:message code="label.rptReportChild.query" default="Query"/>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                    <span class="property-value">
                                        <g:fieldValue bean="${rptReportChildInstance}" field="query"/>&nbsp;
                                    </span>
                                </div>
                            </div>
                            %{--</g:if>--}%

                        </div>
                        <g:if test="${rptReportInstance?.rptReportChild?.size() > 0}"><hr></g:if>
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

        <fieldset class="rptReportLkParam-show">
            <div class="box box-info">
                <legend class="p-15 text-purple"><g:message code="label.rptReportLkParam.pageTitle" default="Report Lk Param Details"/></legend>

                <g:if test="${rptReportInstance?.rptReportLkParam}">
                    <g:each in="${rptReportInstance?.rptReportLkParam}" var="rptReportLkParamInstance">
                        <div class="box-body">

                            %{--<g:if test="${rptReportLkParamInstance?.reportParam}">--}%
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                    <span class="property-label bold">
                                        <g:message code="label.rptReportLkParam.reportParam" default="Report Param"/>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                    <span class="property-value">
                                        <g:fieldValue bean="${rptReportLkParamInstance}" field="reportParam"/>&nbsp;
                                    </span>
                                </div>
                            </div>
                            %{--</g:if>--}%

                            %{--<g:if test="${rptReportLkParamInstance?.propertyType}">--}%
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                    <span class="property-label bold">
                                        <g:message code="label.rptReportLkParam.propertyType" default="Property Type"/>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                    <span class="property-value">
                                        <g:fieldValue bean="${rptReportLkParamInstance}" field="propertyType"/>&nbsp;
                                    </span>
                                </div>
                            </div>
                            %{--</g:if>--}%

                            %{--<g:if test="${rptReportLkParamInstance?.defaultValue}">--}%
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                    <span class="property-label bold">
                                        <g:message code="label.rptReportLkParam.defaultValue" default="Default Value"/>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                    <span class="property-value">
                                        <g:fieldValue bean="${rptReportLkParamInstance}" field="defaultValue"/>&nbsp;
                                    </span>
                                </div>
                            </div>
                            %{--</g:if>--}%

                            %{--<g:if test="${rptReportLkParamInstance?.isActive}">--}%
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                    <span class="property-label bold">
                                        <g:message code="label.rptReportLkParam.isActive" default="Is Active"/>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                    <span class="property-value">
                                        <g:formatBoolean boolean="${rptReportLkParamInstance?.isActive}"/>&nbsp;
                                    </span>
                                </div>
                            </div>
                            %{--</g:if>--}%

                            %{--<g:if test="${rptReportLkParamInstance?.isRequired}">--}%
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                    <span class="property-label bold">
                                        <g:message code="label.rptReportLkParam.isRequired" default="Is Required"/>
                                    </span>
                                </div>

                                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                    <span class="property-value">
                                        <g:formatBoolean boolean="${rptReportLkParamInstance?.isRequired}"/>&nbsp;
                                    </span>
                                </div>
                            </div>
                            %{--</g:if>--}%

                        </div>
                        <g:if test="${rptReportInstance?.rptReportLkParam?.size() > 0}"><hr></g:if>
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

        <fieldset class="rptReportLkRole-show">
            <div class="box box-info">
                <legend class="p-15 text-purple"><g:message code="label.rptReportLkRole.pageTitle" default="Report Lk Role Details"/></legend>

                <div class="box-body">
                    <table class="table table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored tbl-r">
                        <thead>
                        <tr>
                            <th><g:message code="label.rptReportLkRole.authRole" default="Auth Role"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:if test="${rptReportInstance?.rptReportLkRole}">
                            <g:each in="${rptReportInstance?.rptReportLkRole?.sort{it?.authRole?.rank}}" var="rptReportLkRoleInstance" status="i">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td class="left"><g:fieldValue bean="${rptReportLkRoleInstance}" field="authRole"/></td>
                                </tr>
                            </g:each>
                        </g:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </fieldset>
        <fieldset class="rptReportLkFormat-show">

            <div class="box box-info">
                <legend class="p-15 text-purple"><g:message code="label.rptReportLkFormat.pageTitle" default="Report Lk Format Details"/></legend>

                <div class="box-body">
                    <table class="table table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored tbl-r">
                        <thead>
                        <tr>
                            <th><g:message code="label.rptReportLkFormat.reportFormat" default="Report Format"/></th>
                            <th>${message(code: 'label.rptReport.active', default: 'Is Active')}</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:set var="rfK" value="${org.aalaa.rpt.RptReportLkFormat.findAllByRptReport(rptReportInstance)?.reportFormat?.key.toString()}"/>
                        <g:each in="${org.aalaa.rpt.ReportFormat.findAll()}" status="i" var="reportFormatInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td class="left">${reportFormatInstance}</td>
                                <td class="center ${rfK?.contains(reportFormatInstance.key.toString()) ? 'c-success' : 'c-gray-light'}"><g:formatBoolean boolean="${rfK?.contains(reportFormatInstance.key.toString())}" true="&#10004;" false="&#10008;"/></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </fieldset>
    </section><!-- /.content -->
</div>
</body>
</html>
