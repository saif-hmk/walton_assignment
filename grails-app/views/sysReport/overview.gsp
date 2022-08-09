<%--
  Created by IntelliJ IDEA.
  User: hoshen.mahmud
  Date: 2017-10-31
  Time: 12:52 AM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'sysReport.overview.pageTitle', default: 'Overview')}"/>
    <title>${entityName}</title>
</head>

<body>
<div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1>${entityName}</h1>
        <ul class="top-links">
            <sec:access url="/report/index">
                <li>
                    <g:link class="btn btn-block btn-vimeo btn-xs" action="index">
                        <i class="fa fa-reorder"></i> <g:message code="default.button.list" default="List"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content show-page"><!-- Main content -->
        <div id="overview" class="box box-primary" role="main">
            <div class="box-body">
                <div class="show-page-content">

                    <g:if test="${applicationContext.startupDate}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.startupDate" default="System Startup Date"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    <g:formatDate format="${grailsApplication.config.format.dtp.dateTime12}" date="${new java.util.Date(applicationContext.startupDate)}"/>&nbsp;
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${applicationContext?.getEnvironment()}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.activeProfile" default="Active Profile"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${applicationContext?.getEnvironment()?.activeProfiles[0]}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:set var="systemEnvironment" value="${applicationContext?.getEnvironment().getProperties()?.systemEnvironment}"/>

                    <g:if test="${systemEnvironment?.ALLUSERSPROFILE}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.ALLUSERSPROFILE" default="ALLUSERSPROFILE"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.ALLUSERSPROFILE}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.APPDATA}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.APPDATA" default="APPDATA"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.APPDATA}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.COMPUTERNAME}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.COMPUTERNAME" default="COMPUTERNAME"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.COMPUTERNAME}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.ComSpec}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.ComSpec" default="ComSpec"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.ComSpec}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.CommonProgramFiles}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.CommonProgramFiles" default="CommonProgramFiles"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.CommonProgramFiles}
                                </span>
                            </div>
                        </div>
                    </g:if>

                %{--<g:if test="${systemEnvironment?.CommonProgramFiles(x86)}">
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <span class="property-label bold">
                                <g:message code="label.sysReport.CommonProgramFiles(x86)" default="CommonProgramFiles(x86)"/>
                            </span>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                            <span class="property-value">
                                ${systemEnvironment?.CommonProgramFiles(x86)}
                            </span>
                        </div>
                    </div>
                </g:if>--}%

                    <g:if test="${systemEnvironment?.CommonProgramW6432}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.CommonProgramW6432" default="CommonProgramW6432"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.CommonProgramW6432}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.GRAILS_HOME}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.GRAILS_HOME" default="GRAILS_HOME"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.GRAILS_HOME}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.HOMEPATH}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.HOMEPATH" default="HOMEPATH"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.HOMEPATH}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.JAVA_HOME}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.JAVA_HOME" default="JAVA_HOME"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.JAVA_HOME}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.LOCALAPPDATA}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.LOCALAPPDATA" default="LOCALAPPDATA"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.LOCALAPPDATA}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.LOGONSERVER}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.LOGONSERVER" default="LOGONSERVER"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.LOGONSERVER}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.MAVEN_HOME}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.MAVEN_HOME" default="MAVEN_HOME"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.MAVEN_HOME}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.MOZ_PLUGIN_PATH}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.MOZ_PLUGIN_PATH" default="MOZ_PLUGIN_PATH"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.MOZ_PLUGIN_PATH}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.NUMBER_OF_PROCESSORS}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.NUMBER_OF_PROCESSORS" default="NUMBER_OF_PROCESSORS"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.NUMBER_OF_PROCESSORS}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.OS}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.OS" default="OS"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.OS}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.PATHEXT}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.PATHEXT" default="PATHEXT"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.PATHEXT}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.PROCESSOR_ARCHITECTURE}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.PROCESSOR_ARCHITECTURE" default="PROCESSOR_ARCHITECTURE"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.PROCESSOR_ARCHITECTURE}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.PROCESSOR_IDENTIFIER}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.PROCESSOR_IDENTIFIER" default="PROCESSOR_IDENTIFIER"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.PROCESSOR_IDENTIFIER}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.PROCESSOR_LEVEL}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.PROCESSOR_LEVEL" default="PROCESSOR_LEVEL"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.PROCESSOR_LEVEL}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.PROCESSOR_REVISION}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.PROCESSOR_REVISION" default="PROCESSOR_REVISION"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.PROCESSOR_REVISION}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.PUBLIC}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.PUBLIC" default="PUBLIC"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.PUBLIC}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.ProgramData}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.ProgramData" default="ProgramData"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.ProgramData}
                                </span>
                            </div>
                        </div>
                    </g:if>

                %{--<g:if test="${systemEnvironment?.ProgramFiles(x86)}">
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                            <span class="property-label bold">
                                <g:message code="label.sysReport.ProgramFiles(x86)" default="ProgramFiles(x86)"/>
                            </span>
                        </div>

                        <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                            <span class="property-value">
                                ${systemEnvironment?.ProgramFiles(x86)}
                            </span>
                        </div>
                    </div>
                </g:if>--}%

                    <g:if test="${systemEnvironment?.ProgramFiles}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.ProgramFiles" default="ProgramFiles"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.ProgramFiles}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.ProgramW6432}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.ProgramW6432" default="ProgramW6432"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.ProgramW6432}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.SESSIONNAME}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.SESSIONNAME" default="SESSIONNAME"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.SESSIONNAME}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.SystemDrive}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.SystemDrive" default="SystemDrive"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.SystemDrive}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.SystemRoot}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.SystemRoot" default="SystemRoot"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.SystemRoot}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.TEMP}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.TEMP" default="TEMP"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.TEMP}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.TMP}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.TMP" default="TMP"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.TMP}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.USERDNSDOMAIN}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.USERDNSDOMAIN" default="User DNS Domain"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.USERDNSDOMAIN}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.USERDOMAIN}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.USERDOMAIN" default="User Domain"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.USERDOMAIN}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.USERDOMAIN_ROAMINGPROFILE}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.userDomain" default="UD. Roaming Profile"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.USERDOMAIN_ROAMINGPROFILE}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.USERNAME}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.USERNAME" default="USERNAME"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.USERNAME}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.USERPROFILE}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.USERPROFILE" default="USERPROFILE"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.USERPROFILE}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.VISUALSVN_SERVER}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.VISUALSVN_SERVER" default="VISUALSVN_SERVER"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.VISUALSVN_SERVER}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.windir}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.windir" default="windir"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-4">
                                <span class="property-value">
                                    ${systemEnvironment?.windir}
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.PSModulePath}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.PSModulePath" default="PSModulePath"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-10">
                                <span class="property-value">
                                %{--${systemEnvironment?.PSModulePath}--}%
                                    <g:each in="${systemEnvironment?.PSModulePath?.split(";").sort()}" var="mp">${mp};<br></g:each>
                                </span>
                            </div>
                        </div>
                    </g:if>

                    <g:if test="${systemEnvironment?.Path}">
                        <div class="form-group">
                            <div class="col-xs-12 col-sm-4 col-md-2 col-lg-2">
                                <span class="property-label bold">
                                    <g:message code="label.sysReport.Path" default="Path"/>
                                </span>
                            </div>

                            <div class="col-xs-12 col-sm-8 col-md-4 col-lg-10">
                                <span class="property-value">
                                %{--${systemEnvironment?.Path}--}%
                                    <g:each in="${systemEnvironment?.Path?.split(";")?.sort()}" var="p">${p};<br></g:each>
                                </span>
                            </div>
                        </div>
                    </g:if>
                </div>
            </div>

            <div class="box-body">
                <legend>Other Items : </legend>
                %{--${applicationContext?.getDisplayName()?.properties}--}%
                %{--${applicationContext?.getProperties().get("grailsApplication").properties?.get("config").get("grails")}--}%
                %{--${applicationContext?.getProperties().get("grailsApplication").properties}--}%
                <g:each in="${applicationContext?.getProperties().get("grailsApplication").properties.get("flatConfig")?.keySet()?.sort()}" var="k">==> ${k} = ${applicationContext?.getProperties().get("grailsApplication").properties?.get("flatConfig")?.get(k)}<br></g:each>
                <br>
                <g:each in="${applicationContext?.getProperties().get("grailsApplication").properties.get("config").get("grails")?.keySet()?.sort()}" var="k">==> ${k} = ${applicationContext?.getProperties().get("grailsApplication").properties?.get("config").get("grails")?.get(k)}<br></g:each>
                <br>
                <g:each in="${applicationContext?.getProperties().get("grailsApplication").properties?.keySet()?.sort()}" var="k">==> ${k} = ${applicationContext?.getProperties().get("grailsApplication").properties.get(k)}<br></g:each>
                <br>
                <g:each in="${applicationContext?.getProperties()?.keySet()?.sort()}" var="k">==> ${k} = ${applicationContext?.getProperties().get(k)}<br></g:each>
            </div>
        </div><!-- /.box box-primary -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
%{--<script type="text/javascript">--}%
%{--$("#startupDate").text(startupDate);--}%
%{--</script>--}%
</body>
</html>