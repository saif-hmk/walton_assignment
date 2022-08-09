/**
 * @Created_By : AALAA
 * @Date       : 2018.02.28 02:05:11 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum DecimalPlaceDigit {
    TWO  ("Two"),
    FOUR ("Four"),
    FULL ("Full")

    final String value

    DecimalPlaceDigit(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
