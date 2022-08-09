<!--
 @Created_By : AALAA
 @Date       : 2022.08.08 01:49:17 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.prlProcMst.pageTitle', default: 'Prl Proc Mst')}"/>
    <title><g:message code="label.org.title" args="[entityName]"/> - Process</title>
</head>

<body>
<div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton" args="[entityName]"/> - Process</h1>
        <ul class="top-links">
            <sec:access url="/prlProcMst/rollback">
                <li>
                    <g:link class="btn btn-block btn-danger btn-xs" action="rollback">
                        <i class="fa fa-trash"></i> <g:message code="default.button.rollBack" default="Rollback"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content"><!-- Main content -->
        <div class="box box-success">
            <div class="box-body">
                <g:form url="[resource: prlProcMstInstance, action: 'takeAction']" method="POST">
                    <div class="box-body">
                        <g:hiddenField name="processType" value="PROCESS"/>
                        <g:hiddenField name="redirectTo" value="process"/>
                        <g:render template="form" model="${[prlProcMstInstance: prlProcMstInstance]}"/>
                    </div><!-- /.box-body -->
                    <div class="box-footer">
                        <fieldset class="buttons">
                            <sec:access url="/prlPeriod/create">
                                <g:render template="../template/btn_submit" model="${[btnType: 'PROCESS']}"/>
                            </sec:access>
                        </fieldset>
                    </div><!-- /.box-footer -->
                </g:form>
            </div>
        </div><!-- /.box box-primary -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>
