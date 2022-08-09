<!--
 @Created_By : AALAA
 @Date       : 2016.10.14 01:45:44 AM
 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
-->

<link rel="stylesheet" type="text/css" href="${resource(dir: "resources/plugins/cropper", file: "cropper.css")}">
<style type="text/css">

/* Image cropper style */
.img-preview, .sign-preview {
    width: 100%;
    overflow: hidden;
    border: 1px solid #0088ff;
    text-align: center !important;
}

.image-crop, .img-preview-sm {
    height: 256px !important;
    width: 256px !important;
}

.sign-crop, .sign-preview-sm {
    height: 100px !important;
    width: 256px !important;
}
</style>

<div class="box box-info">
    <g:form url="[resource: authUserInstance, action: 'profile']" method="POST" enctype="multipart/form-data">
        <g:hiddenField name="version" value="${authUserInstance?.version}"/>
        <div class="box-header with-border">
            <h3 class="box-title"><g:message code="label.authUser.profileImage" default="Profile Image"/></h3>
            <div class="box-tools pull-right">
                <span class="label label-danger">8 New Members</span>
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
%{--                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>--}%
            </div>
        </div>

        <div class="box-body no-padding">

            %{--
            <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12'>
                <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'image', 'has-error')}'>
                    <label><g:message code="label.authUserProfile.image" default="Image"/></label>
                    <g:textArea title="image" class="form-control" value="${authUserProfileInstance?.image}" rows="2" cols="40" maxlength="255"/>
                    <g:renderErrors bean='${authUserProfileInstance}' field='image'/>
                </div>
            </div>
            --}%

            <div class='col-xs-6 col-sm-6'>
                <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'image', 'has-error')}'>
                    <label><g:message code="user.image.label" default="Image"/></label>

                    <div class="image-crop">
                        %{--                        <img title="image" class="user-image" src="${resource(dir: "resources/images/user", file: "saif_khan.jpg")}" alt="User Image">--}%
                        %{--                        <img title="image" class="user-image" src="${applicationContext.springSecurityService?.currentUser?.image ? resource(dir: "resources/images/user", file: "saif_khan.jpg") : (resource(dir: "resources/images/common", file: "not_found_user.png"))}" alt="User Image">--}%
                        <img name="image" class="user-image" src="${authUserProfileInstance?.image ? resource(dir: "resources/images/user", file: "saif_khan.jpg") : (resource(dir: "resources/images/common", file: "not_found_user.png"))}" alt="User Image">
                    </div>
                    <g:renderErrors bean='authUserProfileInstance' field='image'/>
                </div>
            </div>

            <div class='col-xs-6 col-sm-6'>
                <div class='form-group'>
                    <label><g:message code="label.authUser.imagePreview" default="Preview"/></label>

                    <div class="img-preview img-preview-sm"></div>
                </div>
            </div>
        </div>

        <div class="box-footer no-padding text-center">
            <div class="btn-group">
                <label title="Upload image file" class="btn btn-primary">
                    <input type="file" accept="image/*" name="file" id="inputImage" class="hide">
                    <i class="fa fa-upload" aria-hidden="true"></i>
                    <g:message code="label.authUser.uploadNewImage" default="Upload new image"/>
                </label>
                <button class="btn btn-primary" id="zoomIn" type="button">
                    <i class="fa fa-search-plus" aria-hidden="true"></i>
                    <g:message code="label.authUser.zoomIn" default="Zoom In"/>
                </button>
                <button class="btn btn-primary" id="zoomOut" type="button">
                    <i class="fa fa-search-minus" aria-hidden="true"></i>
                    <g:message code="label.authUser.zoomOut" default="Zoom Out"/>
                </button>
                <button class="btn btn-primary" id="rotateLeft" type="button">
                    <i class="fa fa-rotate-left" aria-hidden="true"></i>
                    <g:message code="label.authUser.rotateLeft" default="Rotate Left"/>
                </button>
                <button class="btn btn-primary" id="rotateRight" type="button">
                    <i class="fa fa-rotate-right" aria-hidden="true"></i>
                    <g:message code="label.authUser.rotateRight" default="Rotate Right"/>
                </button>
            </div>
        </div>

        <div class="box-body with-border no-padding">
            <legend><h3 class="box-title"><g:message code="label.authUser.signature" default="Signature"/></h3></legend>
        </div>

        <div class="box-body no-padding">

            %{--
                <div class='col-xs-12 col-sm-12'>
                    <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'signature', 'has-error')}'>
                        <label><g:message code="user.signature.label" default="Signature Path"/></label>
                        <g:textArea title="signature" class="form-control" value="${authUserProfileInstance?.signature}" rows="2" cols="40" maxlength="2000"/>
                        <g:renderErrors bean='authUserProfileInstance' field='signature'/>
                    </div>
                </div>
            --}%

            <div class='col-xs-6 col-sm-6'>
                <div class='form-group ${hasErrors(bean: authUserProfileInstance, field: 'signature', 'has-error')}'>
                    <label><g:message code="user.signature.label" default="Signature"/></label>
                    <div class="sign-crop">
%{--                        <img title="signature" class="user-image" src="${resource(dir: "resources/images/user", file: "saif_khan.jpg")}" alt="User Image">--}%
%{--                        <img title="signature" class="user-image" src="${applicationContext.springSecurityService?.currentUser?.signature ? resource(dir: "resources/images/user", file: "saif_khan.jpg") : (resource(dir: "resources/images/", file: "user_icon.png"))}" alt="Signature">--}%
                        <img name="signature" class="user-image" src="${authUserProfileInstance?.signature ? resource(dir: "resources/images/common", file: "not_found_signature.png") : (resource(dir: "resources/images/common", file: "not_found_signature.png"))}" alt="Signature">
                    </div>
                    <g:renderErrors bean='authUserProfileInstance' field='signature'/>
                </div>
            </div>

            <div class='col-xs-6 col-sm-6'>
                <div class='form-group'>
                    <label><g:message code="label.authUser.imagePreview" default="Preview"/></label>
                    <div class="sign-preview sign-preview-sm"></div>
                </div>
            </div>

        </div>

        <div class="box-footer text-center">
            <div class="btn-group">
                <label title="Upload image file" class="btn btn-primary">
                    <input type="file" accept="image/*" name="file" id="inputSign" class="hide">
                    <i class="fa fa-upload" aria-hidden="true"></i>
                    <g:message code="label.authUser.uploadNewImage" default="Upload new image"/>
                </label>
                <button class="btn btn-primary" id="zoomIn2" type="button">
                    <i class="fa fa-search-plus" aria-hidden="true"></i>
                    <g:message code="label.authUser.zoomIn" default="Zoom In"/>
                </button>
                <button class="btn btn-primary" id="zoomOut2" type="button">
                    <i class="fa fa-search-minus" aria-hidden="true"></i>
                    <g:message code="label.authUser.zoomOut" default="Zoom Out"/>
                </button>
                <button class="btn btn-primary" id="rotateLeft2" type="button">
                    <i class="fa fa-rotate-left" aria-hidden="true"></i>
                    <g:message code="label.authUser.rotateLeft" default="Rotate Left"/>
                </button>
                <button class="btn btn-primary" id="rotateRight2" type="button">
                    <i class="fa fa-rotate-right" aria-hidden="true"></i>
                    <g:message code="label.authUser.rotateRight" default="Rotate Right"/>
                </button>
            </div>
        </div>

        <div class="box-footer">
            <fieldset class="buttons">
                <sec:access url="/authUser/profile/${authUserInstance?.id}">
                    <button type="submit" class="btn btn-success"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> ${message(code: "default.button.update", default: "Update")}</button>
                </sec:access>
            </fieldset>
        </div>
    </g:form>
</div>

<script type="text/javascript" src="${resource(dir: "resources/plugins/cropper", file: "cropper.js")}"></script>
<script type="text/javascript">
    var $image = $(".image-crop > img");
    $($image).cropper({
//            aspectRatio: 1.618,   //original
//            aspectRatio: 1.50,
        aspectRatio: "auto",
        preview: ".img-preview",
        done: function (data) {
            // Output the result data for cropping image.
            alert("hhhhhh");
            alert(data);
        }
    });

    var $inputImage = $("#inputImage");
    if (window.FileReader) {
        $inputImage.change(function () {
            var fileReader = new FileReader(), files = this.files, file;
            if (!files.length) {
                return;
            }
            file = files[0];

            if (/^image\/\w+$/.test(file.type)) {
                fileReader.readAsDataURL(file);
                fileReader.onload = function () {
                    $inputImage.val("");
                    $image.cropper("reset", true).cropper("replace", this.result);
                };
            } else {
                showMessage("Please choose an image file.");
            }
        });
    } else {
        $inputImage.addClass("hide");
    }

    $("#zoomIn").click(function () {
        $image.cropper("zoom", 0.1);
    });

    $("#zoomOut").click(function () {
        $image.cropper("zoom", -0.1);
    });

    $("#rotateLeft").click(function () {
        $image.cropper("rotate", 90);
    });

    $("#rotateRight").click(function () {
        $image.cropper("rotate", -90);
    });

    var $sign = $(".sign-crop > img")
    $($sign).cropper({
//            aspectRatio: 1.618,   //original
//            aspectRatio: 1.50,
        aspectRatio: "auto",
        preview: ".sign-preview",
        done: function (data) {
            // Output the result data for cropping image.
        }
    });

    var $inputSign = $("#inputSign");
    if (window.FileReader) {
        $inputSign.change(function () {
            var fileReader = new FileReader(),
                files = this.files,
                file;

            if (!files.length) {
                return;
            }
            file = files[0];

            if (/^image\/\w+$/.test(file.type)) {
                fileReader.readAsDataURL(file);
                fileReader.onload = function () {
                    $inputSign.val("");
                    $sign.cropper("reset", true).cropper("replace", this.result);
                };
            } else {
                showMessage("Please choose an image file.");
            }
        });
    } else {
        $inputSign.addClass("hide");
    }

    $("#zoomIn2").click(function () {
        $sign.cropper("zoom", 0.1);
    });

    $("#zoomOut2").click(function () {
        $sign.cropper("zoom", -0.1);
    });

    $("#rotateLeft2").click(function () {
        $sign.cropper("rotate", 90);
    });

    $("#rotateRight2").click(function () {
        $sign.cropper("rotate", -90);
    });
</script>
