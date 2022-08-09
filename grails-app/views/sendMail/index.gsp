<!--
 @Created_By : AALAA
 @Date       : 2022.07.05 11:29:05 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Email Test</title>
</head>

<body>
<script>
    document.ready(alert("Note : Currently Yahoo account is working properly!"));
</script>
<fieldset style="padding-top: 20px">
    <g:form method="post" action="sendEmail">
        <table>
            <tr>
                <td valign="top">
                    <label for="from" style="color:#000;">From</label>
                </td>
                <td valign="top">
                    <input style="height:30px; width:300px;" type="text" id="from" name="from" maxlength="80" size="30" required="required">
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <label for="password" style="color:#000;">Password</label>
                </td>
                <td valign="top">
                    <input style="height:30px; width:300px;" type="password" id="password" name="password" maxlength="80"
                           size="30" required="required">
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <label for="to" style="color:#000;">To</label>
                </td>
                <td valign="top">
                    <input style="height:30px; width:300px;" type="text" id="to" name="to" maxlength="80"
                           size="30" required="required">
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <label for="from" style="color:#000;">CC</label>
                </td>
                <td valign="top">
                    <input style="height:30px; width:300px;" type="text" id="cc" name="cc" maxlength="500"
                           size="30">
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <label for="subject" style="color:#000;">Subject</label>
                </td>
                <td valign="top">
                    <input style="height:30px; width:300px;" type="text" id="subject" name="subject" maxlength="50"
                           size="30">
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <label for="message" style="color:#000;">Message</label>
                </td>
                <td valign="top">
                    <textarea id="message" name="message" maxlength="10000" cols="25" rows="6"
                              style="margin: 0px 0px 10px; width: 305px; height: 141px;"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">

                    <input class="btn btn-primary"
                           style="height:30px; width:150px; background-color:#da7227; color:#bcbcbc; font-size:20px;position:relative; left:30px; font-variant:all-caps;"
                           type="submit" value="Submit">
                </td>
            </tr>
        </table>
    </g:form>
</fieldset>
%{--=======================================================================================================================================================================--}%

%{--=======================================================================================================================================================================--}%
</body>
</html>
