/**
 @Created By : AALAA
 @Date       : 2017.02.11 11:28:55 AM

 @Author     : Md. Hoshen Mahmud Khan
 @Email      : saif_hmk@live.com
 @Phone      : +8801672036757
 **/
/*======================================================================================================================================================*/

/*

$(document).on('change', '.locCountry', function () {
    var id = $(this).val(), locDivision = $(this).parent().parent().parent().find(".locDivision").eq(0).attr("id");
    $(this).parent().parent().parent().find(".locCountry,.locProvinceState,.locDivision,.locCityCorporation,.locDistrict,.locSubDistrict,.locUnionCouncil,.locWard").empty().append("<option value=''>Select One</option>");
    if (id) {
        $.ajax({
            type    : 'POST',
            async   : false,
            url     : contextPath + "/commonAjax/filterLocationHierarchy",
            data    : {id: id, referenceType: 'COUNTRY'},
            success : function (r) {
                $("#" + locDivision).empty().append(r);
            }
        });
    }
});
$(document).on('change', '.locDivision', function () {
    var id = $(this).val(), locDistrict = $(this).parent().parent().parent().find(".locDistrict").eq(0).attr("id");
    $(this).parent().parent().parent().find(".locDistrict,.locSubDistrict,.locUnionCouncil,.locWard").empty().append("<option value=''>Select One</option>");
    if (id) {
        $.ajax({
            type    : 'POST',
            async   : false,
            url     : contextPath + "/commonAjax/filterLocationHierarchy",
            data    : {id: id, referenceType: 'DIVISION'},
            success : function (r) {
                $("#" + locDistrict).empty().append(r);
            }
        });
    }
});
$(document).on('change', '.locDistrict', function () {
    var id = $(this).val(), locSubDistrict = $(this).parent().parent().parent().find(".locSubDistrict").eq(0).attr("id");
    $(this).parent().parent().parent().find(".locSubDistrict,.locUnionCouncil,.locWard").empty().append("<option value=''>Select One</option>");
    if (id) {
        $.ajax({
            type    : 'POST',
            async   : false,
            url     : contextPath + "/commonAjax/filterLocationHierarchy",
            data    : {id: id, referenceType: 'DISTRICT'},
            success : function (r) {
                $("#" + locSubDistrict).empty().append(r);
            }
        });
    }
});
$(document).on('change', '.locSubDistrict', function () {
    var id = $(this).val(), locUnionCouncil = $(this).parent().parent().parent().find(".locUnionCouncil").eq(0).attr("id");
    $(this).parent().parent().parent().find(".locUnionCouncil,.locWard").empty().append("<option value=''>Select One</option>");
    if (id.length > 0) {
        $.ajax({
            type    : 'POST',
            async   : false,
            url     : contextPath + "/commonAjax/filterLocationHierarchy",
            data    : {id: id, referenceType: 'SUB_DISTRICT'},
            success : function (r) {
                $("#" + locUnionCouncil).empty().append(r);
            }
        });
    }
});
$(document).on('change', '.locUnionCouncil', function () {
    var id = $(this).val(), locWard = $(this).parent().parent().parent().find(".locWard").eq(0).attr("id");
    if (id) {
        $.ajax({
            type    : 'POST',
            async   : false,
            url: contextPath + "/commonAjax/filterLocationHierarchy",
            data: {id: id, referenceType: 'UNION_COUNCIL'},
            success: function (r) {
                $("#" + locWard).empty().append(r);
            }
        });
    }
});
*/

let locationHierarchy = {
    "locLocation"       : ["locCountry"                             ],
    "locCountry"        : ["locProvinceState", "locDivision"        ],
    "locProvinceState"  : ["locDivision"                            ],
    "locDivision"       : ["locDistrict"     , "locCityCorporation" ],
    "locCityCorporation": ["locWard"                                ],
    "locDistrict"       : ["locSubDistrict"                         ],
    "locSubDistrict"    : ["locMunicipality" , "locUnionCouncil"    ],
    "locMunicipality"   : ["locWard"                                ],
    "locUnionCouncil"   : ["locWard"                                ]
}

function getNextComponent(key){
    console.log(locationHierarchy[key]);
    return locationHierarchy[key];
}

function clearNextElements(element){

}

const locations = $(".locLocation");

console.log(locations);

$(document).on('change', ".locLocation,.locCountry,.locProvinceState,.locDivision,.locCityCorporation,.locDistrict,.locSubDistrict,.locUnionCouncil,.locWard", function () {
    var d = $(this), id = d.val(), referenceType = d.attr("referenceType"), nextComponents = getNextComponent(referenceType);

    if (id) {
        let r = loadChildLocations(id);
        //console.log(r);
        if(r.responseType == "REQUIRED_FIELD_MISSING"){
            alert("Please select required fields first!");
        }
        else if(r.responseType == "OK"){

            for (var l = 0; l < locations.length; l++){
                let location = locations[l];
                //console.log(location.);
            }

            for (var i = 0; i < nextComponents.length; i++){
                let component = "." + nextComponents[i];

                console.log(component);
                if($(document).hasClass(component)){
                    $(component).empty().append(r.response);
                    return;
                }
            }
        }
        else if(r.responseType == "ERROR"){
            alert("Something went wrong! Please try again later.");
            console.log(r.response);
        }
    }
});

function loadChildLocations(id) {
    let result = {};
    if (id) {
        $.ajax({
            type    : 'POST',
            async   : false,
            url     : contextPath + "/commonAjax/filterLocationHierarchy",
            data    : {id: id},
            success : function (r) {
                console.log(r);
                result.response     = r;
                result.responseType = "OK";
            },
            error: function (e, v) {
                result.response     = e;
                result.responseType = "ERROR";
                console.log(v);
            }
        });
    }
    else{
        result.responseType = "REQUIRED_FIELD_MISSING";
    }
    return result;
}
/*============================================================================================================================================*/
