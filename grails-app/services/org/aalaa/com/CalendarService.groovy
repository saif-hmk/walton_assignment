/**
 * @Created_By : AALAA
 * @Date       : 2015.09.11 11:20:10 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.com

import org.codehaus.groovy.grails.commons.GrailsApplication

import java.text.SimpleDateFormat

class CalendarService {
    GrailsApplication grailsApplication
    SimpleDateFormat  yy          = new SimpleDateFormat("yy"),
                      sdfDate
    Date              currentDate = new Date()

    String getFinancialYear(String yy) {
        Integer y = Integer.parseInt(yy)
        return "" + y + (y + 1)
    }

    String getKeyword(Date d, int q) {
        int i = Integer.parseInt(yy.format(d))
        if (q < 3)
            return "" + i + (i + 1) + "." + q
        else
            return "" + (i - 1) + i + "." + q
    }

    BigDecimal getDuration(Date startTime, Date endTime) {
        return (endTime.fastTime - startTime.fastTime)
    }

    BigDecimal getSecondDuration(Date startTime, Date endTime) {
        return getDuration(startTime, endTime) / 1000
    }

    BigDecimal getMinutesDuration(Date startTime, Date endTime) {
        return getSecondDuration(startTime, endTime) / 60
    }

    BigDecimal getHourDuration(Date startTime, Date endTime) {
        return getMinutesDuration(startTime, endTime) / 60
    }

    String getAge(Date date) {
        String age = null
        if (date) {
            Map a = getAgeLength(date)
            age = a.year + " Year" + (a.month && a.month > 0 ? ", " + a.month + " Month" : "") + (a.day && a.day > 0 ? " and " + a.day + " Day" : "") + "."
        }
        return age
    }

    Map getAgeLength(Date date) {
        //this is not ok.
        //todo validate leap year.
        Map ageLength = new LinkedHashMap()
        if (date) {
            int year  = currentDate[Calendar.YEAR]  - date[Calendar.YEAR],
                month = currentDate[Calendar.MONTH] - date[Calendar.MONTH],
                day   = currentDate[Calendar.DATE]  - date[Calendar.DATE]
            ageLength.put("year" , year)
            ageLength.put("month", month)
            ageLength.put("day"  , day)
        }
        return ageLength
    }

    Date getFormattedDate(String date){
        Date formattedDate = null
        if(date){
            SimpleDateFormat sdf = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
            formattedDate = sdf.parse(date)
        }
        return formattedDate
    }

    Date getFormattedDate(String date, String format){
        Date formattedDate = null
        if(date){
            SimpleDateFormat sdf = new SimpleDateFormat(format)
            formattedDate = sdf.parse(date)
        }
        return formattedDate
    }

    Calendar getModifiedDays(int days){ //eg: +7 or -5
        Calendar cal = Calendar.getInstance()
        cal.add(Calendar.DATE, days)          //WHERE s.start_date <= sysdate +7
        return cal //System.out.println("getForwardDate = "+ cal.getTime())
    }

    Calendar getModifiedDays(Date date, int days){ //eg: +7 or -5
        Calendar cal = Calendar.getInstance()
        cal.setTime(date)
        cal.add(Calendar.DATE, days)          //WHERE s.start_date <= sysdate +7
        return cal //System.out.println("getForwardDate = "+ cal.getTime())
    }

    Calendar getModifiedTime(Date date, Integer minute){ //eg: +7 or -5
        Calendar cal = Calendar.getInstance()
        cal.setTime(date)
        cal.add(Calendar.MINUTE, minute)          //WHERE s.start_date <= sysdate +7
        return cal //System.out.println("getForwardDate = "+ cal.getTime())
    }

    Date getModifiedDateTime(int year){
        Calendar cal = Calendar.getInstance()
        cal.add(Calendar.YEAR, year) // to get previous year add -1
        Date modifiedDateTime = cal.getTime()
        return modifiedDateTime
    }

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

    Date validateDateFormat(def requestedDate){
        Date date = null
        SimpleDateFormat dateParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.date)
        if(requestedDate?.getClass()?.getName().equals("java.sql.Timestamp")){
            date = requestedDate ? new Date(requestedDate.getTime()) : null
        }
        else{
            date = requestedDate ? dateParseFormat.parse(requestedDate) : null
        }
        return date
    }

    /**
     * @startFromDay : Add to move day;
     * @example      : 2 = Monday
     * @reference    : https://stackoverflow.com/questions/10429331/get-all-days-of-a-current-week
     * @usage        : getDaysOfCurrentWeek()
     * @result       : [2022-08-06, 2022-08-07, 2022-08-08, 2022-08-09, 2022-08-10, 2022-08-11, 2022-08-12]
     **/
    String[] getDaysOfCurrentWeek(int startFromDay = 0){
        Calendar now = Calendar.getInstance();

        //SimpleDateFormat dateParseFormat = new SimpleDateFormat(grailsApplication.config.format.dtp.date);
        SimpleDateFormat dateParseFormat = new SimpleDateFormat("yyyy-MM-dd");

        String[] days = new String[7];
        //int delta = -now.get(GregorianCalendar.DAY_OF_WEEK) + 2; //add 2 if your week start on monday
        int delta = -now.get(GregorianCalendar.DAY_OF_WEEK) + startFromDay; //add 2 if your week start on monday
        now.add(Calendar.DAY_OF_MONTH, delta );
        for (int i = 0; i < 7; i++)
        {
            days[i] = dateParseFormat.format(now.getTime());
            now.add(Calendar.DAY_OF_MONTH, 1);
        }
        //System.out.println(Arrays.toString(days));
        return days
    }
}
