<!--
 @Created_By : AALAA
 @Date       : 2022.07.25 11:28:10 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.locDivision.pageTitle', default: 'Loc Division')}"/>
        <title><g:message code="label.org.title.show" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">

            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.show" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/locDivision/index">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                                <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/locDivision/create">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-primary" action="create">
                                <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/locDivision/edit/${locDivisionInstance?.id}">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${locDivisionInstance?.id}">
                                <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/locDivision/delete/${locDivisionInstance?.id}">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${locDivisionInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
                <fieldset class="locDivision-show">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="show-page-content">

                                %{--<g:if test="${locDivisionInstance?.isActive}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.isActive" default="Is Active"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatBoolean boolean="${locDivisionInstance?.isActive}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.locAdmAreaType}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.locAdmAreaType" default="Loc Adm Area Type"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="locAdmAreaType"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.code}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.code" default="Code"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="code"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.name}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.name" default="Name"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="name"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.nameNative}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.nameNative" default="Name Native"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="nameNative"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.population}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.population" default="Population"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="population"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.censusYear}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.censusYear" default="Census Year"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="censusYear"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.areaTotalSqMile}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.areaTotalSqMile" default="Area Total Sq Mile"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="areaTotalSqMile"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.areaTotalSqKm}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.areaTotalSqKm" default="Area Total Sq Km"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="areaTotalSqKm"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.areaLandSqMile}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.areaLandSqMile" default="Area Land Sq Mile"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="areaLandSqMile"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.areaLandSqKm}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.areaLandSqKm" default="Area Land Sq Km"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="areaLandSqKm"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.areaWaterSqMile}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.areaWaterSqMile" default="Area Water Sq Mile"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="areaWaterSqMile"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.areaWaterSqKm}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.areaWaterSqKm" default="Area Water Sq Km"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="areaWaterSqKm"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.remarks}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.remarks" default="Remarks"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="remarks"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.populationDensitySqKm}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.populationDensitySqKm" default="Population Density Sq Km"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="populationDensitySqKm"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.acquired}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.acquired" default="Acquired"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="acquired"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${locDivisionInstance?.establishmentDate}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.locDivision.establishmentDate" default="Establishment Date"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${locDivisionInstance}" field="establishmentDate"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%
                            </div>
                        </div><!-- /.box-body -->
                    </div>  <!-- /.box box-primary -->
                </fieldset>

                
            </section><!-- /.content -->
        </div>
    </body>
</html>