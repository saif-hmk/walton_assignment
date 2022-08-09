/**
 * @Created_By : AALAA
 * @Date : 2020.05.29 07:49:13 PM
 * @Author : Md. Hoshen Mahmud Khan
 * @Email : saif_hmk@live.com
 * @Phone : +8801672036757
 * */

package org.aalaa.nm

enum StatusSms {
    CANCELLED ("Cancelled"),
    PENDING   ("Pending"  ),
    SENT      ("Sent"     ),
    FAILED    ("Failed"   ),
    ERROR     ("Error"    ),
    UNHANDLED ("Unhandled"),

    final String value

    StatusSms(String value) {
        this.value = value
    }

    String getKey() { name() }

    @Override
    String toString() {
        return value
    }
}
