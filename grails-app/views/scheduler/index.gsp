<!--
 @Created_By : AALAA
 @Date       : 2018.10.27 03:00:47 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->


<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="aalaa">
    <g:set var="entityName" value="${message(code: 'label.scheduler.pageTitle', default: 'Scheduler')}"/>
    <title><g:message code="default.argsButton.index" args="[entityName]"/></title>
</head>

<body>
<div class="content-wrapper">
    <section class="content-header"><!-- Content Header (Page header) -->
        <h1><g:message code="default.argsButton.index" args="[entityName]"/></h1>
    </section><!-- /.content-header -->

    <section class="flash-message">
        <g:render template="../layouts/flashMessage"/>
    </section><!--Flash Message-->

    <section class="content"><!-- Main content -->
        <div class="box box-primary"><!--Table Content-->
            <div class="box-header">
                <legend><h3 class="box-title"><g:message code="default.button.search" default="Search"/></h3></legend>
            </div>

            <div class="box-body">

                <div class='col-xs-12 col-sm-6 col-md-6 col-lg-6'>
                    <div class='form-group'>
                        <label class="required"><g:message code="label.scheduler.name" default="Schedule Name"/></label>
                        <g:select id="scheduleName" name="scheduleName" class="form-control" from="${[
                            "LIST_ACTIVE_THREADS"                 : "List of Active Threads/Schedule",

                            "START_SYSTEM_SYNC_PROCESS"           : "Start - System Sync Process",
                            "START_REFRESH_AUTHENTICATION_PROCESS": "Start - Refresh Authentication Process",
                            "STOP_SYSTEM_SYNC_PROCESS"            : "Stop - System Sync Process",
                            "STOP_REFRESH_AUTHENTICATION_PROCESs" : "Stop - Refresh Authentication Process",
                        ]}" value="${params?.scheduleName}" optionKey="key" optionValue="value" noSelection="['': 'Select One']" required="required"/>
                    </div>
                </div>

            </div>

            <div class="box-footer">
                <g:render template="../template/btn_submit" model="${[btnType: "EXECUTE"]}"/>
            </div>
        </div><!-- /.box box-primary -->

        <div id="div-result" class="box box-info" hidden><!--Table Content-->
            <div class="box-header">
                <legend><h3 class="box-title"><g:message code="default.button.result" default="Result"/></h3></legend>
            </div>

            <div class="box-body">
                <table class="table table-bordered table-striped table-hover table-condensed display th-center th-middle td-middle th-colored">
                    <thead>
                        %{--
                        <tr>
                            <th>SL</th>
                            <th>Thread ID</th>
                            <th>Thread Name</th>
                            <th>STATE</th>
                            <th>PRIORITY</th>
                            <th>GROUP</th>
                        </tr>
                        --}%
                    </thead>
                    <tbody>
                        %{--<tr><td class="bold center" colspan="6"><g:message code="default.message.noRecordFound" default="No Record Found...!"/></td></tr>--}%
                    </tbody>
                </table>
            </div>

        </div><!-- /.box box-primary -->
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<script type="text/javascript">
    /**
     *@options:
     * LIST_ACTIVE_THREADS
     * START_TOE_USER_LOCATION_RESET
     * STOP_TOE_USER_LOCATION_RESET
     * LIST_TRANCHE_ADVICE_FILE
     * START_TRANCHE_ADVICE_SCHEDULE
     * STOP_TRANCHE_ADVICE_SCHEDULE
     *
     **/
    $(document).on("click", "#id_execute_0", function () {
        var scheduleName = $("#scheduleName").val();
        if (scheduleName) {
            var params = {}, url = "${createLink("controller": "scheduler", "action": "takeAction")}";
            params.scheduleName = scheduleName;
            $.ajax({
                type: "POST", async: false, url: url, dataType: 'JSON', data: params, success: function (r) {
                    if (r.STATUS == "OK") {
                         if (scheduleName == "LIST_ACTIVE_THREADS") {
                            $("#div-result").prop("hidden", false);
                            var tHead = "<tr><th>SL</th><th>Thread ID</th><th>Thread Name</th><th>State</th><th>Priority</th><th>Group</th></tr>", tBody = "";
                            if(r.RESULT.length > 0)
                                for (var i = 0; i < r.RESULT.length; i++) {
                                    var v = r.RESULT[i];
                                    tHead += "<tr><td>" + (i + 1) + "</td><td>" + v.ID + "</td><td>" + v.NAME + "</td><td>" + v.STATE.name + "</td><td>" + v.PRIORITY + "</td><td>" + v.GROUP.name + "</td></tr>";
                                }
                                else {
                                    tHead = getNrf(6);
                                }
                            $("#div-result > .box-body thead").html(tHead);
                            $("#div-result > .box-body tbody").html(tHead);
                        }
                        else if (scheduleName == "LIST_TRANCHE_ADVICE_FILE") {
                            $("#div-result").prop("hidden", false);
                            var tHead = "<tr><th>SL</th><th>Name</th><th>Size</th><th>Last Modified</th></tr>", tBody = "";
                            if(r.RESULT.length > 0)
                            for (var i = 0; i < r.RESULT.length; i++) {
                                var v = r.RESULT[i];
                                tBody += "<tr><td>" + (i + 1) + "</td><td>" + v.NAME + "</td><td class='right'>" + v.SIZE + "</td><td class='center'>" + v.LAST_MODIFIED + "</td></tr>";
                            }
                            else {
                                tHead = getNrf(5);
                            }
                            $("#div-result > .box-body thead").html(tHead);
                            $("#div-result > .box-body tbody").html(tBody);
                        }
                        else if (scheduleName == "START_TOE_USER_LOCATION_RESET") {
                            alert("Process started successfully!");
                        }
                        else if (scheduleName == "START_TRANCHE_ADVICE_SCHEDULE") {
                            alert("Process started successfully!");
                        }
                        else {
                            $("#div-result").prop("hidden", true);
                            $("#div-result > .box-body").html(null);
                        }
                    }
                }
            });
        }
        else{
            alert("Please select at least one item from the list.");
        }
    });

    function getNrf(f) {
        return ("<tr><td class='bold center' colspan='" + f + "'><g:message code='default.message.noRecordFound' default='No Record Found...!'/></td></tr>");
    }
</script>
</body>
</html>
