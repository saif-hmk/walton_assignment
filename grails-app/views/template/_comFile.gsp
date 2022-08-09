<!--
 @Created_By : AALAA
 @Date       : 2018.08.01 03:36:32 PM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

%{--Sample--}%
%{--
<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
    <div class="form-group">
        <label>File</label>
        <div class="input-group">
            <span class="input-group-btn"><button class="btn btn-warning" type="button">B1</button></span>
            <input type="text" class="form-control">
            <span class="input-group-btn"><button class="btn btn-danger" type="button"><i class="clear-file fa fa-trash" aria-hidden="true"></i></button></span>
        </div>
    </div>
</div>
--}%

<div class="${mc_file ?: "col-xs-12 col-sm-6 col-md-4 col-lg-3"}">
    <div class="form-group ${bean ? hasErrors(bean: bean, field: "${n_file ?: "file"}", 'has-error') : ""}">
        <label class="${isRequired ? "required" : ""} ${hideLabel ? "hidden" : ""}">${l_file ?: "${message("code": "default.label.file", default: "File")}"}</label>

        <div class="input-group">
            <label class="input-group-btn">
                <span class="btn btn-primary">
                    <i class="fa ${c_fa ?: "fa-folder-open-o"}" aria-hidden="true"></i>
                    ${message(code: "default.button.browse", default: "Browse")}
                    %{--<input type="file" title="imagePath" class="browse" style="display: none;" multiple=""/>--}%
                    %{--<input type="file" title="imagePath" class="browse" style="display: none;"/>--}%
                    <input type="file" name="${n_file ?: "file"}" class="file ${c_file ?: "file-single"}" ib="${ib}" style="display: none;" accept="${accept ?: ""}" ${isRequired ? "required" : ""}/>
                </span>
            </label>
            %{--<g:textField title="imagePath" class="form-control file-title" placeholder="Browse your file" value="${eduStudentPersonalInfo?.imagePath}" readonly="readonly"/>--}%
            <g:textField id="${i_file ?: "file"}" name="${n_file ?: "file"}" class="form-control file-name ${c_file ?: "file-single"}" value="${file ?: params.file}" placeholder="Browse your file" disabled="disabled"/>
            <span class="input-group-btn">
                <button class="btn btn-danger" type="button">
                    <i class="clear-file fa ${c_fa ?: "fa-trash"}" aria-hidden="true"></i>
                </button>
            </span>
        </div>

        <g:renderErrors bean="${bean}" field="${f_field ?: "file"}"/>
    </div>
</div>
