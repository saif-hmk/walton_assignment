/**
 * @Created_By : AALAA
 * @Date       : 2018.02.28 02:10:14 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum FormatTimeLong {
    H_MM_SS     ("H:mm:ss"),
    HH_MM_SS    ("HH:mm:ss"),
    H_MM_SS_TT  ("h:mm:ss tt"),
    HH_MM_SS_TT ("hh:mm:ss tt")

    final String value

    FormatTimeLong(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
