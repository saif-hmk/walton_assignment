/**
 * @Created_By : AALAA
 * @Date       : 2018.02.28 02:08:19 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum FirstDayOfWeek {
    SATURDAY  ("Saturday" ),
    SUNDAY    ("Sunday"   ),
    MONDAY    ("Monday"   ),
    TUESDAY   ("Tuesday"  ),
    WEDNESDAY ("Wednesday"),
    THURSDAY  ("Thursday" ),
    FRIDAY    ("Friday"   )

    final String value

    FirstDayOfWeek(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
