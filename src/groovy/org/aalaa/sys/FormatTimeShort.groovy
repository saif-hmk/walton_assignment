/**
 * @Created_By : AALAA
 * @Date       : 2018.02.28 02:17:18 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum FormatTimeShort {
    H_MM     ("H:mm"),
    HH_MM    ("HH:mm"),
    H_MM_TT  ("h:mm tt"),
    HH_MM_TT ("hh:mm tt")

    final String value

    FormatTimeShort(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
