%{--
@Created_By : AALAA
@Date       : "2016.09.27 01:00:55 AM"
@Author     : Md. Hoshen Mahmud Khan
@Email      : saif_hmk@live.com
@Phone      : +8801672036757
--}%

<g:if test="${btnType && btnType != "" && btnType.equals("RESET")}">
    <button type="reset" id="${id ?: "reset_0"}" class="btn btn-warning ${c_btnSubmit ?: "pull-right"}"
            onclick="return confirm('${message(code: "default.message.confirmValueReset", default: "Sure, you want to reset all value...?")}');">
        <i class="fa fa-refresh"></i>
        ${message(code: "default.button.reset", default: "Reset")}
    </button>
</g:if>
<g:if test="${btnType && btnType != "" && btnType.equals("RESET_PASSWORD")}">
    <button type="submit" id="${id ?: "reset_0"}" class="btn btn-warning ${c_btnSubmit ?: "pull-right"}">
        <i class="fa fa-refresh"></i>
        ${message(code: "default.button.reset", default: "Reset")}
    </button>
</g:if>
<g:elseif test="${btnType && btnType != "" && btnType.equals("CREATE")}">
    <button type="submit" id="${id ?: "create_0"}" class="btn btn-primary ${c_btnSubmit ?: "pull-left"}">
        <i class="fa fa-save"></i>
        ${message(code: "${msg_code ?: "default.button.create"}", default: "Create")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("SAVE")}">
    <button type="submit" id="${id ?: "save_0"}" class="btn btn-primary ${c_btnSubmit ?: "pull-left"}">
        <i class="fa fa-save"></i>
        ${message(code: "${msg_code ?: "default.button.save"}", default: "Save")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("SEARCH")}">
    <button type="submit" id="${id ?: "search_0"}" ${name ? name = "${name}" : ""} ${value ? value = "${value}" : ""} class="btn btn-info ${c_btnSubmit ?: "pull-right"}">
        <i class="fa fa-search"></i>
        ${message(code: "${msg_code ?: "default.button.search"}", default: "Search")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("SHOW")}">
    <button type="submit" id="${id ?: "show_0"}" class="btn btn-primary ${c_btnSubmit ?: "pull-left"}">
        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
        ${message(code: "${msg_code ?: "default.button.show"}", default: "Show")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("VIEW")}">
    <button type="submit" id="${id ?: "view_0"}" class="btn btn-primary ${c_btnSubmit ?: "pull-left"}">
        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
        ${message(code: "${msg_code ?: "default.button.view"}", default: "View")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("UPDATE")}">
    <button type="submit" id="${id ?: "update_0"}" class="btn btn-primary ${c_btnSubmit ?: "pull-left"}">
        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
        ${message(code: "${msg_code ?: "default.button.update"}", default: "Update")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("UPLOAD")}">
    <button type="submit" id="${id ?: "upload_0"}" class="btn btn-primary ${c_btnSubmit ?: "pull-left"}">
        <i class="fa fa-upload"></i>
        ${message(code: "${msg_code ?: "default.button.upload"}", default: "Upload")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("PRINT")}">
    <button type="submit" id="${id ?: "print_0"}" class="btn btn-info ${c_btnSubmit ?: "pull-right"}">
        <i class="fa fa-print"></i>
        ${message(code: "${msg_code ?: "default.button.print"}", default: "Print")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("DOWNLOAD")}">
    <button type="submit" id="${id ?: "download_0"}" class="btn btn-primary ${c_btnSubmit ?: "pull-left"}">
        <i class="fa fa-download"></i>
        ${message(code: "${msg_code ?: "default.button.download"}", default: "Download")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.contains("VIEW_PDF")}">
    <button type="submit" id="${id ?: "view_pdf_0"}" class="btn btn-success">
        <i class="fa fa-file-pdf-o" aria-hidden="true"></i>
        ${message(code: "${msg_code ?: "default.button.viewPdf.label"}", default: "View PDF")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("APPROVE")}">
    <button type="submit" id="${id ?: "btnApprove_0"}" class="btn btn-success ${c_btnSubmit ?: "pull-left"}" onclick="return confirm('${message(code: "default.message.confirmApproval", default: "Sure, you want to approve...?")}');">
        <i class="fa fa-check"></i>
        ${message(code: "${msg_code ?: "default.button.approve"}", default: "Approve")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("PROCESS")}">
    <button type="submit" id="${id ?: "paymentProcess_0"}" class="btn btn-success ${c_btnSubmit ?: "pull-left"}" onclick="return confirm('${message(code: "default.message.confirmProcess", default: "Sure, you want to start the process...?")}');">
        <i class="fa fa-cogs"></i>
        ${message(code: "${msg_code ?: "default.button.process.label"}", default: "Process")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("ROLLBACK")}">
    <button type="submit" id="${id ?: "paymentRollBack_0"}" class="btn btn-danger ${c_btnSubmit ?: "pull-left"}" onclick="return confirm('${message(code: "default.message.confirmRollback", default: "Sure, you want to execute rollback process...?")}');">
        <i class="fa fa-trash-o"></i>
        ${message(code: "${msg_code ?: "default.button.rollBack.label"}", default: "Rollback")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("LOGIN")}">
    <button type="submit" id="${id ?: "login_0"}" class="btn btn-success ${c_btnSubmit ?: "pull-left"}">
        <i class="fa fa-power-off"></i>
        ${message(code: "${msg_code ?: "default.button.login"}", default: "Login")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.contains("I_AGREE")}">
    <button type="submit" id="${id ?: "id_i_agree_0"}" ${name ? name = "${name}" : ""} ${value ? value = "${value}" : ""} class="btn btn-success">
        <i class="fa fa-check-circle"></i>
        ${message(code: "${msg_code ?: "default.button.iAgree.label"}", default: "I Agree")}
    </button>
</g:elseif>
<g:elseif test="${btnType && btnType != "" && btnType.equals("CANCEL_MR")}">
    <button type="submit" id="${id ?: "cancel_0"}" class="btn btn-danger ${c_btnSubmit ?: "pull-right"}" onclick="return confirm('${message(code: "default.message.confirmCancelMr", default: "Sure, you want to cancel this MR...?")}');">
        <i class="fa fa-trash-o"></i>
        ${message(code: "default.button.cancelMr", default: "Cancel MR")}
    </button>
</g:elseif>
<g:else>%{--test="${btnType && btnType != "" && btnType.equals("SUBMIT")}">--}%
    <button type="submit" id="${id ?: "submit_0"}" class="btn btn-primary ${c_btnSubmit ?: "pull-left"}" validationMessage="${validationMessage ?: ""}">
        <i class="fa fa-save"></i>
        ${message(code: "${msg_code ?: "default.button.submit"}", default: "Submit")}
    </button>
</g:else>
