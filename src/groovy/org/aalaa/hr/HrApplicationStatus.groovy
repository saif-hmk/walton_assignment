/**
 * @Created_By : AALAA
 * @Date : 2018.06.10 12:26:18 AM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.hr

enum HrApplicationStatus {
    APPLIED("Applied"),
    SHORT_LISTED("Short Listed"),
    CONFIRMED("Confirmed")

    final String value

    HrApplicationStatus(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
