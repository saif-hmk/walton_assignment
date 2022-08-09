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
        <title><g:message code="label.org.title.show" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">

            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.show" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/admVendorOrganization/index">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                                <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/admVendorOrganization/create">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-primary" action="create">
                                <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/admVendorOrganization/edit/${admVendorOrganizationInstance?.id}">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${admVendorOrganizationInstance?.id}">
                                <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/admVendorOrganization/delete/${admVendorOrganizationInstance?.id}">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${admVendorOrganizationInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
                <fieldset class="admVendorOrganization-show">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="show-page-content">

                                %{--<g:if test="${admVendorOrganizationInstance?.active}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.active" default="Active"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatBoolean boolean="${admVendorOrganizationInstance?.active}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.code}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.code" default="Code"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="code"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.title}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.title" default="Title"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="title"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.titleNative}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.titleNative" default="Title Native"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="titleNative"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.address}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.address" default="Address"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="address"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.addressNative}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.addressNative" default="Address Native"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="addressNative"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.weight}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.weight" default="Weight"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="weight"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.titleShort}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.titleShort" default="Title Short"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="titleShort"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.titleShortNative}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.titleShortNative" default="Title Short Native"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="titleShortNative"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.contactPersonName}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.contactPersonName" default="Contact Person Name"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="contactPersonName"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.contactPersonPhone}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.contactPersonPhone" default="Contact Person Phone"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="contactPersonPhone"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.logoPath}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.logoPath" default="Logo Path"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="logoPath"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.slogan}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.slogan" default="Slogan"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="slogan"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.establishmentDate}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.establishmentDate" default="Establishment Date"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${admVendorOrganizationInstance?.establishmentDate}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.organizationPhone}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.organizationPhone" default="Organization Phone"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="organizationPhone"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.originCountry}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.originCountry" default="Origin Country"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="originCountry"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.organizationWebsite}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.organizationWebsite" default="Organization Website"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="organizationWebsite"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.organizationEmail}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.organizationEmail" default="Organization Email"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="organizationEmail"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.contactPersonEmail}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.contactPersonEmail" default="Contact Person Email"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="contactPersonEmail"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.chairPersonName}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.chairPersonName" default="Chair Person Name"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="chairPersonName"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.remarks}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.remarks" default="Remarks"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="remarks"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${admVendorOrganizationInstance?.sortOrder}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.admVendorOrganization.sortOrder" default="Sort Order"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${admVendorOrganizationInstance}" field="sortOrder"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%
                            </div>
                        </div><!-- /.box-body -->
                    </div>  <!-- /.box box-primary -->
                </fieldset>
                
                <fieldset class="admBranch-show">
                    <legend><g:message code="label.admBranch.pageTitle" default="Com Branch Details"/></legend>

                    <div class="box box-info">
                        <g:if test="${admVendorOrganizationInstance?.admBranch}">
                            <g:each in="${admVendorOrganizationInstance?.admBranch}" var="admBranchInstance">
                                <div class="box-body">
                                    <div class="show-page-content">
                                        
                                        %{--<g:if test="${admBranchInstance?.active}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.active" default="Active"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:formatBoolean boolean="${admBranchInstance?.active}"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.admVendorOrganization}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.admVendorOrganization" default="Adm Organization"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                
                                                <span class="property-value">
                                                    <g:link controller="admVendorOrganization" action="show" id="${admBranchInstance?.admVendorOrganization?.id}">
                                                        ${admBranchInstance?.admVendorOrganization?.encodeAsHTML()}&nbsp;
                                                    </g:link>
                                                </span>
                                                
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.code}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.code" default="Code"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:fieldValue bean="${admBranchInstance}" field="code"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.weight}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.weight" default="Weight"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:fieldValue bean="${admBranchInstance}" field="weight"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.sortOrder}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.sortOrder" default="Sort Order"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:fieldValue bean="${admBranchInstance}" field="sortOrder"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.title}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.title" default="Title"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:fieldValue bean="${admBranchInstance}" field="title"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.keyword}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.keyword" default="Keyword"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:fieldValue bean="${admBranchInstance}" field="keyword"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.contactPersonName}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.contactPersonName" default="Contact Person Name"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:fieldValue bean="${admBranchInstance}" field="contactPersonName"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.contactPersonPhone}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.contactPersonPhone" default="Contact Person Phone"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:fieldValue bean="${admBranchInstance}" field="contactPersonPhone"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.contactPersonEmail}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.contactPersonEmail" default="Contact Person Email"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:fieldValue bean="${admBranchInstance}" field="contactPersonEmail"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.titleNative}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.titleNative" default="Title Native"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:fieldValue bean="${admBranchInstance}" field="titleNative"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.titleShort}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.titleShort" default="Title Short"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:fieldValue bean="${admBranchInstance}" field="titleShort"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                        %{--<g:if test="${admBranchInstance?.titleShortNative}">--}%
                                        <div class="form-group">
                                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                                <span class="property-label bold">
                                                    <g:message code="label.admBranch.titleShortNative" default="Title Short Native"/>
                                                </span>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                                <span class="property-value">
                                                    <g:fieldValue bean="${admBranchInstance}" field="titleShortNative"/>&nbsp;
                                                </span>
                                            </div>
                                        </div>
                                        %{--</g:if>--}%
                                        
                                    </div>
                                </div>
                                <g:if test="${admVendorOrganizationInstance?.admBranch?.size() > 0}"><hr></g:if>
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
