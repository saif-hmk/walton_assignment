<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 08:46:25 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.hrManagementStaff.pageTitle', default: 'Hr Management Staff')}"/>
        <title><g:message code="label.org.title.show" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">

            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.show" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/hrManagementStaff/index">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                                <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/hrManagementStaff/create">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-primary" action="create">
                                <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/hrManagementStaff/edit/${hrManagementStaffInstance?.id}">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${hrManagementStaffInstance?.id}">
                                <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/hrManagementStaff/delete/${hrManagementStaffInstance?.id}">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${hrManagementStaffInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
                <fieldset class="hrManagementStaff-show">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="show-page-content">

                                %{--<g:if test="${hrManagementStaffInstance?.gender}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.gender" default="Gender"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="gender"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.honorific}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.honorific" default="Honorific"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="honorific"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.maritalStatus}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.maritalStatus" default="Marital Status"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="maritalStatus"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.religion}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.religion" default="Religion"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="religion"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.employeeType}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.employeeType" default="Employee Type"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="employeeType"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.employmentType}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.employmentType" default="Employment Type"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="employmentType"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.serviceStatus}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.serviceStatus" default="Service Status"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="serviceStatus"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.code}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.code" default="Code"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="code"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameFull}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameFull" default="Name Full"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameFull"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameFullNative}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameFullNative" default="Name Full Native"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameFullNative"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.mobileNoPrimary}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.mobileNoPrimary" default="Mobile No Primary"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="mobileNoPrimary"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameFather}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameFather" default="Name Father"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameFather"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameMother}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameMother" default="Name Mother"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameMother"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameNativeFather}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameNativeFather" default="Name Native Father"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameNativeFather"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameNativeMother}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameNativeMother" default="Name Native Mother"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameNativeMother"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.locPermanentAddress}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.locPermanentAddress" default="Loc Permanent Address"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="locPermanentAddress"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.locPresentAddress}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.locPresentAddress" default="Loc Present Address"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="locPresentAddress"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.dateOfBirth}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.dateOfBirth" default="Date Of Birth"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrManagementStaffInstance?.dateOfBirth}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.dateOfServiceStart}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.dateOfServiceStart" default="Date Of Service Start"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrManagementStaffInstance?.dateOfServiceStart}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.bloodGroup}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.bloodGroup" default="Blood Group"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="bloodGroup"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.mobileNoSecondary}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.mobileNoSecondary" default="Mobile No Secondary"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="mobileNoSecondary"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.email}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.email" default="Email"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="email"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nid}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nid" default="Nid"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nid"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.bid}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.bid" default="Bid"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="bid"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.grossSalary}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.grossSalary" default="Gross Salary"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="grossSalary"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.grossSalaryJoining}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.grossSalaryJoining" default="Gross Salary Joining"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="grossSalaryJoining"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.dateOfDeath}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.dateOfDeath" default="Date Of Death"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrManagementStaffInstance?.dateOfDeath}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.dateOfServiceEnd}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.dateOfServiceEnd" default="Date Of Service End"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrManagementStaffInstance?.dateOfServiceEnd}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.emergencyContactNo}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.emergencyContactNo" default="Emergency Contact No"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="emergencyContactNo"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.emergencyContactPerson}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.emergencyContactPerson" default="Emergency Contact Person"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="emergencyContactPerson"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.emergencyContactRelation}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.emergencyContactRelation" default="Emergency Contact Relation"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="emergencyContactRelation"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameFirst}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameFirst" default="Name First"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameFirst"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameFirstNative}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameFirstNative" default="Name First Native"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameFirstNative"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameMiddle}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameMiddle" default="Name Middle"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameMiddle"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameLastSur}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameLastSur" default="Name Last Sur"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameLastSur"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameMiddleNative}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameMiddleNative" default="Name Middle Native"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameMiddleNative"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameLastSurNative}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameLastSurNative" default="Name Last Sur Native"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameLastSurNative"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.passportNo}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.passportNo" default="Passport No"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="passportNo"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.passportExpireDate}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.passportExpireDate" default="Passport Expire Date"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrManagementStaffInstance?.passportExpireDate}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameSpouse}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameSpouse" default="Name Spouse"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameSpouse"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.nameSpouseNative}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.nameSpouseNative" default="Name Spouse Native"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="nameSpouseNative"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.familyMemberTotal}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.familyMemberTotal" default="Family Member Total"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="familyMemberTotal"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrManagementStaffInstance?.familyMemberDependent}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrManagementStaff.familyMemberDependent" default="Family Member Dependent"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrManagementStaffInstance}" field="familyMemberDependent"/>&nbsp;
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