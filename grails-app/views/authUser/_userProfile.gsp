<!--
 @Created_By : AALAA
 @Date       : 2019.10.12 02:17:11 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<section class="content show-page">
    <fieldset class="evmRegistrationOnline-show">

        <legend class="text-purple"><g:message code="label.authUser.tabTitle.generalInfo" default="General Information"/></legend>
        <div class="show-page-content">

            %{--<g:if test="${authUserInstance?.fullName}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUser.fullName" default="Full Name"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserInstance}" field="fullName"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserInstance?.displayName}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUser.displayName" default="Display Name"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserInstance}" field="displayName"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserInstance?.username}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUser.username" default="Username"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserInstance}" field="username"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserInstance?.lastPwResetDate}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUser.lastPwResetDate" default="Last Pw Reset Date"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${authUserInstance?.lastPwResetDate}"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserInstance?.phone}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUser.phone" default="Phone"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserInstance}" field="phone"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserInstance?.email}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUser.email" default="Email"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserInstance}" field="email"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserInstance?.enabled}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUser.enabled" default="Enabled"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:formatBoolean boolean="${authUserInstance?.enabled}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserInstance?.accountExpired}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUser.accountExpired" default="Account Expired"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:formatBoolean boolean="${authUserInstance?.accountExpired}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserInstance?.accountLocked}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUser.accountLocked" default="Account Locked"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:formatBoolean boolean="${authUserInstance?.accountLocked}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserInstance?.passwordExpired}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUser.passwordExpired" default="Password Expired"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:formatBoolean boolean="${authUserInstance?.passwordExpired}" true="${message(code: "default.boolean.true", default: "Yes")}" false="${message(code: "default.boolean.false", default: "No")}"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserInstance?.remarks}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUser.remarks" default="Remarks"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-10 col-lg-10">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserInstance}" field="remarks"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%
        </div>

        <legend class="text-purple p-t-10"><g:message code="label.authUser.tabTitle.personalInfo" default="Personal Information"/></legend>

        <div class="show-page-content">

            %{--<g:if test="${authUserProfileInstance?.fathersName}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUserProfile.fathersName" default="Fathers Name"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserProfileInstance}" field="fathersName"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserProfileInstance?.mothersName}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUserProfile.mothersName" default="Mothers Name"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserProfileInstance}" field="mothersName"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserProfileInstance?.gender}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUserProfile.gender" default="Gender"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserProfileInstance}" field="gender"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserProfileInstance?.dateOfBirth}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUserProfile.dateOfBirth" default="Date Of Birth"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${authUserProfileInstance?.dateOfBirth}"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserProfileInstance?.nationalId}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUserProfile.nationalId" default="National Id"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserProfileInstance}" field="nationalId"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserProfileInstance?.honorific}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUserProfile.honorific" default="Honorific"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserProfileInstance}" field="honorific"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserProfileInstance?.maritalStatus}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUserProfile.maritalStatus" default="Marital Status"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserProfileInstance}" field="maritalStatus"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserProfileInstance?.bloodGroup}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUserProfile.bloodGroup" default="Blood Group"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserProfileInstance}" field="bloodGroup"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserProfileInstance?.religion}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUserProfile.religion" default="Religion"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserProfileInstance}" field="religion"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserProfileInstance?.religion}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="default.label.logCreatedDate" default="Created Date"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:formatDate format="${grailsApplication.config.format.dtp.date}" date="${authUserProfileInstance?.logCreatedDate}"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%
        </div>


        <legend class="text-purple p-t-10"><g:message code="label.authUser.tabTitle.employeeInfo" default="Employee Information"/></legend>

        <div class="show-page-content">

            %{--<g:if test="${authUserLkEmployeeInstance?.hrEmployee}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.authUserLkEmployee.hrEmployee" default="Employee"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserLkEmployeeInstance}" field="hrEmployee"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserLkEmployeeInstance?.hrEmployee?.code}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.hrGeneralEmployee.code" default="Code"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserLkEmployeeInstance?.hrEmployee}" field="code"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserLkEmployeeInstance?.hrEmployee?.department}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.hrGeneralEmployee.department" default="Department"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserLkEmployeeInstance?.hrEmployee}" field="department"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserLkEmployeeInstance?.hrEmployee?.designation}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.hrGeneralEmployee.designation" default="Designation"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserLkEmployeeInstance?.hrEmployee}" field="designation"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserLkEmployeeInstance?.hrEmployee?.honorific}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.hrGeneralEmployee.honorific" default="Honorific"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserLkEmployeeInstance?.hrEmployee}" field="honorific"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserLkEmployeeInstance?.hrEmployee?.gender}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.hrGeneralEmployee.gender" default="Gender"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserLkEmployeeInstance?.hrEmployee}" field="gender"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserLkEmployeeInstance?.hrEmployee?.employmentType}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.hrGeneralEmployee.employmentType" default="Employment Type"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserLkEmployeeInstance?.hrEmployee}" field="employmentType"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

            %{--<g:if test="${authUserLkEmployeeInstance?.hrEmployee?.serviceStatus}">--}%
            <div class="form-group">
                <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                    <span class="property-label bold">
                        <g:message code="label.hrGeneralEmployee.serviceStatus" default="Service Status"/>
                    </span>
                </div>

                <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                    <span class="property-value">
                        <g:fieldValue bean="${authUserLkEmployeeInstance?.hrEmployee}" field="serviceStatus"/>&nbsp;
                    </span>
                </div>
            </div>
            %{--</g:if>--}%

        </div>


        <legend class="text-purple p-t-10"><g:message code="label.authUser.tabTitle.roleInfo" default="Role Information"/></legend>

        <div class="show-page-content">
            <g:if test="${permittedRoles}">
                <g:each in="${permittedRoles}" status="i" var="authUserLkRoleInstance">

                %{--<g:if test="${authUserLkRoleInstance?.authRole}">--}%
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <span class="property-label bold">
                                <g:message code="label.authUserLkRole.authRole" default="Role"/> - ${i+1}
                            </span>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                            <span class="property-value">
                                ${authUserLkRoleInstance}&nbsp;
                            </span>
                        </div>
                    </div>
                %{--</g:if>--}%
                </g:each>
            </g:if>
            <g:else>
                <tr><td class="bold center" colspan="8"><g:message code="default.message.noRecordFound" default="No Record Found...!"/></td></tr>
            </g:else>
        </div>


        <legend class="text-purple p-t-10"><g:message code="label.authUser.tabTitle.branchInfo" default="Branch Information"/></legend>

        <div class="show-page-content">
            <g:if test="${permittedBranches}">
                <g:each in="${permittedBranches}" status="i" var="authUserLkBranchInstance">

                %{--<g:if test="${authUserLkBranchInstance?.admBranch}">--}%
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-2">
                            <span class="property-label bold">
                                <g:message code="label.authUserLkBranch.admBranch" default="Branch"/> - ${i+1}
                            </span>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-md-9 col-lg-10">
                            <span class="property-value">
                                ${authUserLkBranchInstance}&nbsp;
                            </span>
                        </div>
                    </div>
                %{--</g:if>--}%
                </g:each>
            </g:if>
            <g:else>
                <tr><td class="bold center" colspan="8"><g:message code="default.message.noRecordFound" default="No Record Found...!"/></td></tr>
            </g:else>
        </div>
    </fieldset>
</section>
