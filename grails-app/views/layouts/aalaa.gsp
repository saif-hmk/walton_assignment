<%@ page import="org.aalaa.sys.MenuType" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]>        <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>           <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>           <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>           <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]> <html lang="en" class="no-js">     <![endif]-->
<head>
    %{--===========================================================================================================================================================--}%
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="AALAA"/></title>
    %{--===========================================================================================================================================================--}%
    <g:render template="/layouts/cssCommon"/>
    <g:render template="/layouts/jsCommonScript"/>
    <g:layoutHead/>
</head>
<body class="${applicationContext.authUserService.getBodyClass()}">
%{--===========================================================================================================================================================--}%
<div class="wrapper">
    <g:render template="/layouts/headerWithMenuLeft" model="${[menuType: applicationContext.authUserService.menuType]}"/>
    <g:layoutBody/>
    <g:render template="/layouts/sideBarRight"/>
    <g:render template="/layouts/footer"/>
</div>
%{--===========================================================================================================================================================--}%
<g:render template="/layouts/jsCommon"/>
%{--===========================================================================================================================================================--}%
</body>
</html>
