<div class="${mc_file ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label class="required"><g:message code="fileService.file.label" default="File"/></label>
        <g:select id="${i_file ?: "fileName_0"}" name="${np_file ?: ""}fileName" class="form-control ${c_file ?: "fileName "}" from="${fileList}" value="${fileName ?: params.fileName}" optionKey="name" optionValue="name" noSelection="['': 'Select One']" required="required"/>
    </div>
</div>