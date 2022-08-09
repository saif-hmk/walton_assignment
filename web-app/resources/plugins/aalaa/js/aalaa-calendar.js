/**
 * @Created_By  : AALAA
 * @Date        : 2017.07.16 9:55:17 AM
 * @Author      : Md. Hoshen Mahmud Khan
 * @Email       : saif_hmk@live.com
 * @Phone       : +8801672036757
 *
 * @File        : AALAA-Calendar.js
 * @Dependencies: Jquery.js, AALAA.js
 * @LastModified: 18.03.03
 * @version     : 1.0
 **/
/*==================================================================================================================================================*/

var days        = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
    months      = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
    monthsShort = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    date        = new Date(),
    year        = date.getFullYear(),
    month       = date.getMonth(),
    hours       = date.getHours(),
    minutes     = Math.floor(date.getMinutes() / this.minuteStep) * this.minuteStep,
    seconds     = Math.floor(date.getSeconds() / this.secondStep) * this.secondStep,
    meridian    = 'AM';

if (this.showMeridian) {
    if (hours === 0) {
        hours = 12;
    } else if (hours >= 12) {
        if (hours > 12) {
            hours = hours - 12;
        }
        meridian = 'PM';
    } else {
        meridian = 'AM';
    }
}

this.hour     = hours;
this.minute   = minutes;
this.second   = seconds;
this.meridian = meridian;

//this.update();
/*======================================================================================================================================================*/
function getCurrentQuarter() {
    return Math.floor((month + 3) / 3);
}
function getStartDateOfCurrentQuarter() {
    return new Date(year, getCurrentQuarter() * 3 - 3, 1);
}
function getEndDateOfCurrentQuarter() {
    return new Date(year, getCurrentQuarter() * 3, 0);
}
function getRemainingDaysOfCurrentQuarter() {
    //todo: complete
    //return
}
function getRemainingDaysOfCurrentMonth() {
    //todo: complete
    //return
}
function getRemainingDaysOfCurrentWeek() {
    //todo: complete
    //return
}
function getOccupiedDays(fromDate, toDate) {
    //todo: complete
    //return
}
function getAge(fromDate) {
    //todo: complete
    //return
}
/*======================================================================================================================================================*/
function getDuration(outTime, inTime) {
    return new Date(new Date("01/01/2000 " + outTime).getTime() - new Date("01/01/2000 " + inTime).getTime()) / 60000;
}

function convertMinsToHrsMins(minutes) {
    var h = 0, m = minutes % 60, status = "p";
    if(minutes > 60){
        h = Math.floor(minutes / 60)
    }
    if (minutes >= 0) {
        status  = "p";
    }
    else{
        status  = "n";
        h = (h * -1);
        m = (m * -1);
    }
    h = h < 10 ? '0' + h : h;
    m = m < 10 ? '0' + m : m;
    return {
        hour    : h,
        minute  : m,
        status  : status
    };
}

function addTime(actualTime, minToBeAdded) {//(2019-03-02 14:07, 30)
    return new Date(actualTime.getTime() + (minToBeAdded * 60000));
}



/*
//todo convert : java to jQuery
Map getHhMmSs(Date date){
    Map m = new LinkedHashMap()
    if (date) {
        m.put("hour"  , (date.hours   < 10 ? "0" + date.hours   : date.hours.toString()))
        m.put("minute", (date.minutes < 10 ? "0" + date.minutes : date.minutes.toString()))
        m.put("second", (date.seconds < 10 ? "0" + date.seconds : date.seconds.toString()))
    }
    return m
}

Map getHhMmSs(Integer minute){
    Map m = new LinkedHashMap()
    if (minute) {
        m.put("hour", (minute - (minute % 60)) / 60)
        m.put("minute", Math.ceil(minute - m.hour * 60))
    }
    return m
}

Integer getDutyOnHhMm(Date dutyOn){
    return Integer.parseInt(getHhMmSs(dutyOn).hour + "" + getHhMmSs(dutyOn).minute)
}

Date getLocalOnTime(BapaStation station, Date dutyOn){
    return new Date(dutyOn.time + (station.gmtDifference * 60 * 1000))
}*/
/*======================================================================================================================================================*/
