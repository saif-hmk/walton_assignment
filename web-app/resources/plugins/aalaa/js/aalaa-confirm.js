/**
 * @Created_By  : AALAA
 * @Date        : 2016.06.16 12:10:17 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Confirm.js
 * @Dependencies: Jquery.js, AALAA.js, confirm.js
 * @LastModified: 18.05.04
 * @version     : 2.0
 **/
/*==================================================================================================================================================*/

$('.confirm-delete').confirm({
//----------------------------------------------------------------------------------------------------------------------------
//      Title & Content
//----------------------------------------------------------------------------------------------------------------------------
//        title: 'Are you sure ? You want to delete !',
//        content: 'You want to delete !',
//----------------------------------------------------------------------------------------------------------------------------
//      Button text
//----------------------------------------------------------------------------------------------------------------------------
    confirmButton: 'Yes I Agree',
    cancelButton: 'No, Never.',
//----------------------------------------------------------------------------------------------------------------------------
//      Button style
//----------------------------------------------------------------------------------------------------------------------------
//      Available bootstrap options are : btn-primary btn-inverse btn-warning btn-info btn-danger btn-success
    confirmButtonClass: 'btn-danger',
    cancelButtonClass: 'btn-success',
//----------------------------------------------------------------------------------------------------------------------------
//      Hide elements
//----------------------------------------------------------------------------------------------------------------------------
//        title: false, // hides the title.
//        cancelButton: false, // hides the cancel button.
//        confirmButton: false, // hides the confirm button.
//        closeIcon: false, // hides the close icon.
    content: false, // hides content block.
//----------------------------------------------------------------------------------------------------------------------------
//      Custom width
//----------------------------------------------------------------------------------------------------------------------------
//      You can also set responsive layouts.
//        columnClass: 'col-md-4',
        columnClass: 'col-md-4 col-md-offset-4', //(default)
//        columnClass: 'col-md-4 col-md-offset-8 col-xs-4 col-xs-offset-8',
//----------------------------------------------------------------------------------------------------------------------------
//      Icons
//----------------------------------------------------------------------------------------------------------------------------
//        icon: 'glyphicon glyphicon-heart',
    icon: 'fa fa-trash fa-lg c-danger',
    title: 'Sure? You want to delete...!',
//----------------------------------------------------------------------------------------------------------------------------
//      Close icon
//----------------------------------------------------------------------------------------------------------------------------
    closeIcon: true,
    closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
//----------------------------------------------------------------------------------------------------------------------------
//      Animations
//----------------------------------------------------------------------------------------------------------------------------
//      Available animations: Different animations can be set for open and close events. 
//      2D : right, left, bottom, top, rotate, none, opacity,
//      3D : scale (default), zoom, scaleY, scaleX, rotateY, rotateYR (reverse), rotateX, rotateXR (reverse)
    animation: 'rotateYR',
    closeAnimation: 'rotateXR',
//----------------------------------------------------------------------------------------------------------------------------
//      Animation bounce
//----------------------------------------------------------------------------------------------------------------------------
    animationBounce: 1.5, // default is 1.2 whereas 1 is no bounce.
//----------------------------------------------------------------------------------------------------------------------------
//      Animation speed
//----------------------------------------------------------------------------------------------------------------------------
    animationSpeed: 500, // 1 seconds
//----------------------------------------------------------------------------------------------------------------------------
//      Themes
//----------------------------------------------------------------------------------------------------------------------------
//         theme: 'white',
         theme: 'black',
//         theme: 'supervan'  //transparent
//         theme: 'material',
//         theme: 'bootstrap'
//----------------------------------------------------------------------------------------------------------------------------
//      Auto close
//----------------------------------------------------------------------------------------------------------------------------
    autoClose: 'cancel|11000',
//        autoClose: 'confirm|10000',
//----------------------------------------------------------------------------------------------------------------------------
//      Keyboard actions
//----------------------------------------------------------------------------------------------------------------------------
//      ENTER calls confirm(); & ESC calls cancel();
    keyboardEnabled: true,
//----------------------------------------------------------------------------------------------------------------------------
//      Setting custom keys
//----------------------------------------------------------------------------------------------------------------------------
//      A = 65; B = 66
//        confirmKeys: [65],
//        cancelKeys: [66],
//----------------------------------------------------------------------------------------------------------------------------
//      RTL support
//----------------------------------------------------------------------------------------------------------------------------
//      If you need to show the confirm box in rtl then you should set the rtl option to true. 
    rtl: false
//----------------------------------------------------------------------------------------------------------------------------
});

$('.confirm-rollback').confirm({
//----------------------------------------------------------------------------------------------------------------------------
//      Title & Content
//----------------------------------------------------------------------------------------------------------------------------
//        title: 'Are you sure ? You want to delete !',
//        content: 'You want to delete !',
//----------------------------------------------------------------------------------------------------------------------------
//      Button text
//----------------------------------------------------------------------------------------------------------------------------
    confirmButton: 'Yes I Agree',
    cancelButton: 'No, Never.',
//----------------------------------------------------------------------------------------------------------------------------
//      Button style
//----------------------------------------------------------------------------------------------------------------------------
//      Available bootstrap options are : btn-primary btn-inverse btn-warning btn-info btn-danger btn-success
    confirmButtonClass: 'btn-danger',
    cancelButtonClass: 'btn-success',
//----------------------------------------------------------------------------------------------------------------------------
//      Hide elements
//----------------------------------------------------------------------------------------------------------------------------
//        title: false, // hides the title.
//        cancelButton: false, // hides the cancel button.
//        confirmButton: false, // hides the confirm button.
//        closeIcon: false, // hides the close icon.
    content: false, // hides content block.
//----------------------------------------------------------------------------------------------------------------------------
//      Custom width
//----------------------------------------------------------------------------------------------------------------------------
//      You can also set responsive layouts.
//        columnClass: 'col-md-4',
        columnClass: 'col-md-4 col-md-offset-4', //(default)
//        columnClass: 'col-md-4 col-md-offset-8 col-xs-4 col-xs-offset-8',
//----------------------------------------------------------------------------------------------------------------------------
//      Icons
//----------------------------------------------------------------------------------------------------------------------------
//        icon: 'glyphicon glyphicon-heart',
    icon: 'fa fa-trash fa-lg c-danger',
    title: 'Sure? You want to rollback...!',
//----------------------------------------------------------------------------------------------------------------------------
//      Close icon
//----------------------------------------------------------------------------------------------------------------------------
    closeIcon: true,
    closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
//----------------------------------------------------------------------------------------------------------------------------
//      Animations
//----------------------------------------------------------------------------------------------------------------------------
//      Available animations: Different animations can be set for open and close events.
//      2D : right, left, bottom, top, rotate, none, opacity,
//      3D : scale (default), zoom, scaleY, scaleX, rotateY, rotateYR (reverse), rotateX, rotateXR (reverse)
    animation: 'rotateYR',
    closeAnimation: 'rotateXR',
//----------------------------------------------------------------------------------------------------------------------------
//      Animation bounce
//----------------------------------------------------------------------------------------------------------------------------
    animationBounce: 1.5, // default is 1.2 whereas 1 is no bounce.
//----------------------------------------------------------------------------------------------------------------------------
//      Animation speed
//----------------------------------------------------------------------------------------------------------------------------
    animationSpeed: 500, // 1 seconds
//----------------------------------------------------------------------------------------------------------------------------
//      Themes
//----------------------------------------------------------------------------------------------------------------------------
//         theme: 'white',
         theme: 'black',
//         theme: 'supervan'  //transparent
//         theme: 'material',
//         theme: 'bootstrap'
//----------------------------------------------------------------------------------------------------------------------------
//      Auto close
//----------------------------------------------------------------------------------------------------------------------------
    autoClose: 'cancel|11000',
//        autoClose: 'confirm|10000',
//----------------------------------------------------------------------------------------------------------------------------
//      Keyboard actions
//----------------------------------------------------------------------------------------------------------------------------
//      ENTER calls confirm(); & ESC calls cancel();
    keyboardEnabled: true,
//----------------------------------------------------------------------------------------------------------------------------
//      Setting custom keys
//----------------------------------------------------------------------------------------------------------------------------
//      A = 65; B = 66
//        confirmKeys: [65],
//        cancelKeys: [66],
//----------------------------------------------------------------------------------------------------------------------------
//      RTL support
//----------------------------------------------------------------------------------------------------------------------------
//      If you need to show the confirm box in rtl then you should set the rtl option to true.
    rtl: false
//----------------------------------------------------------------------------------------------------------------------------
});

$('.confirm-to-proceed').confirm({
//----------------------------------------------------------------------------------------------------------------------------
//      Title & Content
//----------------------------------------------------------------------------------------------------------------------------
//        title: 'Are you sure ? You want to delete !',
//        content: 'You want to delete !',
//----------------------------------------------------------------------------------------------------------------------------
//      Button text
//----------------------------------------------------------------------------------------------------------------------------
    confirmButton: 'Yes I Agree',
    cancelButton: 'No, Not Yet.',
//----------------------------------------------------------------------------------------------------------------------------
//      Button style
//----------------------------------------------------------------------------------------------------------------------------
//      Available bootstrap options are : btn-primary btn-inverse btn-warning btn-info btn-danger btn-success
    confirmButtonClass: 'btn-success',
    cancelButtonClass: 'btn-warning',
//----------------------------------------------------------------------------------------------------------------------------
//      Hide elements
//----------------------------------------------------------------------------------------------------------------------------
//        title: false, // hides the title.
//        cancelButton: false, // hides the cancel button.
//        confirmButton: false, // hides the confirm button.
//        closeIcon: false, // hides the close icon.
    content: false, // hides content block.
//----------------------------------------------------------------------------------------------------------------------------
//      Custom width
//----------------------------------------------------------------------------------------------------------------------------
//      You can also set responsive layouts.
//        columnClass: 'col-md-4',
        columnClass: 'col-md-4 col-md-offset-4', //(default)
//        columnClass: 'col-md-4 col-md-offset-8 col-xs-4 col-xs-offset-8',
//----------------------------------------------------------------------------------------------------------------------------
//      Icons
//----------------------------------------------------------------------------------------------------------------------------
//        icon: 'glyphicon glyphicon-heart',
    icon: 'fa fa-check-circle-o fa-lg c-success',
    title: 'Sure, You want to proceed...?',
//----------------------------------------------------------------------------------------------------------------------------
//      Close icon
//----------------------------------------------------------------------------------------------------------------------------
    closeIcon: true,
    closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
//----------------------------------------------------------------------------------------------------------------------------
//      Animations
//----------------------------------------------------------------------------------------------------------------------------
//      Available animations: Different animations can be set for open and close events.
//      2D : right, left, bottom, top, rotate, none, opacity,
//      3D : scale (default), zoom, scaleY, scaleX, rotateY, rotateYR (reverse), rotateX, rotateXR (reverse)
    animation: 'rotateYR',
    closeAnimation: 'rotateXR',
//----------------------------------------------------------------------------------------------------------------------------
//      Animation bounce
//----------------------------------------------------------------------------------------------------------------------------
    animationBounce: 1.5, // default is 1.2 whereas 1 is no bounce.
//----------------------------------------------------------------------------------------------------------------------------
//      Animation speed
//----------------------------------------------------------------------------------------------------------------------------
    animationSpeed: 500, // 1 seconds
//----------------------------------------------------------------------------------------------------------------------------
//      Themes
//----------------------------------------------------------------------------------------------------------------------------
//         theme: 'white',
         theme: 'black',
//         theme: 'supervan'  //transparent
//         theme: 'material',
//         theme: 'bootstrap'
//----------------------------------------------------------------------------------------------------------------------------
//      Auto close
//----------------------------------------------------------------------------------------------------------------------------
    autoClose: 'cancel|10000',
       // autoClose: 'confirm|10000',
//----------------------------------------------------------------------------------------------------------------------------
//      Keyboard actions
//----------------------------------------------------------------------------------------------------------------------------
//      ENTER calls confirm(); & ESC calls cancel();
    keyboardEnabled: true,
//----------------------------------------------------------------------------------------------------------------------------
//      Setting custom keys
//----------------------------------------------------------------------------------------------------------------------------
//      A = 65; B = 66
//        confirmKeys: [65],
//        cancelKeys: [66],
//----------------------------------------------------------------------------------------------------------------------------
//      RTL support
//----------------------------------------------------------------------------------------------------------------------------
//      If you need to show the confirm box in rtl then you should set the rtl option to true.
    rtl: false
//----------------------------------------------------------------------------------------------------------------------------
});

$('.confirm-to-process').confirm({
//----------------------------------------------------------------------------------------------------------------------------
//      Title & Content
//----------------------------------------------------------------------------------------------------------------------------
//        title: 'Are you sure ? You want to delete !',
//        content: 'You want to delete !',
//----------------------------------------------------------------------------------------------------------------------------
//      Button text
//----------------------------------------------------------------------------------------------------------------------------
    confirmButton: 'Yes I Agree',
    cancelButton: 'No, Not Yet.',
//----------------------------------------------------------------------------------------------------------------------------
//      Button style
//----------------------------------------------------------------------------------------------------------------------------
//      Available bootstrap options are : btn-primary btn-inverse btn-warning btn-info btn-danger btn-success
    confirmButtonClass: 'btn-success',
    cancelButtonClass: 'btn-warning',
//----------------------------------------------------------------------------------------------------------------------------
//      Hide elements
//----------------------------------------------------------------------------------------------------------------------------
//        title: false, // hides the title.
//        cancelButton: false, // hides the cancel button.
//        confirmButton: false, // hides the confirm button.
//        closeIcon: false, // hides the close icon.
    content: false, // hides content block.
//----------------------------------------------------------------------------------------------------------------------------
//      Custom width
//----------------------------------------------------------------------------------------------------------------------------
//      You can also set responsive layouts.
//        columnClass: 'col-md-4',
        columnClass: 'col-md-4 col-md-offset-4', //(default)
//        columnClass: 'col-md-4 col-md-offset-8 col-xs-4 col-xs-offset-8',
//----------------------------------------------------------------------------------------------------------------------------
//      Icons
//----------------------------------------------------------------------------------------------------------------------------
//        icon: 'glyphicon glyphicon-heart',
    icon: 'fa fa-check-circle-o fa-lg c-success',
    title: 'Sure? You want to process...!',
//----------------------------------------------------------------------------------------------------------------------------
//      Close icon
//----------------------------------------------------------------------------------------------------------------------------
    closeIcon: true,
    closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
//----------------------------------------------------------------------------------------------------------------------------
//      Animations
//----------------------------------------------------------------------------------------------------------------------------
//      Available animations: Different animations can be set for open and close events.
//      2D : right, left, bottom, top, rotate, none, opacity,
//      3D : scale (default), zoom, scaleY, scaleX, rotateY, rotateYR (reverse), rotateX, rotateXR (reverse)
    animation: 'rotateYR',
    closeAnimation: 'rotateXR',
//----------------------------------------------------------------------------------------------------------------------------
//      Animation bounce
//----------------------------------------------------------------------------------------------------------------------------
    animationBounce: 1.5, // default is 1.2 whereas 1 is no bounce.
//----------------------------------------------------------------------------------------------------------------------------
//      Animation speed
//----------------------------------------------------------------------------------------------------------------------------
    animationSpeed: 500, // 1 seconds
//----------------------------------------------------------------------------------------------------------------------------
//      Themes
//----------------------------------------------------------------------------------------------------------------------------
//         theme: 'white',
         theme: 'black',
//         theme: 'supervan'  //transparent
//         theme: 'material',
//         theme: 'bootstrap'
//----------------------------------------------------------------------------------------------------------------------------
//      Auto close
//----------------------------------------------------------------------------------------------------------------------------
    autoClose: 'cancel|11000',
//        autoClose: 'confirm|10000',
//----------------------------------------------------------------------------------------------------------------------------
//      Keyboard actions
//----------------------------------------------------------------------------------------------------------------------------
//      ENTER calls confirm(); & ESC calls cancel();
    keyboardEnabled: true,
//----------------------------------------------------------------------------------------------------------------------------
//      Setting custom keys
//----------------------------------------------------------------------------------------------------------------------------
//      A = 65; B = 66
//        confirmKeys: [65],
//        cancelKeys: [66],
//----------------------------------------------------------------------------------------------------------------------------
//      RTL support
//----------------------------------------------------------------------------------------------------------------------------
//      If you need to show the confirm box in rtl then you should set the rtl option to true.
    rtl: false
//----------------------------------------------------------------------------------------------------------------------------
});

$('.confirm-reset').confirm({
//----------------------------------------------------------------------------------------------------------------------------
//      Title & Content
//----------------------------------------------------------------------------------------------------------------------------
//        title: 'Are you sure ? You want to Reset all value !',
//        title: 'Are you sure !',
//        content: 'You want to reset all value !',
//----------------------------------------------------------------------------------------------------------------------------
//      Button text
//----------------------------------------------------------------------------------------------------------------------------
    confirmButton: 'Yes',
    cancelButton: 'No',
//----------------------------------------------------------------------------------------------------------------------------
//      Button style
//----------------------------------------------------------------------------------------------------------------------------
//      Available bootstrap options are : btn-primary btn-inverse btn-warning btn-info btn-danger btn-success
    confirmButtonClass: 'btn-warning',
    cancelButtonClass: 'btn-success',
//----------------------------------------------------------------------------------------------------------------------------
//      Hide elements
//----------------------------------------------------------------------------------------------------------------------------
//        title: false, // hides the title.
//        cancelButton: false, // hides the cancel button.
//        confirmButton: false, // hides the confirm button.
//        closeIcon: false, // hides the close icon.
    content: false, // hides content block.
//----------------------------------------------------------------------------------------------------------------------------
//      Custom width
//----------------------------------------------------------------------------------------------------------------------------
//      You can also set responsive layouts.
//        columnClass: 'col-md-4',
        columnClass: 'col-md-4 col-md-offset-4', //(default)
//        columnClass: 'col-md-4 col-md-offset-8 col-xs-4 col-xs-offset-8',
//----------------------------------------------------------------------------------------------------------------------------
//      Icons
//----------------------------------------------------------------------------------------------------------------------------
//        icon: 'glyphicon glyphicon-heart',
    icon: 'fa fa-refresh fa-lg c-warning',
    title: 'Sure ? You want to reset !',
//----------------------------------------------------------------------------------------------------------------------------
//      Close icon
//----------------------------------------------------------------------------------------------------------------------------
    closeIcon: true,
    closeIconClass: 'fa fa-close', // or 'glyphicon glyphicon-remove'
//----------------------------------------------------------------------------------------------------------------------------
//      Animations
//----------------------------------------------------------------------------------------------------------------------------
//      Available animations: Different animations can be set for open and close events. 
//      2D : right, left, bottom, top, rotate, none, opacity,
//      3D : scale (default), zoom, scaleY, scaleX, rotateY, rotateYR (reverse), rotateX, rotateXR (reverse)
    animation: 'rotateYR',
    closeAnimation: 'rotateXR',
//----------------------------------------------------------------------------------------------------------------------------
//      Animation bounce
//----------------------------------------------------------------------------------------------------------------------------
    animationBounce: 1.5, // default is 1.2 whereas 1 is no bounce.
//----------------------------------------------------------------------------------------------------------------------------
//      Animation speed
//----------------------------------------------------------------------------------------------------------------------------
    animationSpeed: 500, // 1 seconds
//----------------------------------------------------------------------------------------------------------------------------
//      Themes
//----------------------------------------------------------------------------------------------------------------------------
    theme: 'white',
//         theme: 'black',
//         theme: 'supervan'  //transparent
//         theme: 'material',
//         theme: 'bootstrap'
//----------------------------------------------------------------------------------------------------------------------------
//      Auto close
//----------------------------------------------------------------------------------------------------------------------------
    autoClose: 'cancel|9000',
//        autoClose: 'confirm|10000',
//----------------------------------------------------------------------------------------------------------------------------
//      Keyboard actions
//----------------------------------------------------------------------------------------------------------------------------
//      ENTER calls confirm(); & ESC calls cancel();
    keyboardEnabled: true,
//----------------------------------------------------------------------------------------------------------------------------
//      Setting custom keys
//----------------------------------------------------------------------------------------------------------------------------
//      A = 65; B = 66
//        confirmKeys: [65],
//        cancelKeys: [66],
//----------------------------------------------------------------------------------------------------------------------------
//      RTL support
//----------------------------------------------------------------------------------------------------------------------------
//      If you need to show the confirm box in rtl then you should set the rtl option to true. 
    rtl: false
//----------------------------------------------------------------------------------------------------------------------------
});

function aalaaConfirm(confirmButton, cancelButton, title) {
    var alertContent = {
        confirmButton      : confirmButton ? confirmButton : 'Yes I Agree',
        cancelButton       : cancelButton ? cancelButton : 'No, Not Yet.',
        confirmButtonClass : 'btn-success',
        cancelButtonClass  : 'btn-warning',
        content            : false,
        columnClass        : 'col-md-4 col-md-offset-4',
        icon               : 'fa fa-check-circle-o fa-lg c-success',
        title              : title ? title : 'Sure? You want to process...!',
        closeIcon          : true,
        closeIconClass     : 'fa fa-close',
        animation          : 'rotateYR',
        closeAnimation     : 'rotateXR',
        animationBounce    : 1.5,
        animationSpeed     : 500,
        theme              : 'black',
        autoClose          : 'cancel|11000',
        keyboardEnabled    : true,
        rtl                : false
    };
    var response = $.confirm(alertContent);
    alert(response);
    return response;
}

function confirmDelete() {
    var alertContent = {
        animation          : 'rotateYR',
        animationBounce    : 1.5, // default is 1.2 whereas 1 is no bounce.
        animationSpeed     : 500, // 1 seconds
        autoClose          : 'cancel|9000',
        cancelButton       : 'No, Never.',
        cancelButtonClass  : 'btn-success',
        closeAnimation     : 'rotateXR',
        closeIcon          : true,
        closeIconClass     : 'fa fa-close', // or 'glyphicon glyphicon-remove'
        columnClass        : 'col-md-4 col-md-offset-4', //(default)
        confirmButton      : 'Yes I Agree',
        confirmButtonClass : 'btn-danger',
        content            : false, // hides content block.
        icon               : 'fa fa-trash fa-lg c-danger',
        keyboardEnabled    : true,
        rtl                : false,
        theme              : 'black',
        title              : 'Sure? You want to delete...!',
        // confirm            : function () {return "true"},
        // cancel             : function () {return "false"},
        // onAction           : function () {alert("xxx")}
    };

    return $.confirm(alertContent);
}

function aalaaAlert(params) {
    if (params.type && params.content) {
        var alertContent = {
            rtl             : false,
            autoClose       : false,
            cancelButton    : false,
            confirmButton   : false,
            keyboardEnabled : true,
            closeIcon       : true,
            animationBounce : 1.5,
            animationSpeed  : 500,
            animation       : 'rotateYR',
            closeAnimation  : 'rotateXR',
            closeIconClass  : 'glyphicon glyphicon-remove', //'fa fa-close', // or 'glyphicon glyphicon-remove'
            columnClass     : 'col-md-4 col-md-offset-4',
            theme           : 'material',
            title           : 'Attention...!',
            content         : params.content,
            onClose         : params.onClose? params.onClose: null
        };
        if (params.type.toUpperCase() == "MESSAGE") {
            $.extend(alertContent, {
                icon  : 'fa fa-lg fa-commenting c-info',
                title : params.title ? params.title : 'Message : '
            });
        }
        else if (params.type.toUpperCase() == "SUCCESS") {
            $.extend(alertContent, {
                icon  : 'fa fa-lg fa-check-circle c-success',
                title : params.title ? params.title : 'Congratulation...!'
            });
        }
        else if (params.type.toUpperCase() == "WARNING") {
            $.extend(alertContent, {
                icon  : 'fa fa-lg fa-exclamation-triangle c-warning',
                title : params.title ? params.title : 'Warning...!'
            });
        }
        else if (params.type.toUpperCase() == "ERROR") {
            $.extend(alertContent, {
                icon  : 'fa fa-lg fa-exclamation-circle c-danger',
                title : params.title ? params.title : 'An Error Occurred...!'
            });
        }
        $.confirm(alertContent);
    }else{
        alert("EX-AALAAAlert : Please, provide appropriate content.");
    }
}

function aalaaAlertAutoClose(params) {
    if (params.type && params.content) {
        var alertContent = {
            rtl             : false,
            autoClose       : '2000',
            cancelButton    : false,
            confirmButton   : false,
            keyboardEnabled : true,
            closeIcon       : true,
            animationBounce : 1.5,
            animationSpeed  : 500,
            animation       : 'rotateYR',
            closeAnimation  : 'rotateXR',
            closeIconClass  : 'glyphicon glyphicon-remove', //'fa fa-close', // or 'glyphicon glyphicon-remove'
            columnClass     : 'col-md-4 col-md-offset-4',
            theme           : 'material',
            title           : 'Attention...!',
            content         : params.content,
            onClose         : params.onClose? params.onClose: null
        };
        if (params.type.toUpperCase() == "MESSAGE") {
            $.extend(alertContent, {
                icon  : 'fa fa-lg fa-commenting c-info',
                title : params.title ? params.title : 'Message : '
            });
        }
        else if (params.type.toUpperCase() == "SUCCESS") {
            $.extend(alertContent, {
                icon  : 'fa fa-lg fa-check-circle c-success',
                title : params.title ? params.title : 'Congratulation...!'
            });
        }
        else if (params.type.toUpperCase() == "WARNING") {
            $.extend(alertContent, {
                icon  : 'fa fa-lg fa-exclamation-triangle c-warning',
                title : params.title ? params.title : 'Warning...!'
            });
        }
        else if (params.type.toUpperCase() == "ERROR") {
            $.extend(alertContent, {
                icon  : 'fa fa-lg fa-exclamation-circle c-danger',
                title : params.title ? params.title : 'An Error Occurred...!'
            });
        }
        $.confirm(alertContent);
    }else{
        alert("EX-AALAAAlert : Please, provide appropriate content.");
    }
}
//============================================================================================================================
