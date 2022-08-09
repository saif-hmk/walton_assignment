/**
 * @Created_By : AALAA
 * @Date       : 2022.05.01 12:02:32 PM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.hr

class HrStaff extends HrEmployee{
    HrEmployeeType employeeType = HrEmployeeType.STAFF

    Float          ratePerHour,
                   limitPerMonth

    static constraints = {
        ratePerHour   nullable: true
        limitPerMonth nullable: true
    }
}
