<!--
 @Created_By : AALAA
 @Date       : 2021.12.08 03:17:30 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.authUser.pageTitle', default: 'Auth User')}"/>
    <title><g:message code="label.org.title.create" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.create" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/authUser/index">
                <li>
                    <g:link class="btn btn-block btn-vimeo btn-xs" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.index" default="Index"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content"><!-- Main content -->
        <div class="box box-primary">
            <fieldset class='form'>
                <ul class="nav nav-tabs">
                    <li class="generalInfo"><a data-toggle="tab" href="#generalInfo"><g:message code="label.authUser.tabTitle.generalInfo" default="General Information"/></a></li>
                    <g:if test="${authUserInstance || params?.id}">
                        <li class="personalInfo"><a data-toggle="tab" href="#personalInfo"><g:message code="label.authUser.tabTitle.personalInfo" default="Personal Information"/></a></li>
                        <li class="employeeInfo"><a data-toggle="tab" href="#employeeInfo"><g:message code="label.authUser.tabTitle.employeeInfo" default="Employee Information"/></a></li>
                        <li class="roleInfo"    ><a data-toggle="tab" href="#roleInfo"    ><g:message code="label.authUser.tabTitle.roleInfo"     default="Role Information"    /></a></li>
                        <li class="branchInfo"  ><a data-toggle="tab" href="#branchInfo"  ><g:message code="label.authUser.tabTitle.branchInfo"   default="Branch Information"  /></a></li>
                        <li class="profile"     ><a data-toggle="tab" href="#profile"     ><g:message code="label.authUser.tabTitle.profile"      default="Profile"             /></a></li>
                        %{--
                        <div class="pull-right">
                            <h4><label class="text-success p-r-5">Registration No :</label><label class="text-red p-r-15 copy-to-clipboard">${authUserInstance?.registrationNo}</label></h4>
                        </div>
                        --}%
                    </g:if>
                    <g:else>
                        <li class="disabled personalInfo"><a data-toggle="tab" href="#personalInfo"><g:message code="label.authUser.tabTitle.personalInfo" default="Personal Information"/></a></li>
                        <li class="disabled employeeInfo"><a data-toggle="tab" href="#employeeInfo"><g:message code="label.authUser.tabTitle.employeeInfo" default="Employee Information"/></a></li>
                        <li class="disabled roleInfo"    ><a data-toggle="tab" href="#roleInfo"    ><g:message code="label.authUser.tabTitle.roleInfo"     default="Role Information"/></a></li>
                        <li class="disabled branchInfo"  ><a data-toggle="tab" href="#branchInfo"  ><g:message code="label.authUser.tabTitle.branchInfo"   default="Branch Information"/></a></li>
                        <li class="disabled profile"     ><a data-toggle="tab" href="#profile"     ><g:message code="label.authUser.tabTitle.profile"      default="Profile"/></a></li>
                    </g:else>
                </ul>

                <div class="tab-content">
                    <div id="generalInfo" class="tab-pane fade in active">
                        <g:form url="[resource: authUserInstance, action: 'saveGeneralInfo']" method="POST">
                            <div class="box-body">
                                <g:render template="formGeneralInfo" model="${[authUserInstance: authUserInstance]}"/>
                            </div><!-- /.box-body -->
                            <sec:access url="/authUser/create">
                                <div class="box-footer">
                                    <fieldset class="buttons">
                                        <g:render template="../template/btn_submit" model="${[btnType: 'SAVE', id: "btn_bi"]}"/>
                                    </fieldset>
                                </div><!-- /.box-footer -->
                            </sec:access>
                        </g:form>
                    </div>

                    <div id="personalInfo" class="tab-pane fade in">
                        <g:form url="[resource: authUserInstance, action: 'savePersonalInfo']" method="POST">
                            <div class="box-body">
                                <g:render template="formPersonalInfo" model="${[authUserInstance: authUserInstance, authUserProfileInstance: authUserInstance?.authUserProfile]}"/>
                            </div><!-- /.box-body -->
                            <sec:access url="/authUser/create">
                                <div class="box-footer">
                                    <fieldset class="buttons">
                                        <g:render template="../template/btn_submit" model="${[btnType: 'SAVE', id: "btn_pi"]}"/>
                                    </fieldset>
                                </div><!-- /.box-footer -->
                            </sec:access>
                        </g:form>
                    </div>

                    <div id="employeeInfo" class="tab-pane fade in">
                        <g:form url="[resource: authUserInstance, action: 'saveEmployeeInfo']" method="POST">
                            <div class="box-body">
                                <g:render template="formEmployeeInfo" model="${[authUserInstance: authUserInstance, authUserLkEmployeeInstance: authUserInstance?.authUserLkEmployee]}"/>
                            </div><!-- /.box-body -->
                            <sec:access url="/authUser/create">
                                <div class="box-footer">
                                    <fieldset class="buttons">
                                        <g:render template="../template/btn_submit" model="${[btnType: 'SAVE', id: "btn_bi"]}"/>
                                    </fieldset>
                                </div><!-- /.box-footer -->
                            </sec:access>
                        </g:form>
                    </div>

                    <div id="roleInfo" class="tab-pane fade in">
                        <g:form url="[resource: authUserInstance, action: 'saveRoleInfo']" method="POST">
                            <div class="box-body">
                                <g:render template="formRoleInfo" model="${[authUserInstance: authUserInstance, authRoleList: authRoleList, permittedRoles: permittedRoles]}"/>
                            </div><!-- /.box-body -->
                            <sec:access url="/authUser/create">
                                <div class="box-footer">
                                    <fieldset class="buttons">
                                        <g:render template="../template/btn_submit" model="${[btnType: 'SAVE', id: "btn_ri"]}"/>
                                    </fieldset>
                                </div><!-- /.box-footer -->
                            </sec:access>
                        </g:form>
                    </div>

                    <div id="branchInfo" class="tab-pane fade in">
                        <g:form url="[resource: authUserInstance, action: 'saveBranchInfo']" method="POST">
                            <div class="box-body">
                                <g:render template="formBranchInfo" model="${[authUserInstance: authUserInstance, admBranchList: admBranchList, permittedBranches: permittedBranches]}"/>
                            </div><!-- /.box-body -->
                            <sec:access url="/authUser/create">
                                <div class="box-footer">
                                    <fieldset class="buttons">
                                        <g:render template="../template/btn_submit" model="${[btnType: 'SAVE', id: "btn_bi"]}"/>
                                    </fieldset>
                                </div><!-- /.box-footer -->
                            </sec:access>
                        </g:form>
                    </div>

                    <div id="profile" class="tab-pane fade in">
                        <div class="box-body">
                            <g:render template="userProfile" model="${[authUserInstance: authUserInstance, authUserProfileInstance: authUserInstance?.authUserProfile]}"/>
                        </div><!-- /.box-body -->
                    </div>
                </div>
            </fieldset>
        </div><!-- /.box box-primary -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->

<script type="text/javascript">
    var at = "generalInfo"
    <g:if test="${params.at == "pi"}">
    at = "personalInfo"
    </g:if>
    <g:elseif test="${params.at == "ei"}">
    at = "employeeInfo"
    </g:elseif>
    <g:elseif test="${params.at == "ri"}">
    at = "roleInfo"
    </g:elseif>
    <g:elseif test="${params.at == "bi"}">
    at = "branchInfo"
    </g:elseif>
    <g:elseif test="${params.at == "up"}">
    at = "profile"
    </g:elseif>
    //$("." + at).addClass("active");
    $(document).ready(function () {
        activateTab(at);
        if($.getUrlParameter("ui")){
            $("#username").attr("disabled", "disabled");
            $("#newPassword, #confirmPassword").attr("disabled", "disabled");
        }
    });

    $(document).on("click", ".password-block", function () {
        $("#newPassword, #confirmPassword").removeAttr("disabled");
    });

    $(document).on("blur", ".password-block", function () {
        if(!$("#newPassword").val() && !$("#confirmPassword").val())
            $("#newPassword, #confirmPassword").attr("disabled", "disabled");
    });

    function activateTab(tab) {
        $('.nav-tabs a[href="#' + tab + '"]').tab('show');
    };
    
    $(document).on("click", ".cb-au", function () {
        var t = $(this);
        if(t.is(":checked")){
            t.siblings("input:hidden").val(true);
        }
        else{
            t.siblings("input:hidden").val(null);
        }
    });
</script>
</body>
</html>
