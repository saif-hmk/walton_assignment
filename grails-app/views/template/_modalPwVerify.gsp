<fieldset class="modalPwVerify">
    <div class="col-xs-12 no-padding">
        <!-- Trigger the modal with a button -->
        <button type="button" class="btn btn-bitbucket btn-md" data-toggle="modal" data-target="#modalPwVerify"><i class="fa fa-fw fa-edit"></i> <g:message code="default.button.verifyPassword" default="Verify Your Password"/></button>

        <!-- Modal -->
        <div id="modalPwVerify" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header b-c-info-deep">
                        <h1 class="modal-title c-white">
                            <g:message code="modalPwVerify.modalTitle.label" default="Please Verify Your Password"/>
                        </h1>
                    </div>

                    <div class="modal-body">
                        <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                            <div class='form-group required'>
                                <label class='required'><g:message code="modalPwVerify.password.label" default="Password"/></label>
                                <g:passwordField placeholder="Enter your password" name="pw" class="form-control" required="required"/>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        %{--<button type="button" class="btn btn-success pull-left" data-dismiss="modal">Verify</button>--}%
                        <button type="button" class="btn btn-md btn-danger  pull-left" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-md btn-success pull-right bn" name="ACTION_SUBMITTED" value="${key}" checked>${value} &nbsp; <i class="fa fa-arrow-circle-right"></i></button>&nbsp;
                    </div>
                </div>
            </div>
        </div>
    </div>
</fieldset>