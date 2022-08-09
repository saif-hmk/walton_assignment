/**
 * @Created_By : AALAA
 * @Date       : 2018.02.28 01:48:17 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum FormatNumber {
    INTERNATIONAL("###,###,###"),
    SOUTH_ASIAN  ("##,##,##,###")

    final String value

    FormatNumber(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
