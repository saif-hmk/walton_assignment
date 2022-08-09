<!--
 @Created_By : AALAA
 @Date       : 2022.07.23 08:48:14 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="aalaa">
        <g:set var="entityName" value="${message(code: 'label.hrStaff.pageTitle', default: 'Hr Staff')}"/>
        <title><g:message code="label.org.title.show" args="[entityName]"/></title>
    </head>
    <body>
        <div class="content-wrapper">

            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><g:message code="default.argsButton.show" args="[entityName]"/></h1>
                <ul class="top-links">
                    <sec:access url="/hrStaff/index">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-vimeo" action="index">
                                <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/hrStaff/create">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-primary" action="create">
                                <i class="fa fa-plus-circle"></i> <g:message code="default.button.new" default="New"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/hrStaff/edit/${hrStaffInstance?.id}">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-warning" action="edit" id="${hrStaffInstance?.id}">
                                <i class="fa fa-fw fa-edit"></i> <g:message code="default.button.edit" default="Edit"/>
                            </g:link>
                        </li>
                    </sec:access>
                    <sec:access url="/hrStaff/delete/${hrStaffInstance?.id}">
                        <li>
                            <g:link class="btn btn-xs btn-block btn-danger confirm-delete" action="delete" id="${hrStaffInstance?.id}">%{-- onclick="return confirm('Are you sure you want to delete this record?');">--}%
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
                <fieldset class="hrStaff-show">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div class="show-page-content">

                                %{--<g:if test="${hrStaffInstance?.gender}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.gender" default="Gender"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="gender"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.honorific}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.honorific" default="Honorific"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="honorific"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.maritalStatus}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.maritalStatus" default="Marital Status"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="maritalStatus"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.religion}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.religion" default="Religion"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="religion"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.employeeType}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.employeeType" default="Employee Type"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="employeeType"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.employmentType}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.employmentType" default="Employment Type"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="employmentType"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.serviceStatus}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.serviceStatus" default="Service Status"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="serviceStatus"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.code}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.code" default="Code"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="code"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.nameFull}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.nameFull" default="Name Full"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="nameFull"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.nameFullNative}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.nameFullNative" default="Name Full Native"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="nameFullNative"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.mobileNoPrimary}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.mobileNoPrimary" default="Mobile No Primary"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="mobileNoPrimary"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.nameFather}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.nameFather" default="Name Father"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="nameFather"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.nameMother}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.nameMother" default="Name Mother"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="nameMother"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.nameNativeFather}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.nameNativeFather" default="Name Native Father"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="nameNativeFather"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.nameNativeMother}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.nameNativeMother" default="Name Native Mother"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="nameNativeMother"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.locPermanentAddress}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.locPermanentAddress" default="Loc Permanent Address"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="locPermanentAddress"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.locPresentAddress}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.locPresentAddress" default="Loc Present Address"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="locPresentAddress"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.dateOfBirth}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.dateOfBirth" default="Date Of Birth"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrStaffInstance?.dateOfBirth}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.dateOfServiceStart}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.dateOfServiceStart" default="Date Of Service Start"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrStaffInstance?.dateOfServiceStart}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.bloodGroup}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.bloodGroup" default="Blood Group"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="bloodGroup"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.mobileNoSecondary}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.mobileNoSecondary" default="Mobile No Secondary"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="mobileNoSecondary"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.email}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.email" default="Email"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="email"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.nid}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.nid" default="Nid"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="nid"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.bid}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.bid" default="Bid"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="bid"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.grossSalary}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.grossSalary" default="Gross Salary"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="grossSalary"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.grossSalaryJoining}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.grossSalaryJoining" default="Gross Salary Joining"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="grossSalaryJoining"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.dateOfDeath}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.dateOfDeath" default="Date Of Death"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrStaffInstance?.dateOfDeath}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.dateOfServiceEnd}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.dateOfServiceEnd" default="Date Of Service End"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${hrStaffInstance?.dateOfServiceEnd}"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.emergencyContactNo}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.emergencyContactNo" default="Emergency Contact No"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="emergencyContactNo"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.emergencyContactPerson}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.emergencyContactPerson" default="Emergency Contact Person"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="emergencyContactPerson"/>&nbsp;
                                        </span>
                                    </div>
                                </div>
                                %{--</g:if>--}%

                                %{--<g:if test="${hrStaffInstance?.emergencyContactRelation}">--}%
                                <div class="form-group">
                                    <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                        <span class="property-label bold">
                                            <g:message code="label.hrStaff.emergencyContactRelation" default="Emergency Contact Relation"/>
                                        </span>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                        <span class="property-value">
                                            <g:fieldValue bean="${hrStaffInstance}" field="emergencyContactRelation"/>&nbsp;
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