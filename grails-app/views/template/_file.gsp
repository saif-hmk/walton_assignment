<div class="${mc_file ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class='form-group'>
        <label><g:message code="fileService.file.label" default="File"/></label>
        <g:select id="${i_file ?: "file_0"}" name="${np_file ?: ""}file" class="form-control ${c_file ?: "file "}" from="${fileList}" value="${file ?: params.file}" optionKey="path" optionValue="name" noSelection="['': 'Select One']"/>
    </div>
</div>