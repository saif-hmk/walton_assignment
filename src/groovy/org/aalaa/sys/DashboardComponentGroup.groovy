/**
 * @Created_By : AALAA
 * @Date       : 2021.11.27 07:50:10 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum DashboardComponentGroup {
    ENT                    ("Enrollment"                       ,  05),
    FDT                    ("Fund Management"                  ,  10),
    NM                     ("Notification Management"          ,  15),
    AUTH                   ("Authentication Management"        ,  20),
    COM                    ("Common"                           ,  25),
    RPT                    ("Report"                           ,  30),
    SYS                    ("System"                           ,  35),
    ANALYTICS              ("Analytics"                        ,  40),
    HR                     ("Human Resource"                   ,  45),
    PRL                    ("Payroll"                          ,  50),
    TL                     ("Time and Labour"                  ,  55),

    DE_STATUS_QUANTITATIVE ("Data Entry Status - Quantitative" , 105),
    DE_STATUS_ANALYTICAL   ("Data Entry Status - Analytical"   , 110),

    final String  value
    final Integer sortOrder

    DashboardComponentGroup(String value) {
        this.value = value
    }

    DashboardComponentGroup(String value, Integer sortOrder) {
        this.value     = value
        this.sortOrder = sortOrder
    }

    String getKey() { name() }

    @Override
    String toString() { value }
}
