/**
 * @Created_By   : AALAA
 * @Created_Date : 2017.01.17 01:02:03 AM
 * @Author       : Md. Hoshen Mahmud Khan
 * @Email        : saif_hmk@live.com
 * @Phone        : +8801672036757
 **/
/*======================================================================================================================================================*/

$("#btn_reset").prop("disabled", true);
var isValid = [0,0,0,0,0,0];

$(document).on("keyup", "#newPassword", function () {
    if(hasIc($(this).val())) {
        $(this).parent().addClass("has-error");
        $(this).siblings("label.newPassword").text("Invalid special character...!").show();
    }else{
        $(this).parent().removeClass("has-error");
        $(this).siblings("label.newPassword").text("").hide();
    }
});

var np  = document.getElementById("newPassword");   //new password
var lc  = document.getElementById("lc");            //lower case letter
var uc  = document.getElementById("uc");            //upper case letter
var nc  = document.getElementById("nc");            //number character
var cl  = document.getElementById("cl");            //character length

np.onkeyup = function() {
    // Validate lowercase letters
    var lowerCaseLetters = /[a-z]/g;
    if(np.value.match(lowerCaseLetters)) {
        lc.classList.remove("invalid");
        lc.classList.add("valid");
        isValid[0] = 1;
    } else {
        lc.classList.remove("valid");
        lc.classList.add("invalid");
        isValid[0] = 0;
    }

    // Validate capital letters
    var upperCaseLetters = /[A-Z]/g;
    if(np.value.match(upperCaseLetters)) {
        uc.classList.remove("invalid");
        uc.classList.add("valid");
        isValid[1] = 1;
    } else {
        uc.classList.remove("valid");
        uc.classList.add("invalid");
        isValid[1] = 0;
    }

    // Validate numbers
    var numbers = /[0-9]/g;
    if(np.value.match(numbers)) {
        nc.classList.remove("invalid");
        nc.classList.add("valid");
        isValid[2] = 1;
    } else {
        nc.classList.remove("valid");
        nc.classList.add("invalid");
        isValid[2] = 0;
    }

    // Validate special character
    var specialCharacters = /[!@#\$%^&]/g;
    if(np.value.match(specialCharacters)) {
        $("#sc").removeClass("invalid").addClass("valid");
        isValid[3] = 1;
    } else {
        $("#sc").removeClass("valid").addClass("invalid");
        isValid[3] = 0;
    }

    // Validate length
    if(np.value.length >= 8) {
        cl.classList.remove("invalid");
        cl.classList.add("valid");
        isValid[4] = 1;
    } else {
        cl.classList.remove("valid");
        cl.classList.add("invalid");
        isValid[4] = 0;
    }
    validateBtn();
}

$(document).on("keyup", "#confirmPassword", function () {
    var newPassword = $("#newPassword").val();
    var confirmPassword = $(this).val();
    if(newPassword != confirmPassword){
        $(this).parent().addClass("has-error");
        $(this).siblings("label.confirmPassword").text("Please ensure that password and confirm password are same...!").show();
        isValid[5] = 0;
    }else{
        $(this).parent().removeClass("has-error");
        $(this).siblings("label.confirmPassword").text("").hide();
        isValid[5] = 1;
    }
    validateBtn();
});

function hasIc(val){
    var r = false;
    if(val.replace(/[a-zA-Z0-9!@#$%^&]/g, '')) {
        r = true;
    }
    return r;
}

function getSum(input) {
    if (toString.call(input) !== "[object Array]")
        return false;

    var total = 0;
    for (var i = 0; i < input.length; i++) {
        if (isNaN(input[i])) {
            continue;
        }
        total += Number(input[i]);
    }
    return total;
}

function validateBtn() {
    if (!hasIc(np.value) && getSum(isValid) == 6) {
        $(".btn_pw").prop("disabled", false);
    }else{
        $(".btn_pw").prop("disabled", true);
    }
}

$(document).ready(function () {
    if (window.location.href.indexOf("/edit/") > -1) {
        $(".pw").removeAttr("required").siblings("label.required").removeClass("required");
    }
});

/*======================================================================================================================================================*/
$(document).ready(function () {
    if($.isUrlContains("create")){
        $("#createBtn").attr("disabled", "disabled");
    }
});

$(document).on('focusout', '#userName', function () {
    if (!$(this).val()) {
        alert("Please provide an user ID.");
        return null;
    }
    var controller = "commonAjax", action = "getUserByUserName"
    $.ajax({
        type: "POST",
        async: false,
        url: contextPath + "/" + controller + "/" + action,
        data: {
            userName: $(this).val()
        },
        success: function (response) {
            if (!response == "0" || !response == "null") {
                $("#user").val(response.split('~')[0]);
                $(".locationType").val(response.split('~')[1]);
                getLocationListByUserAndLocationType(response.split('~')[0], response.split('~')[1]);
            }
            else {
                alert("Please enter a valid user ID...!")
                $("#user").val(null);
                $(".locationType").val(null);
            }
        }
    });
});

$(document).on("keyup"   , "#username", function () {
    var username = $(this).val();
    if (username.length >= 3) {
        $("#createBtn").removeAttr("disabled");
        $("#lblErrMsg").empty();
        $(this).removeClass('errColor');
        checkUserName(username);
    }
    else {
        $("#createBtn").attr("disabled", "disabled");
        $("#lblErrMsg").html("User name must be at least 5 characters");
        $(this).addClass('errColor');
    }
});

function checkUserName(username) {
    if (username) {
        $.ajax({
            url: contextPath + "/commonAjax/getExistingUser",
            type: "POST",
            async: false,
            data: {userId: username},
            success: function (response) {
                if (response == "true") {
                    $("#createBtn").attr("disabled", "disabled");
                    $("#lblErrMsg").html("User already exist");
                    $("#username").addClass('errColor');
                }
                else {
                    $("#createBtn").removeAttr("disabled");
                    $("#lblErrMsg").empty();
                    $("#username").removeClass('errColor');
                }
            }
        });
    } else {
        console.log("Event is null");
    }
}
/*======================================================================================================================================================*/
