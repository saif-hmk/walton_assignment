/**
 * @Created_By  : AALAA
 * @Date        : 2016.03.17 3:51:15 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Geolocation.js
 * @Dependencies: Jquery.js, AALAA.js
 * @Dependencies: AALAA.js;
 * @LastModified: 18.05.04
 * @version     : 1.0
 **/
/*==================================================================================================================================================*/

function getLocation() {
    if (navigator.geolocation) {
        //todo-check:difference between watchPosition & getCurrentPosition
        navigator.geolocation.watchPosition(showPosition1);
        navigator.geolocation.getCurrentPosition(showPosition, showGeoError);
    } else {
        println("Geolocation is not supported by this browser.");
    }
}

function showPosition1(position) {
    var latLon = {};
    latLon.latitude  = position.coords.latitude;
    latLon.longitude = position.coords.longitude;
    println("Latitude: " + position.coords.latitude + "<br>Longitude: " + position.coords.longitude);
    return latLon
}

//<div id="mapholder"></div>
function showPosition(position) {
    var latLon = position.coords.latitude + "," + position.coords.longitude;
    var map_img_url = "https://maps.googleapis.com/maps/api/staticmap?" +
        "center=" + latLon +
        "&zoom=14" +
        "&size=400x300" +
        "&key='r-gt-adminLte'";
    //"&key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU";

    //usage :
    //document.getElementById("mapholder").innerHTML = "<img src='"+map_img_url+"'>";
}

//To use this code on your website, get a free API key from Google.
//Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp

function showGeoError(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            console.log("User denied the request for Geolocation.");
            break;
        case error.POSITION_UNAVAILABLE:
            console.log("Location information is unavailable.");
            break;
        case error.TIMEOUT:
            console.log("The request to get user location timed out.");
            break;
        case error.UNKNOWN_ERROR:
            console.log("An unknown error occurred.");
            break;
    }
}