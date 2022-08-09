/**
 * @Created_By : AALAA
 * @Date       : 2018.02.28 02:23:16 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum DecimalPlacePattern {
    CEIL    ("Ceil"),
    FLOOR   ("Floor"),
    AS_IT_IS("As it is")

    final String value

    DecimalPlacePattern(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}
