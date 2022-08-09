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
    <title><g:message code="label.org.title" args="[entityName]"/> - Rollback</title>
</head>

<body>
<div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton" args="[entityName]"/> - Rollback</h1>
        <ul class="top-links">
            <sec:access url="/prlProcMst/process">
                <li>
                    <g:link class="btn btn-block btn-success btn-xs" action="process">
                        <i class="fa fa-wrench"></i> <g:message code="default.button.process" default="Process"/>
                    </g:link>
                </li>
            </sec:access>
        </ul>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content"><!-- Main content -->
        <div class="box box-danger">
            <div class="box-body">
                <g:form url="[resource: prlProcMstInstance, action: 'takeAction']" method="POST">
                    <div class="box-body">
                        <g:hiddenField name="processType" value="ROLLBACK"/>
                        <g:hiddenField name="redirectTo" value="rollback"/>
                        <g:render template="form" model="${[prlProcMstInstance: prlProcMstInstance]}"/>
                    </div><!-- /.box-body -->
                    <div class="box-footer">
                        <fieldset class="buttons">
                            <sec:access url="/prlPeriod/create">
                                <g:render template="../template/btn_submit" model="${[btnType: 'ROLLBACK']}"/>
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
