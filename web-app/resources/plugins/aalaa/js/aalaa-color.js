/**
 * @Created_By  : AALAA
 * @Date        : 2016.05.24 9:55:17 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Color.js
 * @Dependencies: Jquery.js, AALAA.js
 * @LastModified: 18.05.04
 * @version     : 2.0
 **/
/*==================================================================================================================================================*/

var colors = {
    navyActive      : "#001A35",
    navy            : "#001f3f",
    navyDeep        : "#191970",
    blueActive      : "#005384",
    purpleDeep      : "#673AB7",
    purple1         : "#605CA8",
    purpleActive    : "#555299",
    indigo          : "#3F51B5",
    primary         : "#307095",
    lightBlueActive : "#357CA5",
    blueDeep        : "#0073b7",
    info            : "#0097BC",
    infoDeep        : "#3C8DBC",
    blue            : "#2196F3",
    blue1           : "#36A2EB",
    blueLight       : "#03A9F4",
    aquaActive      : "#00A7D0",
    aqua            : "#00C0EF",
    cyan            : "#00BCD4",
    tealLight       : "#39CCCC",
    tealActive      : "#30BBBB",
    white           : "#ffffff",
    gray1           : "#D2D6DE",
    grayActive      : "#B5BBC8",
    gray            : "#9E9E9E",
    blueGray        : "#607D8B",
    olive           : "#3D9970",
    teal            : "#009688",
    oliveActive     : "#368763",
    greenActive     : "#008D4C",
    success         : "#00733e",
    green           : "#00A65A",
    green1          : "#4CAF50",
    limeActive      : "#00E765",
    lime1           : "#01FF70",
    greenLight      : "#8BC3A4",
    lime            : "#CDDC39",
    yellow          : "#FFEB3B",
    yellowDeep      : "#FFCE56",
    amber           : "#FFC107",
    orange1         : "#F39C12",
    orange          : "#FF9800",
    orange2         : "#FF851B",
    orangeActive    : "#FF7701",
    yellowActive    : "#DB8B0B",
    warning         : "#C87F0A",
    orangeDeep      : "#FF5722",
    pink            : "#FF6384",
    fuchsia         : "#F012BE",
    fuchsiaActive   : "#DB0EAD",
    purple          : "#9C27B0",
    pinkDeep        : "#E91E63",
    maroonActive    : "#CA195A",
    maroon          : "#D81B60",
    red             : "#F44336",
    red1            : "#DD4B39",
    redActive       : "#d33724",
    danger          : "#C23321",
    brown           : "#795548",
    black1          : "#111111",
    black           : "#000000"
};

var colorsForChart = {
    // red   : 'rgba(255,  99, 132, 0.99)',
    // orange: 'rgba(255, 159, 064, 0.99)',
    // yellow: 'rgba(255, 205, 086, 0.99)',
    // green : 'rgba(075, 192, 192, 0.99)',
    // blue  : 'rgba(054, 162, 235, 0.99)',
    // purple: 'rgba(153, 102, 255, 0.99)',
    // grey  : 'rgba(201, 203, 207, 0.99)',

    blue      : 'rgba(054,162,235,0.99)',
    red       : "rgba(244, 67, 54,0.99)",
    purple    : 'rgba(153,102,255,0.99)',
    pink      : 'rgba(255, 99,132,0.99)',
    orange    : 'rgba(255,159,064,0.99)',
    green     : "rgba(  0,166, 90,0.99)",
    pest      : 'rgba( 75,192,192,0.99)',
    yellow    : 'rgba(255,205,086,0.99)',
    grey      : 'rgba(201,203,207,0.99)',
    purpleDeep: "rgba(103, 58,183,0.99)",
    fuchsia   : "rgba(240, 18,190,0.99)",
    lime      : "rgba(  0,231,101,0.99)",
    maroon    : "rgba(216, 27, 96,0.99)",
    navy      : "rgba(  0, 31, 63,0.99)",
    teal      : "rgba(  0,150,136,0.99)",
}

var chartColorKeys = Object.keys(colorsForChart);

function getChartColor(index) {
    return colorsForChart[chartColorKeys[index]];
}
/*======================================================================================================================================================*/
