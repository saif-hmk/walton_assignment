/**
 * @Created_By : AALAA
 * @Date : 2017.07.18 09:06:18 PM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.hr

enum HrEmployeeType {
    MANAGEMENT_STAFF("Management Staff"),
    EMPLOYEE        ("Employee"        ),
    STAFF           ("Staff"           ),

    final String value

    HrEmployeeType(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
