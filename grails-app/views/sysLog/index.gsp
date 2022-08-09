<%@ page import="org.codehaus.groovy.grails.commons.GrailsApplication; org.aalaa.com.IoUtilService" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.sysLog.pageTitle', default: 'System Log')}"/>
    <title>${entityName}</title>
</head>

<body>
<div class="content-wrapper">
    <section class="content-header">
        <h1>${entityName}</h1>
        <ul class="top-links">
            <sec:access url="/console/index">
                <li>
                    <g:link class="btn btn-xs btn-block btn-primary" controller="console" action="index">
                        <i class="fa fa-terminal"></i> <g:message code="default.button.sysConsole" default="Console"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section>

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section>

    <section class="content">
        <div class="box box-primary no-padding">
            <g:form action="index" method="GET">
                <div class="box-header">
                    <legend><h3 class="box-title"><g:message code="default.button.search" default="Search"/></h3></legend>
                </div>

                <div class="box-body">
                    <g:render template="../template/file_r" model="${[fileList: fileList]}"/>

                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class='form-group'>
                            <label class="required"><g:message code="label.sysLog.viewMode" default="View Mode"/></label>
                            <g:select id="viewMode" name="viewMode" class="form-control viewMode" from="${["plainText": "Plain Text", "tabularFormat": "Tabular Format"]}" value="${viewMode ?: params.viewMode}" optionKey="key" optionValue="value" noSelection="['': 'Select One']" required="required"/>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class='form-group'>
                            <label class="required"><g:message code="label.sysLog.showLine" default="Show Line"/></label>
                            <g:select id="showLine" name="showLine" class="form-control showLine" from="${["100": "Last 100 Lines", "200": "Last 200 Lines", "300": "Last 300 Lines", "400": "Last 400 Lines", "500": "Last 500 Lines"]}" value="${showLine ?: params.showLine}" optionKey="key"
                                      optionValue="value" noSelection="['': 'Select One']" required="required"/>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class='form-group'>
                            <label class="required"><g:message code="label.sysLog.sortingOrder" default="Sorting Order"/></label>
                            <g:select id="sortingOrder" name="sortingOrder" class="form-control sortingOrder" from="${["asc": "Ascending", "desc": "Descending"]}" value="${sortingOrder ?: params.sortingOrder}" optionKey="key" optionValue="value" noSelection="['': 'Select One']" required="required"/>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                        <div class='form-group'>
                            <label><g:message code="label.sysLog.logType" default="Log Type"/></label>
                            <g:select id="logType" name="logType" class="form-control logType" from="${["ALL": "ALL", "DEBUG": "DEBUG", "ERROR": "ERROR", "FATAL": "FATAL", "INFO": "INFO", "TRACE": "TRACE", "WARN": "WARNING"]}" value="${logType ?: params.logType}" optionKey="key" optionValue="value" noSelection="['': 'Select One']"/>
                        </div>
                    </div>

                    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
                        <div class='form-group ${hasErrors(bean: sysLogInstance, field: 'email', 'has-error')}'>
                            <label><g:message code="label.sysLog.keyword" default="Keyword"/></label>
                            <g:textField name="keyword" class="form-control" value="${keyword ?: params.keyword}" placeholder="Keyword"/>
                            <g:renderErrors bean='sysLogInstance' field='keyword'/>
                        </div>
                    </div>

                    <g:render template="../template/fromAndToTime"/>
                </div>

                <div class="box-footer">
                    <g:render template="../template/btn_submit" model="${[btnType: "SEARCH"]}"/>
                </div>
            </g:form>
        </div>

        <div class="box box-danger">
            <div class="box-header">
                <h1 class="p-l-15 text-purple">${entityName} (Last ${showLine} Lines of ${fileName}) File</h1>

                <div class="pull-right" style="margin-top: -40px">
                %{--<sec:access url="/sysLog/index">--}%
                    <g:link class="btn btn-xs btn-block btn-primary" controller="sysLog" action="download" params="${[fileName: fileName]}">
                        <i class="fa fa-cloud-download"></i> <g:message code="default.button.download" default="Download"/>
                    </g:link>
                %{--</sec:access>--}%
                </div>
            </div>

            <div class="box-body">

                <div class='col-xs-12'>
                    <div class="form-group">
                        <table class="table dt-default table-bordered table-striped table-hover table-condensed display nowrap th-center th-colored">
                            <tr>
                                <th>${message(code: 'label.sysLog.filePath', default: 'File Path')}</th>
                                <td class="left">${filePath}</td>
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.fileName', default: 'File Name')}</th>
                                <td class="left">${fileName}</td>
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.fileSize', default: 'File Size')}</th>
                                <td class="left">${fileSize}</td>
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.totalCharacter', default: 'Total Character')}</th>
                                <td class="left">${totalCharacter}</td>
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.totalLine', default: 'Total Lines')}</th>
                                <td class="left">${totalLine}</td>
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.showingRequest', default: 'Showing request for')}</th>
%{--                                <td class="left">Last ${showLine} Lines</td>--}%
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.actualShowing', default: 'Showing')}</th>
%{--                                <td class="left">Last ${showing} Lines</td>--}%
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.totalFilesInPath', default: 'Total File Contains in path')}</th>
                                <td class="left">${fileList?.size()}</td>
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.filesInPath', default: 'File Contains in path')}</th>
                                <td class="left">
                                    <g:if test="${fileList}">
                                        <table class="no-padding table dt-default table-condensed display nowrap">
                                            <tr>
                                                %{--<th>Properties</th>--}%
                                                <th>File Name</th>
                                                <th>Total Character</th>
                                                <th>Last Modified</th>
                                            </tr>
                                            <g:each in="${fileList}" var="file">
                                                <tr>
                                                    %{--<td>${file.properties}</td>--}%
                                                    <td>${file?.name}</td>
                                                    <td>${file?.length()}</td>
                                                    <td>${new java.text.SimpleDateFormat("dd/MM/yyyy hh:mm a").format(file.lastModified())}</td>
                                                </tr>
                                            </g:each>
                                        </table>
                                    </g:if>
                                </td>
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.keyword', default: 'Search Keyword')}</th>
%{--                                <td class="left">${keyword}</td>--}%
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.viewMode', default: 'View Mode')}</th>
%{--                                <td class="left">${viewMode == "plainText" ? "Plain Text" : "Tabular Format"}</td>--}%
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.logType', default: 'Log Type')}</th>
%{--                                <td class="left">${logType}</td>--}%
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.sortingOrder', default: 'Sorting Order')}</th>
%{--                                <td class="left">${sortingOrder == "asc" ? "Ascending" : "Descending"}</td>--}%
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.fromTime', default: 'From Time')}</th>
%{--                                <td class="left">${fromTime}</td>--}%
                            </tr>
                            <tr>
                                <th>${message(code: 'label.sysLog.toTime', default: 'To Time')}</th>
%{--                                <td class="left">${toTime}</td>--}%
                            </tr>
                        </table>
                    </div>
                </div>

                <div class='col-xs-12'>
                    <div class="form-group">
                        <label for="v">Log Text</label>
                        <g:textArea name="v" class="form-control transparent" cols="100" rows="20" value="${v}" disabled="disabled"/>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>