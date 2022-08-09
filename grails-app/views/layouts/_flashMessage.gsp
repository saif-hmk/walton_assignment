<!-- flash message -->
<g:if test="${flash.success || flash.message || flash.warning || flash.error || flash.exception}">

    <style type="text/css">
    .flash-message {
        margin-bottom: 25px;
    }
    .flash-message .messageBody {
        margin-left: 15px;
        margin-top: 10px;
        margin-right: 15px;
        margin-bottom: -32px;
    }
    </style>

    <div class="messageBody">
        <g:if test="${flash.success}">
            <div class="alert alert-success alert-dismissable success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-check"></i>
                ${flash.success}
            </div>
        </g:if>
        <g:if test="${flash.message}">
            <div class="alert alert-info alert-dismissable message">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-info"></i>
                ${flash.message}
            </div>
        </g:if>
        <g:if test="${flash.warning}">
            <div class="alert alert-warning alert-dismissable warning">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-remove"></i>
                ${flash.warning}
            </div>
        </g:if>
        %{--
        <g:if test="${flash.error}">
            <div class="alert alert-danger alert-dismissable error">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-remove"></i>
                ${flash.error}
            </div>
        </g:if>
        --}%
        <g:if test="${flash.exception}">
            <div class="alert alert-danger alert-dismissable exception">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-remove"></i>
                ${flash.exception}
            </div>
        </g:if>
        <g:hasErrors>
            <div class="alert alert-danger alert-dismissable error">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <i class="icon fa fa-remove"></i>
                ${flash.error ?: "Error : "}
                <g:renderErrors as="list"/>
                %{--<ul><g:eachError><li><g:message error="${it}"/></li></g:eachError></ul>--}%
            </div>
        </g:hasErrors>
    </div>
    <script type="text/javascript">
        setTimeout(function () {
            $('.success').fadeTo(5000, 0).slideUp();
        }, 15000);
        setTimeout(function () {
            $('.message').fadeTo(5000, 0).slideUp();
        }, 60000);
        setTimeout(function () {
            $('.warning').fadeTo(5000, 0).slideUp();
        }, 30000);
        setTimeout(function () {
            $('.error').fadeTo(5000, 0).slideUp();
        }, 120000);
        setTimeout(function () {
            $('.exception').fadeTo(5000, 0).slideUp();
        }, 120000);

        /*$(document).ready(function () {
            window.setTimeout(function () {
                $(".alert").fadeTo(6000, 0).slideUp(1000, function () {
                    $(this).remove();
                });
            }, 1000);

        });*/
    </script>
</g:if>
<!-- flash message end -->