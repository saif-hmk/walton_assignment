<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <title><g:message code="springSecurity.denied.title" default="Denied"/></title>
    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${resource(dir: "resources/images", file: "favicon.ico")}"/>
</head>

<body>
<div class="content-wrapper">

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section>

    <section class="content">
        <div class="box box-danger">
            <div class="box-body">
                <h1><div class='errors'><g:message code="springSecurity.denied.message" default="Denied"/></div></h1>
            </div>
        </div>
    </section>
</div>
</body>
</html>
