/**
 * @Created_By : AALAA
 * @Date       : 2017.08.16 02:01:18 AM
 * @Author     : Md. Hoshen Mahmud Khan
 * @Email      : saif_hmk@live.com
 * @Phone      : +8801672036757
 **/

package org.aalaa.sys

enum Layout {
    BOXED  ("Boxed"),
    FIXED  ("Fixed")

    final String value

    Layout(String value) {
        this.value = value
    }

    String getKey() { name() }

    String toString() { value }
}