<!--
 @Created_By : AALAA
 @Date       : 2021.12.09 11:45:12 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.authMenu.pageTitle', default: 'Auth Menu')}"/>
    <title><g:message code="label.org.title.create" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.create" args="[entityName]"/></h1>
        <ul class="top-links">
            <sec:access url="/authMenu/index">
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
            <g:form url="[resource: authMenuInstance, action: 'save']" method="POST">%{-- enctype="multipart/form-data">--}%
                <div class="box-body">
                    <g:render template="form" model="${[authMenuInstance: authMenuInstance, authMenuList: authMenuList]}"/>
                    <g:render template="formChildMenu" model="${[authMenuInstance: authMenuInstance, childMenuList: authMenuInstance?.childMenu]}"/>
                </div><!-- /.box-body -->
                <div class="box-footer">
                    <fieldset class="buttons">
                        <sec:access url="/authMenu/create">
                            <g:render template="../template/btn_submit" model="${[btnType: 'CREATE']}"/>
                        </sec:access>
                    </fieldset>
                </div><!-- /.box-footer -->
            </g:form>
        </div><!-- /.box box-primary -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</body>
</html>