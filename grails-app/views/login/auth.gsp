<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <g:set var="entityName" value="${message(code: 'label.auth.pageTitle', default: 'Login')}"/>
    <title><g:message code="label.org.argsButton" args="[entityName]"/></title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" type="image/x-icon" href="${resource(dir: "resources/images", file: "favicon.ico")}"/>
    <link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/bootstrap/css", file: "bootstrap.min.css")}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/font-awesome/css", file: "font-awesome.min.css")}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/ionicons/css", file: "ionicons.min.css")}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/admin-lte/css", file: "AdminLTE.min.css")}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/iCheck/square", file: "blue.css")}">
    <link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/animate", file: "animate.css")}">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
    <style type="text/css">
    html {
        font: 100%/1.5 "Times New Roman", Verdana, sans-serif;
        -webkit-font-smoothing: antialiased;
        width: 100%;
        overflow: hidden-x;
    }

    .siteTitle {
        /*color: #139ff7;*/
        color: #2672ec;
        background-image: -webkit-linear-gradient(92deg, #2672ec, #139ff7);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        -webkit-animation: hue 60s infinite linear;
    }

    @-webkit-keyframes hue {
        from {
            -webkit-filter: hue-rotate(0deg);
        }
        to {
            -webkit-filter: hue-rotate(-360deg);
        }
    }
    </style>
</head>

<body class="hold-transition login-page">
%{--${System.out.println("Hi from auth.gsp @ " + new Date())}--}%
<div class="login-box">
    <div class="login-logo">
        <a class="siteTitle" style="padding-right: 2px" href="${request.contextPath}/">
            <g:set var="orgNameSmall" value="${message(code: 'label.org.nameSmall', default: 'Walton')}"/>
            <i><g:message code="label.org.argsWelcomeMessage" args="[orgNameSmall]" default="Welcome to - Walton"/></i>
        </a>
    </div>

    <div class="login-box-body">
        <g:if test='${flash.message}'>
            <div class='login_message text-danger animated tada' style="padding-bottom: 10px">${flash.message}</div>
        </g:if>
        <g:else>
            <p class="login-box-msg"><g:message code="label.auth.signInMessage" default="Sign in to start your session"/></p>
        </g:else>
        <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
            <div class="form-group has-feedback">
                <input type="text" name='j_username' class="form-control" placeholder="User Name" required>
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                <input type="password" name='j_password' class="form-control" placeholder="Password" required>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                %{--<i class="fa fa-building-o"></i>--}%
            </div>

            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <input type='checkbox' class='cb' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                        <label for='remember_me'><g:message code="label.auth.rememberMe" default="Remember Me"/></label>
                    </div>
                </div>

                <div class="col-xs-4">
                    <g:render template="../template/btn_submit" model="${[btnType:"LOGIN", c_btnSubmit: "btn btn-success btn-block btn-flat pull-right"]}"/>
                    %{--<button type="submit" class="btn btn-primary btn-block btn-flat pull-right">${message(code: "springSecurity.login.button")}</button>--}%
                </div>
            </div>
        </form>
        %{--
        <div class="social-auth-links text-center">
            <p>- OR -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i
                    class="fa fa-facebook"></i> Sign in using Facebook</a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i
                    class="fa fa-google-plus"></i> Sign in using Google+</a>
        </div>
        <a href="#">I forgot my password</a><br>
        <a href="register.html" class="text-center">Register as a new member</a>
        --}%
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<script type="text/javascript" src="${resource(dir: "resources/plugins/jQuery", file: "jquery-2.2.3.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/bootstrap/js", file: "bootstrap.min.js")}"></script>
<script type="text/javascript" src="${resource(dir: "resources/plugins/iCheck", file: "icheck.min.js")}"></script>
<script type='text/javascript'>
    jQuery(document).ready(function () {
        document.forms['loginForm'].elements['j_username'].focus();
        $(".login-logo").addClass('animated fadeInDownBig');
        $('.cb').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '50%' // optional
        });
        $('.js--triggerAnimation').click(function (e) {
            e.preventDefault();
            animate($('.js--animations').val());
        });
        $('.js--animations').change(function () {
            animate($(this).val());
        });
    });
    function animate(x) {
        $('#animationSandbox').removeClass().addClass(x + ' animated').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $(this).removeClass();
        });
    }
</script>
</body>
</html>


